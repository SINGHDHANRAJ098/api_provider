import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ecom/providers/photo_provider.dart';
import 'package:provider_ecom/providers/video_provider.dart';
import 'package:provider_ecom/screens/home_screen.dart';
import 'package:provider_ecom/screens/video_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: VideoScreen(),
      ),
    );
  }
}
