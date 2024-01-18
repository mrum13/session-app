import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_app/cubit/session_cubit.dart';
import 'package:session_app/cubit/single_data_cubit.dart';
import 'package:session_app/login_page.dart';
import 'package:session_app/main_page.dart';
import 'package:session_app/services/user_activity_tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => SingleDataCubit())),
        BlocProvider(create: ((context) => SessionCubit())),
      ],
      child: MaterialApp(
        routes: {
          '/':(context) => const LoginPage(),
          '/main':(context) => const MainPage()
        },
      ),
    );
  }
}
