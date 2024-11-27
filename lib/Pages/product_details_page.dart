import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Pages/cart_page.dart';
import 'package:shop_app/Providers/cart_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  String selectedColor = ''; // New variable for color
  int activeInd = 0;
  late PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTap() {
    if (selectedSize != 0 && selectedColor.isNotEmpty) {
      // Check if size and color are selected
      context.read<CartProvider>().addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'sizes': selectedSize,
          'color': selectedColor, // Include color in cart
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Added to Cart.'),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size and color.'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = widget.product['imageUrl'] as List<String>;

    Widget buildIndicator() => AnimatedSmoothIndicator(
          effect: const ExpandingDotsEffect(
            dotWidth: 10,
            activeDotColor: Colors.blue,
          ),
          activeIndex: activeInd,
          count: imageUrls.length,
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
                icon: Badge(
                  label: Text(
                    cartProvider.itemCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imageUrls.length,
                onPageChanged: (index) {
                  setState(() {
                    activeInd = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      imageUrls[index],
                    ),
                  );
                },
              ),
            ),
            buildIndicator(),
            const SizedBox(height: 16),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Price:',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 60),
                          Text(
                            '\$${widget.product['price']}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Size:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            child: SizedBox(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    (widget.product['sizes'] as List<int>)
                                        .length,
                                itemBuilder: (context, index) {
                                  final size = (widget.product['sizes']
                                      as List<int>)[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSize = size;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          selectedSize = 0;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Size unselected.'),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                      child: Chip(
                                        label: Text(size.toString()),
                                        backgroundColor: selectedSize == size
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Color:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: SizedBox(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    (widget.product['colors'] as List<String>)
                                        .length,
                                itemBuilder: (context, index) {
                                  final color = (widget.product['colors']
                                      as List<String>)[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColor = color;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          selectedColor = '';
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Color unselected.'),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                      child: Chip(
                                        label: Text(color),
                                        backgroundColor: selectedColor == color
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          fixedSize: const Size(350, 50),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
