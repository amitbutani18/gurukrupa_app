import 'package:flutter/material.dart';
import 'package:gurukrupa/providers/gallaryprovider.dart';
import 'package:gurukrupa/providers/productprovider.dart';
import 'package:gurukrupa/screens/aboutusscreen.dart';
import 'package:gurukrupa/screens/addItem.dart';
import 'package:gurukrupa/screens/mapscreen.dart';
import 'package:gurukrupa/screens/perdetails.dart';
import 'package:gurukrupa/screens/productscreen.dart';
import 'package:gurukrupa/screens/productview.dart';
import 'package:gurukrupa/screens/youtubescreen.dart';
import 'package:gurukrupa/services/authService.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: GallaryProvider()),
        ChangeNotifierProvider.value(value: ProductProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          unselectedWidgetColor: Colors.white,
          disabledColor: Colors.blue,
          fontFamily: 'JosefinSans',
          primaryColor: Color.fromRGBO(69, 249, 198, 1),
          canvasColor: Color.fromRGBO(69, 249, 198, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthService().handleAuth(),
        routes: {
          '/personaldetails': (context) => PersonalDetails(),
          '/aboutus': (context) => AboutUsScreen(),
          '/youtube': (context) => YoutubeScreen(),
          '/map': (context) => MapScreen(),
          // '/help': (context) => HelpScreen(),
          '/product': (context) => ProductScreen(),
          '/additem': (context) => AddItem(),
          ProductView.routeName: (context) => ProductView(),
        },
      ),
    );
  }
}
