import 'package:flutter/material.dart';
import 'package:navigation_example/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Example'),
      ),
      floatingActionButton: const IncrementActionButton(),
      body: Center(
        child: const CounterText(),
      ),
    );
  }
}
