/*
 * @author : Mingaleev D
 * @data : 10.12.2023
 */

import 'package:fake_shop_f_ui/widgets/product_card.dart';
import 'package:fake_shop_f_ui/pages/products_details_page.dart';
import 'package:flutter/material.dart';

import '../common/globar_variables.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({super.key});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  final List<String> filters = const [
    'Все',
    'Adidas',
    'Nike',
    'Bata',
    'Lulu Lemon Athletica',
    'Fila',
    'Champion',
    'Under Armour',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const borderRadius = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1.0),
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.00),
          topRight: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0)),
    );

    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Обувь\nКоллекции',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Поиск...',
                    prefixIcon: Icon(Icons.search),
                    border: borderRadius,
                    focusedBorder: borderRadius,
                    enabledBorder: borderRadius,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      label: Text(filter),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      labelStyle: const TextStyle(fontSize: 16),
                      backgroundColor: selectedFilter == filter
                          ? const Color.fromRGBO(156, 222, 165, 1.0)
                          : const Color.fromRGBO(229, 235, 241, 1.0),
                      side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductsDetailsPage(product: product);
                    }));
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    imageUrl: product['imageUrl'] as String,
                    backgroundColor: index.isEven
                        ? const Color.fromRGBO(221, 236, 245, 1.0)
                        : const Color.fromRGBO(241, 235, 235, 1.0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
