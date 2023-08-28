import 'dart:convert';

import 'package:employee_info_practice/db_helper.dart';
import 'package:employee_info_practice/model.dart';
import 'package:flutter/material.dart';

class DataListPage extends StatefulWidget {
  const DataListPage({super.key});

  @override
  _DataListPageState createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  List<MyData> data = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final databaseHelper = DatabaseHelper();
    final dataList = await databaseHelper.getAllData();
    debugPrint("$dataList");
    setState(() {
      data = dataList;
    });
      for (var item in data) {
      print(item.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data List'),
      ),
      body: data.isEmpty
          ? const Text("No Data Found")
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${item.email}'),
                      Text('Address: ${item.address}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
