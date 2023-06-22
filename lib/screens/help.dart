import 'package:dk_date/theme/theme.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
            image: AssetImage(
              "assets/bg/trivia.png",
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description:",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  "This dart trivia model is designed for a fun and interactive game night with friends or family. The model includes a set of trivia questions that are sorted into different categories. Each category corresponds to a different section of the dartboard, and players must answer a question correctly in order to earn points by hitting the corresponding section of the board with their darts."),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Gameplay:",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              ...List.generate(
                  gameplay.length, (index) => Text(gameplay[index])),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Categories:",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              ...List.generate(
                  categories.length, (index) => Text(categories[index])),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Example Questions:",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              ...List.generate(
                  examples.length, (index) => Text(examples[index])),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Scoring:",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(scoring)
            ],
          ),
        ),
      ),
    );
  }
}

List<String> gameplay = [
  "1.  Set up a standard dartboard in a safe and suitable location.",
  "2.  Divide players into teams or play individually.",
  "3.  Choose a category and ask the first player/team a question from that category.",
  "4.  If the player/team answers the question correctly, they get to throw three darts at the corresponding section of the dartboard. The score for that section is added to their overall score.",
  "5.  If the player/team misses the question, they do not get to throw darts and do not earn any points.",
  "6.  Repeat steps 3-5 with each player/team taking turns answering questions from different categories.",
  "7.  The game ends when all questions have been answered, and the player/team with the highest score wins."
];
List<String> categories = [
  "1.  Science & Technology",
  "2.  Pop Culture",
  "3.  History",
  "4.  Sports",
  "5.  Geography",
  "6.  Literature",
  "7.  Food & Drink",
  "8.  Art & Music"
];

List<String> examples = [
  "1.  Science & Technology: What is the smallest unit of a computer memory?",
  "2.  Pop Culture: What is the name of the superhero portrayed by Chris Evans in the Marvel Cinematic Universe?",
  "3.  History: Who was the first president of the United States?",
  "4.  Sports: What is the name of the professional basketball team in Los Angeles?",
  "5.  Geography: What is the capital of Australia?",
  '6.  Literature: Who wrote the novel "To Kill a Mockingbird"?',
  "7.  Food & Drink: What is the main ingredient in hummus?",
  "8.  Art & Music: Who painted the famous portrait of Mona Lisa?"
];
const String scoring =
    "Each section of the dartboard has a corresponding point value. The outermost ring (numbered 1-20) is worth 1 point per section, the middle ring (numbered 1-20) is worth 2 points per section, the inner ring (numbered 1-20) is worth 3 points per section, the outer bullseye is worth 4 points, and the inner bullseye is worth 5 points. Players must hit the corresponding section of the board with their darts in order to earn points for their team.";
