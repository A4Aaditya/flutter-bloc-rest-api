import 'dart:convert';

import 'package:bloc_api/models/entries.dart';
import 'package:bloc_api/models/error_entry.dart';
import 'package:http/http.dart' as http;

abstract class Dictionary {
  Future<List<Entries>> fetch(String word);
}

class DisctionaryApi implements Dictionary {
  @override
  Future<List<Entries>> fetch(String word) async {
    final url = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final status = response.statusCode;
    final source = response.body;
    if (status == 404) {
      final json = jsonDecode(source) as Map<String, dynamic>;
      throw ErrorEntiry.fromJson(json);
    } else {
      final json = jsonDecode(source) as List;
      return json.map((e) => Entries.fromJson(e)).toList();
    }
  }
}
