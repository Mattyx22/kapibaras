class ImageModel {
  late String id;
  late String url;

  ImageModel(this.id, this.url);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['storage_url'];
  }
}