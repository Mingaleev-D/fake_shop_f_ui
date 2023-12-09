import 'package:fake_shop_f_ui/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: "Nunitosans"),
      ),
      //title: 'Material App',
      home: HomePage(),
    );
  }
}
