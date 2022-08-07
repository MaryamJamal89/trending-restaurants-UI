import 'package:flutter/material.dart';
import 'package:lab5v2/imageCard.dart';
import 'package:lab5v2/searchBarUI.dart';

void main() {
  runApp(trendingRestaurants());
}

class trendingRestaurants extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trending Restaurants',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.grey[50],
          brightness: Brightness.light,
          textTheme: Typography.material2018().black,
          iconTheme: IconThemeData(color: Colors.black87),
          actionsIconTheme: IconThemeData(color: Colors.black87),
          elevation: 0,
        ),
      ),
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: MyHomePage(
          title: "Trending Restaurants",
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            searchBarUI(),
            Container(
              margin: EdgeInsets.only(top: 70),
              child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    imageCard(
                      imgscr:
                          "https://www.nia.nih.gov/sites/default/files/inline-images/salmonbowl_inline.jpg",
                      header: "Happy Bones",
                      description: "394 Queens, NYC",
                      isOpen: true,
                      rate: 4.5,
                      itemCounts: 4,
                    ),
                    imageCard(
                      imgscr:
                          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
                      header: "Breakfast",
                      description: "315 Cairo, Egypt",
                      isOpen: true,
                      rate: 4.3,
                      itemCounts: 3,
                    ),
                    imageCard(
                      imgscr:
                          "https://media.istockphoto.com/photos/delicious-meal-on-a-black-plate-top-view-copy-space-picture-id1165399909?k=20&m=1165399909&s=612x612&w=0&h=5g5C4BDoxaejlIr4r_8cV6jDYXzN8n1-JkIW3LgPUuA=",
                      header: "Orange Salmon",
                      description: "123 Khobar, KSA",
                      isOpen: false,
                      rate: 3.8,
                      itemCounts: 2,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
