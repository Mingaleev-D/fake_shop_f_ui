import 'package:fake_shop_f_ui/providers/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsDetailsPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductsDetailsPage({super.key, required this.product});

  @override
  State<ProductsDetailsPage> createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  int selectedSize = 0;

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CardProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': selectedSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Товар успешно добавлен в корзину')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пожалуйста, выберите размер')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация о продукте',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              height: 250,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(241, 235, 235, 1.0),
                borderRadius: BorderRadius.circular(40)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '\$${widget.product['price']}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (widget.product['sizes'] as List<int>).length,
                  itemBuilder: (context, index) {
                    final size = (widget.product['sizes'] as List<int>)[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                        child: Chip(
                          label: Text('${size.toString()}'),
                          backgroundColor: selectedSize == size
                              ? const Color.fromRGBO(156, 222, 165, 1.0)
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(245, 215, 29, 1.0),
                        fixedSize: const Size(250, 50)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_shopping_cart, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          'Добавить в корзину',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
