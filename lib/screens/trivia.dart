import 'package:dk_date/controllers/trivia.controller.dart';
import 'package:dk_date/models/trivia.category.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class Trivia extends ConsumerStatefulWidget {
  const Trivia({super.key, required this.categories});

  final List<TriviaCategory> categories;

  @override
  ConsumerState<Trivia> createState() => _TriviaState();
}

class _TriviaState extends ConsumerState<Trivia> {
  @override
  Widget build(BuildContext context) {
    // var triviaProvider = ref.read(triviaController.notifier).shuffle();
    var triviaProvider = ref.watch(triviaController);

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
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
        body: Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Svg(
                        "assets/bg/container_bg.svg",
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    // "D & K \nTrivia",
                    triviaProvider.trivia.trivia,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: TextButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(200, 40)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        overlayColor: MaterialStateProperty.all(Colors.grey),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        ref.read(triviaController.notifier).shuffle();
                      },
                      child: const Text("NEXT")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
