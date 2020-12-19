import 'package:flutter/material.dart';
import 'package:webview_wrapper/screens/home_screen.dart';
import 'package:webview_wrapper/screens/webview_wrapper.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    routes: {
      '/home': (_) => HomeScreen(),
      '/web': (_) => WebViewWrapper(),
    }
  ));
}
