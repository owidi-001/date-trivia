import 'package:flutter/services.dart' show rootBundle;

class DataService {
  // Read data
  static Future<List<String>> fetchData(String fileName) async {
    String content = await rootBundle.loadString("assets/data/$fileName");
    return content.split("\n");
  }
}
