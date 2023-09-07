import 'package:flutter/material.dart';

class ProgressPipe extends StatelessWidget {
  const ProgressPipe({
    super.key,
    required this.currentPage,
    required this.stepWidth,
  });

  final int currentPage;
  final double stepWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.3),
      child: Stack(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.4),
            width: double.infinity,
            height: 5,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 5,
            width: (currentPage + 1) * stepWidth,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}
