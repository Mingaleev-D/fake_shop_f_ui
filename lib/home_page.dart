import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              Text(
                'Shoes\nCollections',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              TextField(),
            ],
          )
        ]),
      ),
    );
  }
}
