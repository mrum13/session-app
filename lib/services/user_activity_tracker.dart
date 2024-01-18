import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_app/cubit/session_cubit.dart';

class UserActivityTracker {
  static const Duration inactivityDuration = Duration(seconds: 5);
  static Timer? _timer;

  static void startTracking(BuildContext context) {
    resetTimer(context);
  }

  static void resetTimer(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(inactivityDuration, () {
      // Trigger logout logic here
      context.read<SessionCubit>().setSession();
      print("session habis");
    });
  }

  static void onUserActivity(BuildContext context) {
    resetTimer(context);
  }
}
