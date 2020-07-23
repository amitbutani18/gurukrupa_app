import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/map';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Gurukrupa Shop Location',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://www.google.com/maps/place/GURUKRUPA+ELECTRONICS+%26+CCTV/@21.210065,72.8518787,17.96z/data=!4m5!3m4!1s0x3be04f5f5b90d763:0x2856b0e6079a53e1!8m2!3d21.2102017!4d72.8531669',
      ),
    );
  }
}
