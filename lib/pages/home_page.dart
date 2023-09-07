import 'package:expert_system_app/controller/submit_cubit.dart';
import 'package:expert_system_app/models/question_model.dart';
import 'package:expert_system_app/widgets/question_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_constants.dart';
import '../widgets/progress_pip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void handlePageChange(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final stepWidth = (1 / (kQuestions.isEmpty ? 1 : kQuestions.length)).sw;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProgressPipe(currentPage: currentPage, stepWidth: stepWidth),
          Expanded(
            child: PageView(
              scrollBehavior: AppScrollBehavior(),
              physics: const NeverScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              onPageChanged: handlePageChange,
              controller: _pageController,
              children: [
                for (int index = 0; index < kQuestions.length; index++)
                  QuestionPageWidget(
                    question: kQuestions[index],
                    pageController: _pageController,
                    isLastPage: index == kQuestions.length - 1,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Expert System',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        TextButton(
          onPressed: () {
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            );
            SubmitCubit.get(context).cancelAllData();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
