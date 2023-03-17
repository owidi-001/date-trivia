import 'package:dk_date/controllers/trivia.controller.dart';
import 'package:dk_date/models/trivia.category.model.dart';
import 'package:dk_date/screens/trivia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategorySelect extends ConsumerStatefulWidget {
  const CategorySelect({super.key});

  @override
  ConsumerState<CategorySelect> createState() => _CategorySelectState();
}

class _CategorySelectState extends ConsumerState<CategorySelect> {
  List<TriviaCategory> categories = TriviaCategory.defaultCategories;

  List<TriviaCategory> pickedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage(
                "assets/bg/category.png",
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
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
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Pick trivia category",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Column(
                      children: [
                        ...categories.map((e) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              margin:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (pickedCategories.contains(e)) {
                                    pickedCategories.remove(e);
                                  } else {
                                    pickedCategories.add(e);
                                  }
                                  setState(() {});
                                },
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: pickedCategories.contains(e),
                                        onChanged: (bool? toggle) {
                                          if (pickedCategories.contains(e)) {
                                            pickedCategories.remove(e);
                                          } else {
                                            pickedCategories.add(e);
                                          }
                                          setState(() {});
                                        }),
                                    Text(e.name),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    )
                  ],
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
                        if (pickedCategories.isNotEmpty) {
                          // Add selected to categories
                          ref
                              .read(triviaController)
                              .addCategories(pickedCategories);
                          //
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Trivia(categories: pickedCategories),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Please pick at least 1 category to continue!")));
                        }
                      },
                      child: const Text("CONTINUE")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
