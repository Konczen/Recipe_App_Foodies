import 'package:flutter/material.dart';

import 'package:projectapp/screens/home_view/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Cardo'),
        home: Homeview());
  }
}
