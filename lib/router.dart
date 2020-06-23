import 'package:flutter/material.dart';
import 'package:navigation_example/pages/detail_page.dart';
import 'package:navigation_example/pages/list_page.dart';

class Router {
  static const root = '/';

  final _routes = <String, Widget Function(BuildContext, RouteSettings)>{
    root: (context, settings) => const ListPage(),
    DetailPage.routeName: (context, settings) =>
        DetailPage.wrapped(settings.arguments as DetailPageArgument),
  };

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final pageBuilder = _routes[settings.name];
    if (pageBuilder != null) {
      return MaterialPageRoute<void>(
        builder: (context) => pageBuilder(context, settings),
        settings: settings,
      );
    }

    assert(false, 'unexpected settings: $settings');
    return null;
  }
}
