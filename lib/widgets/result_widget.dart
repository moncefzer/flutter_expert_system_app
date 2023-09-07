import 'package:expert_system_app/resources/context_ext.dart';
import 'package:expert_system_app/resources/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../controller/submit_cubit.dart';
import '../resources/app_constants.dart';
import 'default_button.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmitCubit, SubmitState>(
      builder: (context, state) {
        if (state is SubmitLoaded) {
          var results = state.result.results;

          if (results.isEmpty) {
            return _buildNoResult(context);
          }

          return _buildResult(context, results);
        }

        return LottieBuilder.asset('assets/loading1.json');
      },
    );
  }

  Padding _buildResult(BuildContext context, List<String> results) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(showResultText, style: context.titleLarge),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final speciality = results[index];
                return Text(
                  "${index + 1}- ${speciality.splitCamelCase()}",
                  style: context.titleLarge.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.pink,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 15.h),
              itemCount: results.length,
            ),
          ),
          SizedBox(height: 10.h),
          DefaultButton(
            onPressed: () async {
              Navigator.pop(context);
              await Future.delayed(const Duration(milliseconds: 200));
              pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeIn,
              );
            },
            text: 'Done',
          )
        ],
      ),
    );
  }

  Center _buildNoResult(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Spacer(flex: 1),
            Text(
              'Your provided data didn\'t match any of our profiles ,Please try to r-enter your data so we could help you make your choice',
              style: context.titleLarge.copyWith(height: 2),
            ),
            const Spacer(flex: 5),
            DefaultButton(
              onPressed: () async {
                Navigator.pop(context);
                await Future.delayed(const Duration(milliseconds: 200));
                pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn,
                );
              },
              text: 'Done',
            )
          ],
        ),
      ),
    );
  }
}
