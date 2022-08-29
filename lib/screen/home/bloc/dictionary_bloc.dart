import 'dart:async';

import 'package:bloc_api/api/dictionary_api.dart';
import 'package:bloc_api/models/error_entry.dart';
import 'package:bloc_api/screen/home/bloc/dictionary_event.dart';
import 'package:bloc_api/screen/home/bloc/dictionary_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryBloc extends Bloc<WordEvent, WordState> {
  final searchWord = TextEditingController();
  final Dictionary dictionaryApi;

  DictionaryBloc(this.dictionaryApi) : super(InitialWordState()) {
    on<FetchWordEvent>(_fetchEntry);
  }

  FutureOr<void> _fetchEntry(
    FetchWordEvent event,
    Emitter<WordState> emit,
  ) async {
    emit(LoadingWordState());
    final word = event.word;
    try {
      final response = await dictionaryApi.fetch(word);
      emit(SuccessWordState(response));
    } on ErrorEntiry catch (e) {
      emit(ErrorWordState(e));
    } catch (e) {
      emit(UnexpectedWordState());
    }
  }
}
