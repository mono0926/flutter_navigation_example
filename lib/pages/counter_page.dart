import 'package:flutter/material.dart';
import 'package:navigation_example/widgets/widgets.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final rootNavigator = Navigator.of(context, rootNavigator: true);
    final navigator = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: rootNavigator == navigator
            ? []
            : [
                IconButton(
                  icon: const Icon(Icons.close),
                  tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                  onPressed: rootNavigator.maybePop,
                )
              ],
        title: Text(ModalRoute.of(context).settings.name),
      ),
      floatingActionButton: const IncrementActionButton(),
      body: Center(child: const Body()),
    );
  }
}
