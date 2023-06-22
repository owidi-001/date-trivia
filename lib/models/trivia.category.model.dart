class TriviaCategory {
  int id;
  String name;
  String fileName;

  TriviaCategory(
      {required this.id, required this.name, required this.fileName});

  static List<TriviaCategory> defaultCategories = [
    TriviaCategory(id: 1, name: "Love & Intimacy", fileName: "love.txt"),
    TriviaCategory(id: 2, name: "Career & Goals", fileName: "career.txt"),
    TriviaCategory(id: 3, name: "Hobbies & Interests", fileName: "hobby.txt"),
    TriviaCategory(id: 4, name: "Values & Beliefs", fileName: "values.txt"),
  ];

  factory TriviaCategory.dummy() {
    return TriviaCategory(id: 0, name: "Init", fileName: "1.txt");
  }
}
