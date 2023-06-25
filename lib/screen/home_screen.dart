import 'package:calendar_scheduler/component/main_calendar.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      floatingActionButton: renderFloatingActionButton(),
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              onDaySelected: onDaySelected,
              selectedDate: selectedDate,
              focusedDay: focusedDay,
            ),
            const SizedBox(
              height: 8,
            ),
            TodayBanner(selectedDate: DateTime.now(), scheduleCount: 3),
            const SizedBox(
              height: 8,
            ),
            _ScheduleList()
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay;
      focusedDay = selectedDay;
    });
  }

  Expanded _ScheduleList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.separated(
          itemCount: 13,
          itemBuilder: (context, index) {
            return ScheduleCard(
              content: '프로그래밍 공부하기 $index',
              endTime: 13,
              scheduleCount: 3,
              startTime: 12,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8.0);
          },
        ),
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: PRIMARY_COLOR,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return const ScheduleBottomSheet();
            });
      },
      child: const Icon(Icons.add),
    );
  }
}
