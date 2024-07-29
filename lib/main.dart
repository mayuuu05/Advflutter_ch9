import 'package:api_calling/provider/pixabay_provider.dart';
import 'package:api_calling/view/Screens/9.1/e_commerce/provider/cartProvider.dart';
import 'package:api_calling/view/Screens/9.1/e_commerce/provider/e_commerce_provider.dart';
import 'package:api_calling/view/Screens/9.1/e_commerce/view/addToCartPage.dart';
import 'package:api_calling/view/Screens/9.1/e_commerce/view/detail_screen.dart';
import 'package:api_calling/view/Screens/9.1/e_commerce/view/home_screen_ecommerce.dart';
import 'package:api_calling/view/Screens/9.1/e_commerce/view/splash_screen.dart';
import 'package:api_calling/view/Screens/9.1/recipe/provider/recipe_provider.dart';
import 'package:api_calling/view/Screens/9.1/recipe/view/detailPage.dart';
import 'package:api_calling/view/Screens/9.1/recipe/view/recipePage.dart';
import 'package:api_calling/view/Screens/9.2/homeScreen/home_screen.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PixaBay());
}

class PixaBay extends StatelessWidget {
  const PixaBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PixabayProvider(),),
        ChangeNotifierProvider(create: (context) => RecipeProvider(),),
        ChangeNotifierProvider(create: (context) => ECommerceProvider(),),
        ChangeNotifierProvider(create: (context) => CartProvider(),),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // 9.1
          // '/':(context)=>const Recipepage(),
          // '/details':(context)=>const DetailPage(),

          // 9.1 Ecommerce
          '/':(context)=>const SplashScreen(),
          '/home':(context)=>const HomeScreenEcommerce(),
          '/detail':(context)=>const DetailScreen(),
          '/cart':(context)=>const  AddToCartScreen(),

          // 9.2 Call Pixabay API & Represent in UI.
          // '/':(context)=>HomeScreen(),
        },
      ),
    );
  }
}

