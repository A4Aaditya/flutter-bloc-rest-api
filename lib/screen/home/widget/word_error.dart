import 'package:bloc_api/screen/home/bloc/dictionary_state.dart';
import 'package:flutter/material.dart';

class WordErrorWidget extends StatelessWidget {
  final ErrorWordState state;
  const WordErrorWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      state.entry.message.toString(),
      style: const TextStyle(
        color: Colors.red,
        fontSize: 24.0,
      ),
    );
  }
}
