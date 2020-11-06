import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  DateTime date1 = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date1,
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != date1) {
      setState(() {
        date1 = picked;
        print(date1.toString());
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Date Picker'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
//                    'Date Value',
//                    style: TextStyle(fontSize: 20.0),
                    ('${date1.year} - ${date1.month} - ${date1.day}')
                        .toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  IconButton(
                    icon: Icon(Icons.date_range),
                    onPressed: () {
                      selectDate(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
