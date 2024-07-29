import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cartProvider.dart';
import '../utils/globals.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.onUpdate = () {
      if (context.mounted) {
        (context as Element).markNeedsBuild();
      }
    };

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Cart Page',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: cartList.isEmpty
            ? const Center(
          child: Text('Your cart is empty'),
        )
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (context, index) {
              return cartContainer(
                height: height,
                width: width,
                cartProvider: cartProvider,
                index: index,
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${cartProvider.totalPrice}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Implement your checkout functionality here
                },
                child: Text(
                  'Shop Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card cartContainer({
    required double height,
    required double width,
    required CartProvider cartProvider,
    required int index,
  }) {
    return Card(
      color: Colors.white60,

      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                cartList[index].thumbnail,
                height: height * 0.12,
                width: height * 0.12,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartList[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${cartList[index].price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              cartProvider.removeQuantity(index);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.shade200,
                              ),
                              child: Icon(Icons.remove, size: 16),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(itemQuantities[index].toString(),
                              style: const TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              cartProvider.addQuantity(index);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.shade200,
                              ),
                              child: Icon(Icons.add, size: 16),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          cartProvider.removeItem(index);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
