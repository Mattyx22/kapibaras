import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';
import 'models/facts_model.dart';

 
class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  List<ImageModel> images = [];
  List<FactsModel> facts = [];

  void fetchImage() async {
    var responseImage = await get(Uri.parse('https://api.capybara-api.xyz/v1/image/random'));
    var imageModel = ImageModel.fromJson(json.decode(responseImage.body));
    
    var responseFacts = await get(Uri.parse('https://api.capybara-api.xyz/v1/facts/random'));
    var factsModel = FactsModel.fromJson(json.decode(responseFacts.body));

    setState(() {
      images.add(imageModel);
      facts.add(factsModel);
    });
    
  }
  

  Widget build(context) {
    return MaterialApp(
      title: 'Kapibaras',
      home: Scaffold(
        body: ImageList(images, facts),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: fetchImage,
          ),
        appBar: AppBar(
          title: const Text('Kapibaras'),
        ),
      ),
  );
  }
}