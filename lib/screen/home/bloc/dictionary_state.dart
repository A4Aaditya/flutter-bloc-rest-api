import 'package:bloc_api/models/entries.dart';
import 'package:bloc_api/models/error_entry.dart';

abstract class WordState {}

class InitialWordState extends WordState {}

class LoadingWordState extends WordState {}

class SuccessWordState extends WordState {
  List<Entries> entries;
  SuccessWordState(this.entries);
}

class ErrorWordState extends WordState {
  ErrorEntiry entry;
  ErrorWordState(this.entry);
}

class UnexpectedWordState extends WordState {}
