import 'package:dk_date/controllers/data.service.dart';
import 'package:dk_date/models/trivia.category.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/trivia.model.dart';

final triviaController = ChangeNotifierProvider((ref) => TriviaController());

class TriviaController with ChangeNotifier {
  // Load all trivias categorically
  Map<int, List<Trivia>> categoricalTrivias = {};

  // All selected trivias
  List<Trivia> trivias = [];

  // Selected categories of trivia
  List<TriviaCategory> selectedCategories = [];

  // Current trivia
  Trivia trivia = Trivia.start();

  TriviaController() {
    init();
  }

  // Start on welcome
  Future<void> init() async {
    for (var category in TriviaCategory.defaultCategories) {
      // Read files
      final content = DataService.fetchData(category.fileName);
      content.then(
        (value) => categoricalTrivias[category.id] =
            value.map((e) => Trivia(category: category, trivia: e)).toList(),
      );
    }
    notifyListeners();
  }

  // Do on category select
  void addCategories(List<TriviaCategory> categories) {
    selectedCategories = categories;

    for (var category in selectedCategories) {
      trivias.addAll(categoricalTrivias[category.id]!);
    }

    // Shuffle trivias
    trivias.shuffle();

    notifyListeners();
  }

  // Pick categorical trivias
  void pickedTrivias() {
    for (var category in selectedCategories) {
      trivias.addAll(categoricalTrivias[category.id]!);
    }
    notifyListeners();
  }

  void shuffleNext() {
    if (trivias.isNotEmpty) {
      trivia = trivias.removeLast();
    } else {
      trivia = Trivia.end();
    }
    notifyListeners();
  }
}
