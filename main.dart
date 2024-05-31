import 'package:flutter/material.dart';
import 'package:shop1/views/screens/products_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: ProductsScreen(),
    );
  }
}
