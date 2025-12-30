import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ecom/providers/cart_provider.dart';
import 'package:provider_ecom/providers/photo_provider.dart';
import 'package:provider_ecom/providers/phots_provider.dart';
import 'package:provider_ecom/providers/select_image_provider.dart';
import 'package:provider_ecom/providers/video_provider.dart';
import 'package:provider_ecom/screens/cart_screen.dart';
import 'package:provider_ecom/screens/home_screen.dart';
import 'package:provider_ecom/screens/photo_screen.dart';
import 'package:provider_ecom/screens/video_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => SelectImageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CartsScreen());
  }
}
