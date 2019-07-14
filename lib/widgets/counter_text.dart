import 'package:flutter/material.dart';
import 'package:navigation_example/model/counter.dart';
import 'package:provider/provider.dart';

class CounterText extends StatelessWidget {
  const CounterText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Text(
      'count: ${counter.count}',
      style: Theme.of(context).textTheme.display1,
    );
  }
}
