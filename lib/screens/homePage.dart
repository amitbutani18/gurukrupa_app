import 'package:flutter/material.dart';
import 'package:gurukrupa/widgets/mydrawer.dart';
import 'package:provider/provider.dart';
import 'package:gurukrupa/providers/gallaryprovider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final uid;

  HomePage(this.uid);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productData = Provider.of<GallaryProvider>(context);
    final photo = productData.photos;
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black26,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          "GuruKrupa",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i.postimg.cc/qMp63n7z/view-of-vintage-camera-325153.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Find Your Gadgets",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        child: Text(
                          "Show Products",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/product");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 18.0),
            //   child: Divider(
            //     color: Colors.grey,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                "Gallery",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    // fontFamily: 'Roboto',
                    letterSpacing: 1),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 18),
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: photo.length,
                itemBuilder: (_, i) => ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 150,
                    width: 150,
                    child: Image.network(
                      photo[i].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // Divider(
            //   color: Colors.grey,
            // ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://i.postimg.cc/bYFrm1Zs/ss-Google-Map-for-Gurner-Ave-v3.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            // fontFamily: 'Roboto',
                            letterSpacing: 1),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 18),
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        child: Text(
                          "Click To Get Loacation On Map",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/map');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Divider(
            //   color: Colors.grey,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                "Contact Us",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    // fontFamily: 'Roboto',
                    letterSpacing: 1),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "Address",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Container(
                      width: 270,
                      child: Text(
                        "3 - 4 , mahavir mantion, mohan ni chal, minibazar, Surat, Gujarat 395006 India",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Roboto',
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "Mobile ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 1),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Container(
                          width: 270,
                          child: Text(
                            "096876 72478",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                // fontFamily: 'Roboto',
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: RaisedButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          child: Text(
                            "Click To Call",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2),
                          ),
                          onPressed: () async {
                            const url = 'tel:+918347055891';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'could not launch $url';
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "Email   ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 1),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Container(
                          width: 270,
                          child: Text(
                            "gurukrupa.help@gmail.com",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                // fontFamily: 'Roboto',
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: RaisedButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          child: Text(
                            "Click To Mail",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2),
                          ),
                          onPressed: () async {
                            const url =
                                'mailto:gurukrupa.help@gmail.com?subject=Hello%20Gurukrupa&body=Write%20Something';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'could not launch $url';
                            }
                          },
                        ),
                      ),
                    ],
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
