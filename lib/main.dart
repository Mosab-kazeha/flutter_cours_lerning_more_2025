import 'package:flutter/material.dart';
import 'package:intro_to_gradview/model/quiz_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GradViewPage(), debugShowCheckedModeBanner: false);
  }
}

class GradViewPage extends StatelessWidget {
  GradViewPage({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: quiz.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  quiz[index].question +
                      '\n this question has ' +
                      quiz[index].time.toString() +
                      " second",
                ),
                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: quiz[index].answerModel.length,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 200,
                      // childAspectRatio: 21 / 9,
                    ),
                    // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    //   maxCrossAxisExtent: 150,
                    //   crossAxisSpacing: 10,
                    //   mainAxisSpacing: 10,

                    //   // mainAxisExtent: 10,
                    // ),
                    itemCount: quiz[index].answerModel.length,
                    itemBuilder:
                        (context, answerIndex) => InkWell(
                          onTap: () {
                            print(
                              quiz[index].answerModel[answerIndex].isCorrect,
                            );
                            controller.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.linear,
                            );
                          },
                          child: Container(
                            width: 0,
                            height: 0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.cyan,
                            ),
                            child: Center(
                              child: Text(
                                quiz[index].answerModel[answerIndex].answer,
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

int conter = 0;

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.back_hand),
            ),
            InkWell(
              onTap: () {
                conter++;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondPage();
                    },
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text(conter.toString(), style: TextStyle(fontSize: 70)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.back_hand),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      conter++;
                      return TherdPage();
                    },
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.teal,
                child: Text(conter.toString(), style: TextStyle(fontSize: 70)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TherdPage extends StatelessWidget {
  const TherdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            onLongPress: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    conter++;
                    return FirstPage();
                  },
                ),
                (route) => true,
              );
            },
            icon: Icon(Icons.back_hand),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.back_hand),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      conter++;
                      return FirstPage();
                    },
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.teal,
                child: Text(conter.toString(), style: TextStyle(fontSize: 70)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
