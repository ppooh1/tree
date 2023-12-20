import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tree View Example'),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
        ),
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

final List<Entry> data = <Entry>[
  Entry(
    'Directory A',
    <Entry>[
      Entry(
        'Subdirectory A1',
        <Entry>[
          Entry('File A1.1'),
          Entry('File A1.2'),
        ],
      ),
      Entry('Subdirectory A2'),
    ],
  ),
  Entry(
    'Directory B',
    <Entry>[
      Entry('Subdirectory B1'),
      Entry('Subdirectory B2'),
    ],
  ),
];