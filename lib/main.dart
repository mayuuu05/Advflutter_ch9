import 'package:api_calling/provider/pixabay_provider.dart';
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
        ChangeNotifierProvider(create: (context) => PixabayProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>HomeScreen(),
        },
      ),
    );
  }
}

