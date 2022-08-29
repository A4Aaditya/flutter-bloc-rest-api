import 'package:bloc_api/models/definations.dart';

class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;
  List<String>? synonyms;

  Meanings({this.partOfSpeech, this.definitions, this.synonyms});

  Meanings.fromJson(Map<String, dynamic> json) {
    partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        definitions!.add(Definitions.fromJson(v));
      });
    }
    synonyms = json['synonyms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['partOfSpeech'] = partOfSpeech;
    if (definitions != null) {
      data['definitions'] = definitions!.map((v) => v.toJson()).toList();
    }
    data['synonyms'] = synonyms;

    return data;
  }
}
