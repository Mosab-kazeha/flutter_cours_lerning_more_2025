import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(home: HomePageWithPageViewBuilder());
  }
}

List<Widget> children = [
  Container(
    alignment: Alignment(0, 0),
    color: Colors.amber,
    child: InkWell(
      onTap: () {
        print("object");
        controller.nextPage(
          duration: Duration(seconds: 1),
          curve: Curves.bounceIn,
        );
        // controller.animateTo(
        //   300,
        //   duration: Duration(seconds: 1),
        //   curve: Curves.easeIn,
        // );
        // controller.jumpTo(500);
        // controller.animateToPage(
        //   2,
        //   duration: Duration(seconds: 1),
        //   curve: Curves.bounceOut,
        // );
      },
      child: Container(width: 100, height: 25, child: Text("next page")),
    ),
  ),
  Container(
    alignment: Alignment(0, 0),
    color: Colors.teal,
    child: InkWell(
      onTap: () {
        print("object");
        controller.nextPage(
          duration: Duration(seconds: 1),
          curve: Curves.easeInBack,
        );
      },
      child: Container(width: 100, height: 25, child: Text("next page")),
    ),
  ),
  Container(
    alignment: Alignment(0, 0),
    color: Colors.red,
    child: InkWell(
      onTap: () {
        print(pageIndex);
        children.length - 1 == pageIndex
            ? controller.jumpTo(0)
            : controller.nextPage(
              duration: Duration(seconds: 1),
              curve: Curves.easeInBack,
            );
      },
      child: Container(width: 100, height: 25, child: Text("next page")),
    ),
  ),
];
PageController controller = PageController();
int pageIndex = 0;

class HomePageWithPageView extends StatelessWidget {
  HomePageWithPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        // reverse: true,
        // physics: NeverScrollableScrollPhysics(),
        // physics: AlwaysScrollableScrollPhysics(),
        // physics: BouncingScrollPhysics(),
        onPageChanged: (int index) {
          pageIndex = index;
          // print(index);
          print(controller.page);
        },
        children: children,
      ),
    );
  }
}

class HomePageWithPageViewBuilder extends StatelessWidget {
  const HomePageWithPageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: InkWell(
              onTap: () {
                controller.page != 9
                    ? controller.nextPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.bounceIn,
                    )
                    : controller.jumpTo(0);
              },
              child: Text(index.toString()),
            ),
          );
        },
      ),
    );
  }
}
