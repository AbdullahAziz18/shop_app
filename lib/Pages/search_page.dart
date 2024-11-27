import 'package:flutter/material.dart';
import 'package:shop_app/Pages/product_details_page.dart';
import 'package:shop_app/Widgets/product_card.dart';
import 'package:shop_app/global_variables.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> filters = const [
    'All',
    'Jordans',
    'Addidas',
    'Nike',
    'Bata'
  ];
  late String selectedFilters;
  final TextEditingController searchController = TextEditingController();
  List<Map<String, Object>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    selectedFilters = filters[0];
    searchController.addListener(_filterProducts);
    _filterProducts();
  }

  @override
  void dispose() {
    searchController.removeListener(_filterProducts);
    searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    String searchQuery = searchController.text.toLowerCase();

    setState(() {
      if (selectedFilters == 'All') {
        filteredProducts = products.where((product) {
          final title = (product['title'] as String).toLowerCase();
          return title.contains(searchQuery);
        }).toList();
      } else {
        filteredProducts = products.where((product) {
          final title = (product['title'] as String).toLowerCase();
          return title.contains(selectedFilters.toLowerCase()) &&
              title.contains(searchQuery);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(100),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
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
                        _filterProducts();
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
            child: ListView.builder(
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
            ),
          ),
        ],
      ),
    );
  }
}
