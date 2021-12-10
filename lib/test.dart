import 'package:flutter/material.dart';
import 'package:simple_flutter_app/records.dart';

class SecondRoute extends StatefulWidget {

  final List<Map<String, dynamic>>? queryRows;

  const SecondRoute({Key? key, this.queryRows}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState(queryRows);
}

class _SecondRouteState extends State<SecondRoute> {

  List<Map<String, dynamic>>? queryRows;
  _SecondRouteState(this.queryRows);

  final List<Records> _records = [];

  void _queryAll() async {
    _records.clear();
    queryRows?.forEach((row) => _records.add(Records.fromMap(row)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _records.length + 1,
                itemBuilder: (context, int index) {
                  if (index == _records.length) {
                    return ElevatedButton(
                      child: const Text('Refresh'),
                      onPressed: () {
                        setState(() {
                          _queryAll();
                        });
                      },
                    );
                  }
                  return SizedBox(
                    height: 40,
                    child: Center(
                      child: Text(
                        '[${_records[index].id}] - ${_records[index].name} - ${_records[index].email} - ${_records[index].address} - ${_records[index].phone}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              )
            ),
          ],
        ),
      )
    );
  }
}
