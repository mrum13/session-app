import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_app/cubit/session_cubit.dart';
import 'package:session_app/cubit/single_data_cubit.dart';
import 'package:session_app/services/user_activity_tracker.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var value = "-";
    return BlocListener<SessionCubit, SessionState>(
      listener: (context, state) {
        if (state is SessionOut) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.message)));
          
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SingleDataCubit, SingleDataState>(
                builder: (context, state) {
                  if (state is SingleDataSuccess) {
                    value = state.data;
                    UserActivityTracker.onUserActivity(context);
                    return Text(value);
                  } else if (state is SingleDataLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Text(value);
                  }
                },
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<SingleDataCubit>().getSingleData();
                  },
                  child: const Text('Get Data'))
            ],
          ),
        ),
      ),
    );
  }
}
