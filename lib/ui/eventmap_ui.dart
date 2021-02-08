import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventMapUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: 'https://www.leedsfestival.com/map',
      ),
    );
  }
}
