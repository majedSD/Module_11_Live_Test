import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery App'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(

          );
        },
      ),
    );
  }
}

class Product {
  final String AlbumId;
  final String Id;
  final String Title;
  final String Url;
  final String ThumbnailUrl;

  Product(this.AlbumId, this.Id, this.Title, this.Url, this.ThumbnailUrl);
}
