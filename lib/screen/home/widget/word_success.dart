import 'package:audioplayers/audioplayers.dart';
import 'package:bloc_api/screen/home/bloc/dictionary_state.dart';
import 'package:flutter/material.dart';

class WordSuccessWidget extends StatelessWidget {
  final SuccessWordState state;
  const WordSuccessWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entries = state.entries;
    return Column(
        children: entries.map((entry) {
      final meanings = entry.meanings ?? [];
      final phonetics = entry.phonetics ?? [];
      final phonetic =
          phonetics.where((element) => element.sourceUrl != null).toList();
      String? sourceUrl;
      if (phonetic.isNotEmpty) {
        sourceUrl = phonetic.first.sourceUrl;
      }
      return Card(
        child: Container(
          color: Colors.grey.shade300,
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: meanings.map((meaning) {
              final definitions = meaning.definitions ?? [];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            meaning.partOfSpeech.toString(),
                            style: const TextStyle(fontSize: 24.0),
                          ),
                        ),
                        Visibility(
                          visible: sourceUrl != null,
                          child: IconButton(
                            onPressed: () async {
                              final audio = AudioPlayer();
                              await audio.play(UrlSource(sourceUrl.toString()));
                            },
                            icon: const Icon(Icons.play_arrow),
                          ),
                        ),
                      ],
                    ),
                    ...definitions
                        .map((e) => Text('- ${e.definition}'))
                        .toList()
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      );
    }).toList());
  }
}
