import 'package:flutter/material.dart';
import 'package:navigation_example/model/model.dart';
import 'package:provider/provider.dart';

import 'detail_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Example'),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, i) => ChangeNotifierProvider(
          builder: (context) => Counter(),
          child: _Tile(index: i),
        ),
        separatorBuilder: (context, _) => const Divider(height: 0),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return ListTile(
      title: Text('Counter $index'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${counter.count}',
            style: Theme.of(context).textTheme.subhead,
          ),
          const SizedBox(width: 16),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.add),
            onPressed: counter.increment,
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          DetailPage.routeName,
          arguments: DetailPage.toRouteArguments(counter),
        );
      },
    );
  }
}