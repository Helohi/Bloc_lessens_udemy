import 'package:bloc_test/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC With Stream'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.outputStateStream,
          initialData: _bloc.getColor,
          builder: (context, snapshot) => AnimatedContainer(
            height: 100,
            width: 100,
            color: snapshot.data,
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.eventRed);
            },
            backgroundColor: Colors.red,
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.eventGreen);
            },
            backgroundColor: Colors.green,
          )
        ],
      ),
    );
  }
}
