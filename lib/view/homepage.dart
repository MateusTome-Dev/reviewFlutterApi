import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class HomePageTest extends StatefulWidget {
  const HomePageTest({super.key});

  @override
  State<HomePageTest> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageTest> {
  String? image; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(image!=null) Image.network(image!),
          ElevatedButton(onPressed: () async{
          var url = 'https://fakestoreapi.com/products/1';
          var response = await http.get(Uri.parse(url));
          var jsonResponse =
        convert.jsonDecode(response.body);
        setState(() {
          image= jsonResponse['image'];
        });
        print(jsonResponse['title']);
        print(jsonResponse['image']);
        print(jsonResponse['description']);
        print(jsonResponse['category']);
        print(jsonResponse['price']);
        print(jsonResponse['rating']['rate']);
        print(jsonResponse['rating']['count']);
        }, child: const Text("teste"))],
      ),
    );
  }
}