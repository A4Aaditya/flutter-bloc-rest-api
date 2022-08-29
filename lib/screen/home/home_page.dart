import 'package:bloc_api/screen/home/bloc/dictionary_bloc.dart';
import 'package:bloc_api/screen/home/bloc/dictionary_event.dart';
import 'package:bloc_api/screen/home/bloc/dictionary_state.dart';
import 'package:bloc_api/screen/home/widget/word_error.dart';
import 'package:bloc_api/screen/home/widget/word_loading.dart';
import 'package:bloc_api/screen/home/widget/word_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DictionaryBloc>();
    final controller = bloc.searchWord;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Bloc Api'),
      ),
      body: BlocBuilder<DictionaryBloc, WordState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      final word = controller.text;
                      final event = FetchWordEvent(word: word);
                      bloc.add(event);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (state is LoadingWordState)
                const Center(child: WordLoadingWidget())
              else if (state is InitialWordState)
                const Text('Please write text to search')
              else if (state is SuccessWordState)
                WordSuccessWidget(state: state)
              else if (state is ErrorWordState)
                WordErrorWidget(state: state)
              else
                const Text(
                  'Unexpted Error',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24.0,
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
