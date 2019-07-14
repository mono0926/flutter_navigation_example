import 'package:flutter/material.dart';

import 'pages/counter_page.dart';
import 'pages/home_page.dart';
import 'pages/modal_page.dart';

class Router {
  static const root = '/';
  static const push = '/push';
  static const modal = '/modal';

  final _routes = <String, Widget Function(BuildContext)>{
    root: (context) => const HomePage(),
    push: (context) => const CounterPage(),
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
