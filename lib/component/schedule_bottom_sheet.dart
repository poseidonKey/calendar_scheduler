import 'package:calendar_scheduler/component/custom_text_field.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomInset),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Time(),
                  const SizedBox(
                    height: 16,
                  ),
                  const Expanded(child: _Content()),
                  const SizedBox(
                    height: 16,
                  ),
                  _ColorPicker(),
                  const SizedBox(
                    height: 8,
                  ),
                  const _SaveButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 10,
      children: [
        renderColor(Colors.red),
        renderColor(Colors.yellow),
        renderColor(Colors.indigo),
        renderColor(Colors.green),
        renderColor(Colors.blue),
        renderColor(Colors.green),
      ],
    );
  }

  Widget renderColor(Color color) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      width: 32,
      height: 32,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: PRIMARY_COLOR),
            onPressed: () {},
            child: const Text('저장'),
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      label: '내용',
      isTime: false,
    );
  }
}

class _Time extends StatelessWidget {
  const _Time();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: CustomTextField(
          label: '시작 시간',
          isTime: true,
        )),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: CustomTextField(
          label: '마감 시간',
          isTime: true,
        )),
      ],
    );
  }
}
