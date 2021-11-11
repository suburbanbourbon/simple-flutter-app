import 'package:flutter/material.dart';
import 'package:simple_flutter_app/database_helper.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String? _name;
  String? _email;
  String? _address;
  String? _phoneNumber;
  TextEditingController _delidController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
              ).hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildAdd() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _address = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone number',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Phone number is Required';
        }
        if (value.length != 10) {
          return 'Mobile Number must be of 10 digit';
        }

        return null;
      },
      onSaved: (String? value) {
        _phoneNumber = value!;
      },
    );
  }

  Widget _buildDeleteRecord() {
    return TextFormField(
      controller: _delidController,
      decoration: InputDecoration(
        labelText: 'Row id',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Form")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildName(),
                    SizedBox(height: 10),
                    _buildEmail(),
                    SizedBox(height: 10),
                    _buildAdd(),
                    SizedBox(height: 10),
                    _buildPhoneNumber(),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 16
                        ),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }

                        _formKey.currentState!.save();

                        int? i = await DatabaseHelper.instance.insert({
                          DatabaseHelper.columnName : _name,
                          DatabaseHelper.columnEmail : _email,
                          DatabaseHelper.columnAddress : _address,
                          DatabaseHelper.columnPhone : _phoneNumber,
                        });

                        print('The inserted id is $i');
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 1),
                  _buildDeleteRecord(),
                  SizedBox(height: 1),
                  ElevatedButton(
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 16
                        ),
                      ),
                      onPressed: () async {
                        // int? _delid = int?._delidController.text;
                        // int? i = await DatabaseHelper.instance.delete(_delid);
                        // print('Rows effected: $i');
                      },
                  ),
                  ElevatedButton(
                      child: Text(
                        'Display',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 16
                        ),
                      ),
                      onPressed: () async {
                        List<Map<String, dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
                        print(queryRows);
                      },
                  ),
                  ElevatedButton(
                      child: Text(
                        'Delete DB',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 16
                        ),
                      ),
                      onPressed: () async {
                        bool value = await DatabaseHelper.instance.deleteDb();
                        print(value);
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}