import 'package:api_calling/view/Screens/9.1/e_commerce/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cartProvider.dart';
import '../provider/e_commerce_provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider  = Provider.of(context);
    ECommerceProvider eCommerceProvider = Provider.of<ECommerceProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 330,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(eCommerceProvider
                    .eCommerceModal!.products[selectedIndex].thumbnail))
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 5,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],

                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                           Text(
                            eCommerceProvider.eCommerceModal!.products[selectedIndex].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                           Text(
                            eCommerceProvider.eCommerceModal!.products[selectedIndex].category,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 16),
                           Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              Text(
                                eCommerceProvider.eCommerceModal!.products[selectedIndex].rating.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                '\$ ${ eCommerceProvider.eCommerceModal!.products[selectedIndex].price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                           Text(
                            eCommerceProvider.eCommerceModal!.products[selectedIndex].description,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 16),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Discount \%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    eCommerceProvider.eCommerceModal!.products[selectedIndex].discountPercentage.toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SKU',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'RCH45Q1A',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Divider(),
                          const SizedBox(height: 16),
                          const Text(
                            'Reviews ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          ...List.generate(
                            eCommerceProvider.eCommerceModal!
                                .products[selectedIndex].reviews.length,
                                (index) => Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    textAlign: TextAlign.start,
                                    '${eCommerceProvider.eCommerceModal!.products[selectedIndex].reviews[index].reviewerName} ',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.start,
                                    '${eCommerceProvider.eCommerceModal!.products[selectedIndex].reviews[index].comment} ',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                cartList.add(eCommerceProvider
                                    .eCommerceModal!
                                    .products[selectedIndex]);
                                for(int i = 0; i < eCommerceProvider.eCommerceModal!.products.length; i++){
                                  itemQuantities.add(selectedIndex);
                                }
                                cartProvider.calculateTotalPrice();
                                cartProvider.calculateTotalDiscount();
                                Navigator.pushNamed(context, '/cart');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                              ),
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}








