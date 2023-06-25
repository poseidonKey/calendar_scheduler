import 'package:flutter/material.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDate;
  final int scheduleCount;
  const TodayBanner(
      {super.key, required this.selectedDate, required this.scheduleCount});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
    );
    return Container(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}",
              style: textStyle,
            ),
            Text(
              "$scheduleCount개",
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}
