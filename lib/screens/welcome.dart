import 'package:dk_date/controllers/trivia.controller.dart';
import 'package:dk_date/screens/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Welcome extends ConsumerStatefulWidget {
  const Welcome({super.key});

  @override
  ConsumerState<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends ConsumerState<Welcome> {
  bool isLoaded = false;

  void init() async {
    await ref.read(triviaController).readFiles().then((value) {
      isLoaded = true;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2), () => init());
    super.initState();
  }

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
                "assets/bg/welcome.png",
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                "D & K \nTrivia",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                    child: isLoaded
                        ? TextButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(200, 40)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.grey),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategorySelect(),
                                ),
                              );
                            },
                            child: const Text("PLAY"),
                          )
                        : SpinKitWanderingCubes(
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color: index.isEven
                                      ? Colors.deepPurple
                                      : Colors.white,
                                ),
                              );
                            },
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
