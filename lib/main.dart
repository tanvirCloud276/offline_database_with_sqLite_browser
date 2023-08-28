import 'package:flutter/material.dart';
import 'data_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Flutter App',
      home: DataListPage(), // Initial page to display data
    );
  }
}
