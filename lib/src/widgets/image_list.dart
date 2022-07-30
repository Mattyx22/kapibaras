import 'package:flutter/material.dart';
import '../models/image_model.dart';
import '../models/facts_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  final List<FactsModel> facts;
  
  ImageList(this.images, this.facts);


  Widget build(context){
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index], facts[index]); 
      },
    );
  }

  Widget buildImage(ImageModel image, FactsModel fact) {
      return Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: <Widget>[
              Padding (
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.network(image.url),
              ),
              Text(fact.fact),
            ],
          ),
          );
  }

}
