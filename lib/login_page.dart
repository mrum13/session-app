import 'package:flutter/material.dart';
import 'package:session_app/cubit/session_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_app/services/user_activity_tracker.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<SessionCubit>().setInit();
            UserActivityTracker.startTracking(context);
            Navigator.pushNamed(context, '/main');
          }, child: const Text('Login')),
      ),
    );
  }
}