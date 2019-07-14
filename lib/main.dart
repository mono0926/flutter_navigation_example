import 'package:flutter/material.dart';
import 'package:navigation_example/model/counter.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() => runApp(
      ChangeNotifierProvider<Counter>(
        builder: (context) => Counter(),
        child: const App(),
      ),
    );
