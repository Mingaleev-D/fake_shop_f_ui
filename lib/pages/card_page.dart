/*
* @author : Mingaleev D
* @data : 10.12.2023
*/

import 'package:fake_shop_f_ui/providers/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPageWidget extends StatelessWidget {
  const CardPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CardProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cardItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cardItem['imageUrl'] as String),
              radius: 33,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Удаление из корзины',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 24),
                        ),
                        content:
                            const Text('Вы действительно хотите удалить?'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text(
                                'Отменить',
                              )),
                          TextButton(
                              onPressed: () {
                                Provider.of<CardProvider>(context,
                                        listen: false)
                                    .removeProduct(cardItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Да',
                              )),
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.delete_forever_rounded,
                color: Colors.red,
              ),
            ),
            title: Text(
              cardItem['title'].toString(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('размер: ${cardItem['sizes']}'),
          );
        },
      ),
    );
  }
}
