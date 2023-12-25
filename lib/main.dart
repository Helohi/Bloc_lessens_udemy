import 'package:bloc_test/bloc/user_bloc.dart';
import 'package:bloc_test/cubit/internet_cubit.dart';
import 'package:bloc_test/pages/home_page.dart';
import 'package:bloc_test/services/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(userRepository: UserRepository())
              ..add(UserLoadEvent()),
          ),
          BlocProvider(create: (context) => ConnectionCubit())
        ],
        child: const HomePage(),
      ),
    );
  }
}
