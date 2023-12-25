import 'package:bloc_test/cubit/internet_cubit.dart';
import 'package:bloc_test/widgets/action_buttons.dart';
import 'package:bloc_test/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ConnectionCubit, MyConnectionState>(
          builder: (context, state) => state.connected
              ? const Text('User List (online)')
              : const Text(
                  'Offline',
                  style: TextStyle(color: Colors.redAccent),
                ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ActionButtons(),
          Expanded(
            child: UserList(),
          ),
        ],
      ),
    );
  }
}
