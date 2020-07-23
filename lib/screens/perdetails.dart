import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PersonalDetails extends StatefulWidget {
  static const routeName = '/personaldetails';

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController;
  TextEditingController _nameController;
  TextEditingController _genderController;

  String _gender = '';
  String _fullName = '';
  String _email = '';

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser().then((value) {
      setState(() {
        _email = value['email'];
        _fullName = value['fullName'];
        _gender = value['gender'];

        _emailController = TextEditingController(text: _email);
        _nameController = TextEditingController(text: _fullName);
      });
      setState(() {
        _loading = false;
      });
    });
  }

  void _submitData() async {
    FocusScope.of(context).unfocus();
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final uid = user.uid;
    final phone = user.phoneNumber;
    print(phone);
    print(uid);
    final url = 'https://gurukrupa-472c8.firebaseio.com/$uid/profile.json';
    http.put(url,
        body: json.encode({
          'mobile': phone,
          'fullName': _fullName,
          'email': _email,
          'gender': _gender,
          'data': true,
        }));
    // Navigator.of(context).pushReplacementNamed('/homepage');
    print(_fullName);
    print(_email);
    print(_gender);
  }

  Future<Map> getUser() async {
    final user = await FirebaseAuth.instance.currentUser();
    final uid = user.uid;
    final response = await http
        .get('https://gurukrupa-472c8.firebaseio.com/$uid/profile.json');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ))
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Personal",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Details",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: 'Enter Full Name',
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'Full Name',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(0, 222, 161, 1),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter OTP';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                this._fullName = value;
                              });
                            },
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: 'abc@xyz.com',
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'Email Adress',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(0, 222, 161, 1),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter OTP';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                this._email = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Gender",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(0, 222, 161, 1),
                            ),
                          ),
                          RadioListTile(
                            activeColor: Theme.of(context).primaryColor,
                            value: 'Male',
                            groupValue: _gender,
                            title: Text(
                              'Male',
                              style: TextStyle(color: Colors.white),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: Theme.of(context).primaryColor,
                            value: 'Female',
                            groupValue: _gender,
                            title: Text(
                              'Female',
                              style: TextStyle(color: Colors.white),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              RaisedButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 70),
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                                child: Text(
                                  "Update",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 2),
                                ),
                                onPressed: () {
                                  _submitData();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
