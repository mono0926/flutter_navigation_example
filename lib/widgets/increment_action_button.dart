import 'package:flutter/material.dart';
import 'package:navigation_example/model/counter.dart';
import 'package:provider/provider.dart';

class IncrementActionButton extends StatelessWidget {
  const IncrementActionButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context, listen: false);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: counter.increment,
    );
  }
}
