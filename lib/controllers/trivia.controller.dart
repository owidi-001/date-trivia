import 'dart:io';

import 'package:dk_date/models/trivia.category.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../models/trivia.model.dart';

final triviaController = ChangeNotifierProvider((ref) => TriviaController());

class TriviaController with ChangeNotifier {
  Trivia trivia = Trivia.dummy();
  List<Trivia> allTrivias = [];

  Map<int, List<Trivia>> trivias = {};

  final categories = TriviaCategory.defaultCategories;

  List<TriviaCategory> selectedCategories = [];

  // TriviaController() {
  //   readFiles();
  // }

  Future<List<String>> loadAsset(String fileName) async {
    String content = await rootBundle.loadString(fileName);
    return content.split("\n");
  }

  Future<void> readFiles() async {
    for (var category in categories) {
      loadAsset(category.fileName).then(
          (value) => trivias[category.id] =
              value.map((e) => Trivia(category: category, trivia: e)).toList(),
          onError: (error, stacktrace) =>
              trivias[category.id] = [Trivia.dummy(), Trivia.dummy()]);
    }
    notifyListeners();
  }

  void addCategories(List<TriviaCategory> categories) {
    selectedCategories = categories;

    // selectedCategories.map((e) => ,)?

    notifyListeners();
  }

  void shuffle() {
    if (trivias.isNotEmpty) {}
  }
}
