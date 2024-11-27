import 'package:flutter/material.dart';
import 'package:shop_app/Pages/product_details_page.dart';
import 'package:shop_app/Widgets/product_card.dart';
import 'package:shop_app/global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Jordans',
    'Addidas',
    'Nike',
    'Bata',
  ];
  late String selectedFilters;
  late List<Map<String, Object>> filteredProducts;

  @override
  void initState() {
    super.initState();
    selectedFilters = filters[0];
    filteredProducts = products; // Initialize with all products
  }

  void filterProducts() {
    if (selectedFilters == 'All') {
      filteredProducts = products;
    } else {
      filteredProducts = products
          .where((product) =>
              (product['title'] as String).contains(selectedFilters))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Shoes Collection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
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
                        selectedFilters = filter;
                        filterProducts();
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilters == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromARGB(255, 216, 240, 253),
                      label: Text(
                        filter,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      labelStyle: const TextStyle(fontSize: 15),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 216, 240, 253),
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 650) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(product: product);
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: (product['imageUrl'] as List<String>).first,
                        backGroundColor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(245, 247, 249, 1),
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(product: product);
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: (product['imageUrl'] as List<String>).first,
                        backGroundColor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(245, 247, 249, 1),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
