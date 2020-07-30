import 'package:flutter/material.dart';
import 'package:gurukrupa/providers/productprovider.dart';
import 'package:gurukrupa/screens/productview.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getProduct();
  }

  @override
  Widget build(BuildContext context) {
    // final productFromDb = Provider.of<ProductProvider>(context).getProduct();

    final productData = Provider.of<ProductProvider>(context);
    final products = productData.items;
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
                      Icons.arrow_back,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 98.0),
                    child: Center(
                      child: Text(
                        "Products",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.add,
                  //   ),
                  //   onPressed: () =>
                  //       Navigator.of(context).pushNamed('/additem'),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 3.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: products.length,
                  itemBuilder: (ctx, i) => InkWell(
                    onTap: () {
                      Navigator.of(ctx)
                          .pushNamed(ProductView.routeName, arguments: {
                        'title': products.values.toList()[i].title,
                        'imageUrl': products.values.toList()[i].imageUrl,
                        'price': products.values.toList()[i].price,
                        'description': products.values.toList()[i].description,
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.white)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            height: 150,
                            child: Image.network(
                              products.values.toList()[i].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    products.values.toList()[i].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "\u{20B9} " +
                                        products.values
                                            .toList()[i]
                                            .price
                                            .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RaisedButton.icon(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(color: Colors.black),
                                ),
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () async {
                                  var title1 =
                                      products.values.toList()[i].title;
                                  var photoUrl =
                                      products.values.toList()[i].imageUrl;
                                  var description =
                                      products.values.toList()[i].description;
                                  var price = products.values.toList()[i].price;
                                  final url =
                                      'https://wa.me/${918347055891}?text=*Title*%20%20$title1%0D%0A*Price*%20$price%0D%0A*Description*%20%20$description%0D%0A*Image*%20%20$photoUrl%0D%0A%0D%0A%0D%0Ais%20This%20Available?';
                                  ;
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'could not launch $url';
                                  }
                                },
                                label: Text(
                                  "Order Now",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // child: Container(
                    //   color: Color.fromRGBO(240, 248, 255, 1),
                    //   // elevation: 5.0,
                    //   child: Container(
                    //     // height: 100,
                    //     // padding: EdgeInsets.only(bottom: 5),
                    //     // alignment: Alignment.center,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: <Widget>[
                    //         Container(
                    //           padding: EdgeInsets.only(top: 8.0),
                    //           // height: 80,
                    //           // width: 70,
                    //           child: Image.network(
                    //             products[i].imageUrl,
                    //             fit: BoxFit.cover,
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 10,
                    //         ),
                    //         Text(
                    //           products[i].title,
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             color: Theme.of(context).accentColor,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
