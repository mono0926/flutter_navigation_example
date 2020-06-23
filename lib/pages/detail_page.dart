import 'package:flutter/material.dart';
import 'package:navigation_example/model/model.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage._({Key key}) : super(key: key);

  static const routeName = '/detail';

  static Widget wrapped(DetailPageArgument argument) {
    return ChangeNotifierProvider.value(
      value: argument.counter,
      child: const DetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Detail'),
      ),
      body: const Center(child: _CounterText()),
      floatingActionButton: const _IncrementActionButton(),
    );
  }
}

class _IncrementActionButton extends StatelessWidget {
  const _IncrementActionButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context, listen: false);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: counter.increment,
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Text(
      'count: ${counter.count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class DetailPageArgument {
  const DetailPageArgument({
    @required this.counter,
  });
  final Counter counter;
}
