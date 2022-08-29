class Definitions {
  String? definition;
  List<String>? synonyms;

  Definitions({this.definition, this.synonyms});

  Definitions.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    synonyms = json['synonyms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['definition'] = definition;
    data['synonyms'] = synonyms;
    return data;
  }
}
