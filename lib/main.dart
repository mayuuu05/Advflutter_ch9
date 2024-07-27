import 'package:api_calling/provider/pixabay_provider.dart';
import 'package:api_calling/view/Screens/9.1/recipe/provider/recipe_provider.dart';
import 'package:api_calling/view/Screens/9.1/recipe/view/detailPage.dart';
import 'package:api_calling/view/Screens/9.1/recipe/view/recipePage.dart';


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
        ChangeNotifierProvider(create: (context) => RecipeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>const Recipepage(),
          '/details':(context)=>const DetailPage(),

          // 9.2 Call Pixabay API & Represent in UI.
          // '/':(context)=>HomeScreen(),
        },
      ),
    );
  }
}

