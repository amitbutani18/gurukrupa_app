import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '/aboutus';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.close,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 78.0),
                    child: Center(
                      child: Text(
                        "ABOUT US",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 28.0, left: 28, right: 8, bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Gurukrupa Electronics since 1998",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McCliions 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.. comes from a line in section 1.10.32.he standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Our Team",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/profile.jpg'),
                                  radius: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Vivek Sorathiya",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 0,
                            ),
                            Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/profile.jpg'),
                                  radius: 30,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 8),
                                  child: Text(
                                    "Vivek Sorathiya",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 0,
                            ),
                            Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/profile.jpg'),
                                  radius: 30,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 8),
                                  child: Text(
                                    "Vivek Sorathiya",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Business Hours",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Mon:	10:30 AM – 9:30 PM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Tue:	 10:30 AM – 9:30 PM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Wed:	10:30 AM – 9:30 PM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Thu:	 10:30 AM – 9:30 PM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Fri:	  10:30 AM – 9:30 PM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sat:	 10:30 AM – 9:30 PM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sun:	 10:30 AM – 9:30 PM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Our Branches",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Surat, Rajkot, Ahemdabad, Mumbai",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
