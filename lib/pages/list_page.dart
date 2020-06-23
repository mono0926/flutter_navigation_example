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
        itemCount: 100,
        itemBuilder: (context, i) => ChangeNotifierProvider(
          key: ValueKey(i),
          builder: (context) => Counter(),
          child: _Tile(
            index: i,
          ),
        ),
        separatorBuilder: (context, _) => const Divider(height: 0),
      ),
    );
  }
}

class _Tile extends StatefulWidget {
  const _Tile({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<_Tile> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final counter = Provider.of<Counter>(context);
    return ListTile(
      title: Text('Counter ${widget.index}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${counter.count}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(width: 16),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: const Icon(Icons.add),
            onPressed: counter.increment,
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          DetailPage.routeName,
          arguments: DetailPageArgument(counter: counter),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive =>
      Provider.of<Counter>(context, listen: false).count > 0;
}
