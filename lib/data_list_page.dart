import 'package:employee_info_practice/db_helper.dart';
import 'package:flutter/material.dart';

class DataListPage extends StatefulWidget {
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
    print(dataList);
    setState(() {
      data = dataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data List'),
      ),
      body: data.length == 0
          ? Text("No Data Found")
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
