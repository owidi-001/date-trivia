import 'package:dk_date/models/trivia.category.model.dart';
import 'package:flutter/foundation.dart';

class Trivia {
  TriviaCategory category;
  String trivia;

  Trivia({required this.category, required this.trivia});

  static Trivia dummy() {
    return Trivia(category: TriviaCategory.dummy(), trivia: "Welcome to D & K Trivia wars :)");
  }
}
