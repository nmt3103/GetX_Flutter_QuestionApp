import 'package:flutter/material.dart';
import 'package:flutter_questions_app/configs/themes/custom_text_styles.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({super.key, this.color, required this.time});
  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color ?? Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          time,
          style: countDownTimerTS().copyWith(color: color),
        )
      ],
    );
  }
}
