import 'package:flutter/material.dart';

import 'router.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
//      home: const HomePage(),
      initialRoute: Router.root,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
