import 'package:bloc_api/api/dictionary_api.dart';
import 'package:bloc_api/screen/home/bloc/dictionary_bloc.dart';
import 'package:bloc_api/screen/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DictionaryBloc(DisctionaryApi()),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
