abstract class WordEvent {}

class FetchWordEvent extends WordEvent {
  final String word;
  FetchWordEvent({required this.word});
}
