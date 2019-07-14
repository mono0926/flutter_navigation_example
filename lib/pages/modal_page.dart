import 'package:flutter/material.dart';
import 'package:navigation_example/model/model.dart';
import 'package:provider/provider.dart';

import 'counter_page.dart';

class ModalPage extends StatelessWidget {
  const ModalPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      builder: (context) => Counter(),
      child: Navigator(
        onGenerateRoute: _Router().onGenerateRoute,
        initialRoute: _Router.root,
      ),
    );
  }
}

class _Router {
  static const root = 'modal/';
  static const push = '/push';
  static const modal = '/modal';

  final _routes = <String, Widget Function(BuildContext)>{
    push: (context) => const CounterPage(),
    root: (context) => const CounterPage(),
  };
  final _modalRoutes = <String, Widget Function(BuildContext)>{
    modal: (context) => const ModalPage(),
  };

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var pageBuilder = _routes[settings.name];
    if (pageBuilder != null) {
      return MaterialPageRoute<void>(
        builder: pageBuilder,
        settings: settings,
      );
    }

    pageBuilder = _modalRoutes[settings.name];
    if (pageBuilder != null) {
      return MaterialPageRoute<void>(
        builder: pageBuilder,
        settings: settings,
        fullscreenDialog: true,
      );
    }

    assert(false, 'unexpected settings: $settings');
    return null;
  }
}
