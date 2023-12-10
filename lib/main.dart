import 'package:fake_shop_f_ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/card_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true).copyWith(
          textTheme:
              Theme.of(context).textTheme.apply(fontFamily: "Nunitosans"),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(186, 187, 187, 1.0),
          ),
        ),
        //title: 'Material App',
        home: const HomePage(),
      ),
    );
  }
}
