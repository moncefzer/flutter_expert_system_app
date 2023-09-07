import 'package:expert_system_app/controller/submit_cubit.dart';
import 'package:expert_system_app/models/question_model.dart';
import 'package:expert_system_app/resources/context_ext.dart';
import 'package:expert_system_app/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'answer_widget.dart';
import 'default_button.dart';

class QuestionPageWidget extends StatefulWidget {
  const QuestionPageWidget({
    super.key,
    required this.question,
    required this.pageController,
    required this.isLastPage,
  });

  final Question question;
  final PageController pageController;
  final bool isLastPage;

  @override
  State<QuestionPageWidget> createState() => _QuestionPageWidgetState();
}

class _QuestionPageWidgetState extends State<QuestionPageWidget> {
  List<String> selectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      height: 300,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            widget.question.text,
            style: context.titleLarge,
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              shrinkWrap: true,
              itemCount: widget.question.answers.length,
              itemBuilder: (context, index) {
                final answer = widget.question.answers[index];
                final isSelected = selectedAnswers.contains(answer);
                return AnswerWidget(
                  answer: answer,
                  isSelected: isSelected,
                  onPressed: () {
                    setState(() {
                      if (isSelected) {
                        selectedAnswers.remove(answer);
                      } else {
                        selectedAnswers.add(answer);
                      }
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 30.h),
          DefaultButton(
            text: widget.isLastPage ? 'Submit' : 'Next',
            onPressed: () {
              if (selectedAnswers.isEmpty) return;

              SubmitCubit.get(context).submitPage(
                widget.question,
                selectedAnswers,
                widget.isLastPage,
              );

              if (widget.isLastPage) {
                _showResult(context, widget.pageController);
                return;
              }

              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.linearToEaseOut,
              );
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showResult(
      BuildContext context, PageController pageController) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          insetPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 30.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: Container(
            width: 0.95.sw,
            height: 0.6.sh,
            color: Colors.white,
            child: ResultWidget(pageController: pageController),
          ),
        );
      },
    );
  }
}
