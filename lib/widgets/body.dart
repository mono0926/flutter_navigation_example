import 'package:flutter/material.dart';
import 'package:navigation_example/widgets/widgets.dart';

import '../router.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          child: const Text('Modal'),
          onPressed: () {
            Navigator.of(context).pushNamed(Router.modal);
          },
        ),
        RaisedButton(
          child: const Text('Push'),
          onPressed: () {
            Navigator.of(context).pushNamed(Router.push);
          },
        ),
        const CounterText(),
      ],
    );
  }
}
