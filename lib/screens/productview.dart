import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductView extends StatefulWidget {
  static const routeName = '/productview';

  // final String title;
  // final String imageUrl;
  // final double price;
  // final String description;

  // ProductView(this.title, this.imageUrl, this.price, this.description);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  var _loadedInitData = false;
  String productTitle;
  String imageUrl;
  String description;
  double price;
  // final String description;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      productTitle = routeArgs['title'];
      imageUrl = routeArgs['imageUrl'];
      price = routeArgs['price'];
      description = routeArgs['description'];
      _loadedInitData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          productTitle,
          style: TextStyle(fontFamily: 'Roboto', fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  child: Image.network(imageUrl),
                  color: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Price    ",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Text(
                        "\u{20B9} " + price.toString() + " /-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Description",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    description,
                    style: TextStyle(
                        height: 1.5,
                        // fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  child: Text(
                    "Order Now",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 2),
                  ),
                  onPressed: () async {
                    final url =
                        'https://wa.me/${918347055891}?text=Title%20%20*$productTitle*%0D%0APrice%20*$price*%0D%0ADescription%20%20$description%0D%0AImage%20%20$imageUrl%0D%0A%0D%0A%0D%0Ais%20This%20Available?';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
