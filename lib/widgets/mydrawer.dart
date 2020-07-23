import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gurukrupa/services/authService.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String _userName = '';
  String _phone = '';
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser().then((value) {
      setState(() {
        _userName = value['fullName'];
        _phone = value['mobile'];
      });
      setState(() {
        _loading = false;
      });
    });
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
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          );
        }
        return _loading
            ? Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ))
            : SizedBox(
                width: size.width,
                child: Drawer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 18.0),
                        alignment: Alignment.center,
                        height: 100,
                        width: size.width,
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "MENU",
                          // futureSnapshot.data.phoneNumber,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(40)),
                                ),
                                height: size.height - 100,
                                width: size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 28.0,
                                          right: 28,
                                          top: 28,
                                          bottom: 7),
                                      child: Container(
                                        child: Text(
                                          "Welcome",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 28,
                                        bottom: 50,
                                      ),
                                      child: Text(
                                        _userName == '' ? _phone : _userName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      child: Card(
                                        elevation: 0,
                                        color: Color.fromRGBO(16, 16, 16, 1),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color:
                                                Color.fromRGBO(16, 16, 16, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: ListTile(
                                          leading: Container(
                                            // padding: EdgeInsets.only(left: 40),
                                            child: Icon(
                                              Icons.account_box,
                                              size: 30,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 3),
                                            child: Text(
                                              'Profile',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green[50],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          // trailing: Icon(Icons.arrow_forward,
                                          //     color: Colors.green),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context)
                                                .pushNamed('/personaldetails');
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5,
                                          left: 50,
                                          right: 50,
                                          top: 5),
                                      child: Card(
                                        elevation: 0,
                                        color: Color.fromRGBO(16, 16, 16, 1),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color:
                                                Color.fromRGBO(16, 16, 16, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: ListTile(
                                          leading: Container(
                                            // padding: EdgeInsets.only(left: 40),
                                            child: Image.asset(
                                              'assets/images/youtube.png',
                                              height: 35,
                                            ),
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 3),
                                            child: Text(
                                              'Youtube Channel',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green[50],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          // trailing: Icon(Icons.arrow_forward,
                                          //     color: Colors.green),
                                          onTap: () async {
                                            // const url =
                                            //     'https://www.youtube.com/channel/UCVgrOk33xyjLsx_qio4UcaQ/featured';
                                            // if (await canLaunch(url)) {
                                            //   await launch(url);
                                            // } else {
                                            //   throw 'could not launch $url';
                                            // }
                                            Navigator.of(context)
                                                .pushNamed('/youtube');
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5, left: 50, right: 50),
                                      child: Card(
                                        elevation: 0,
                                        color: Color.fromRGBO(16, 16, 16, 1),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color:
                                                Color.fromRGBO(16, 16, 16, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: ListTile(
                                          leading: Container(
                                            // padding: EdgeInsets.only(left: 40),
                                            child: Image.asset(
                                              'assets/images/aboutUs.png',
                                              height: 28,
                                            ),
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 3),
                                            child: Text(
                                              'About Us',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green[50],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          // trailing: Icon(Icons.arrow_forward,
                                          //     color: Colors.green),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context)
                                                .pushNamed('/aboutus');
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5, left: 50, right: 50),
                                      child: Card(
                                        elevation: 0,
                                        color: Color.fromRGBO(16, 16, 16, 1),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color:
                                                Color.fromRGBO(16, 16, 16, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: ListTile(
                                          leading: Container(
                                              // padding: EdgeInsets.only(left: 40),
                                              child: Icon(
                                            Icons.help,
                                            size: 30,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 3),
                                            child: Text(
                                              'Help',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green[50],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          // trailing: Icon(Icons.arrow_forward,
                                          //     color: Colors.green),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context)
                                                .pushNamed('/help');
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5, left: 50, right: 50),
                                      child: Card(
                                        elevation: 0,
                                        color: Color.fromRGBO(16, 16, 16, 1),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color:
                                                Color.fromRGBO(16, 16, 16, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: ListTile(
                                          leading: Container(
                                              // padding: EdgeInsets.only(left: 40),
                                              child: Icon(
                                            Icons.exit_to_app,
                                            size: 30,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 3),
                                            child: Text(
                                              'Sign Out',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green[50],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          // trailing: Icon(Icons.arrow_forward,
                                          //     color: Colors.green),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            AuthService().signOut();
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Contact Us ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Image.asset(
                                              'assets/images/facebook.png'),
                                          onPressed: () async {
                                            const url =
                                                'https://www.facebook.com/vivek.sorathiya.39';
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'could not launch $url';
                                            }
                                          },
                                        ),
                                        IconButton(
                                          icon: Image.asset(
                                            'assets/images/instagram.png',
                                            height: 23,
                                          ),
                                          onPressed: () async {
                                            const url =
                                                'https://www.instagram.com/__vk_sorathiya__/';
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'could not launch $url';
                                            }
                                          },
                                        ),
                                        IconButton(
                                          icon: Image.asset(
                                            'assets/images/twitter.png',
                                            height: 30,
                                          ),
                                          onPressed: () async {
                                            const url =
                                                'https://twitter.com/viveksorathiya3';
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'could not launch $url';
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "From",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Amitbutani18",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                letterSpacing: 2),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "All rights reserved by gurukrupa electronics - 2020",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
