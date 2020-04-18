import 'package:flutter/material.dart';
import 'package:navigation_example/model/model.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage._({
    Key key,
    @required this.counter,
  }) : super(key: key);

  // 誤検知っぽい(const付けるとas実行時エラーになる)
  // ignore: prefer_const_constructors_in_immutables
  DetailPage.fromRouteArguments(Object object)
      : this._(counter: object as Counter);

  static Object toRouteArguments(Counter counter) => counter;

  final Counter counter;

  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: counter,
      child: const _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({Key key}) : super(key: key);
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
