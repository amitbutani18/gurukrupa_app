import 'package:flutter/material.dart';
import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  static const routeName = '/youtube';
  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Our Youtube channle',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://www.youtube.com/channel/UCVgrOk33xyjLsx_qio4UcaQ/featured',
      ),
    );
  }
}
