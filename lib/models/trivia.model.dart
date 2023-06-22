import 'package:dk_date/models/trivia.category.model.dart';
import 'package:flutter/foundation.dart';

class Trivia {
  TriviaCategory category;
  String trivia;

  Trivia({required this.category, required this.trivia});

  static Trivia start() {
    return Trivia(
        category: TriviaCategory.dummy(),
        trivia: "Welcome to D & K Trivia wars :)");
  }

  static Trivia end() {
    return Trivia(
        category: TriviaCategory(id: -1, name: "End", fileName: "end.txt"),
        trivia: "Thank you for playing! Hope you enjoyed ;)");
  }
}
