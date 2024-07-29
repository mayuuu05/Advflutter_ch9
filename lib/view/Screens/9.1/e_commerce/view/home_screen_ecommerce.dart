import 'package:api_calling/view/Screens/9.1/e_commerce/modal/e_commerce_modal.dart';
import 'package:api_calling/view/Screens/9.1/e_commerce/provider/e_commerce_provider.dart';
import 'package:api_calling/view/Screens/9.1/e_commerce/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenEcommerce extends StatelessWidget {
  const HomeScreenEcommerce({super.key});

  @override
  Widget build(BuildContext context) {
    ECommerceProvider eCommerceProvider = Provider.of<ECommerceProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Shop',style: TextStyle(
            color: Colors.white
          ),),
          backgroundColor: Colors.black,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions:  [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/cart');
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: FutureBuilder(
            future: Provider.of<ECommerceProvider>(context, listen: false).fromJson(),
            builder: (context, snapshot)

            {
              ECommerceModal? modal = snapshot.data;
              if(snapshot.hasData)
                {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of columns
                        crossAxisSpacing: 8.0, // space between columns
                        mainAxisSpacing: 8.0, // space between rows
                        childAspectRatio: 0.7, // aspect ratio of each item
                      ),
                      itemCount: modal!.products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            selectedIndex =index;
                            Navigator.of(context).pushNamed('/detail');
                          },
                          child: Card(
                            elevation: 4.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(modal.products[index].thumbnail)
                                    )
                                  ),
                                 
                                ),
                                 Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    modal.products[index].title,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                 Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    modal.products[index].category,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  [
                                      Text(
                                        '\$ ${modal.products[index].price}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                          SizedBox(width: 4), // Add spacing here
                                          Text(
                                            '${modal.products[index].rating}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
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
                      },
                    ),
                  );

                }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }

        ),
      ),
    );
  }
}