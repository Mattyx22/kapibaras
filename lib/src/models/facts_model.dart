class FactsModel {
  late String fact;

  FactsModel(this.fact);

  FactsModel.fromJson(Map<String, dynamic> parsedJson){
    fact = parsedJson['fact'];
  }
}