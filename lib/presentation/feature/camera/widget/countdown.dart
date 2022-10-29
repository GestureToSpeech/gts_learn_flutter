import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';

class Countdown extends StatefulWidget {
  const Countdown({
    super.key,
    this.countdownTime = 3,
    required this.onFinished,
  });

  final int countdownTime;
  final VoidCallback onFinished;

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late Timer timer;
  late int timeLeft;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: timeLeft == 0 ? 0 : 1,
      duration: const Duration(milliseconds: 500),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: AppColors.mainText.withOpacity(0.2)),
        child: Center(
          child: Text(
            timeLeft == 0 ? 'Start!' : timeLeft.toString(),
            style:
                appTextTheme().tabletHeadline1.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      timeLeft = widget.countdownTime;
    });
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSecond,
      (Timer timer) {
        if (--timeLeft == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {});
        }
      },
    );
  }
}
