import 'package:flutter/material.dart';
import 'package:lab5v2/imageCard.dart';
import 'package:lab5v2/mainImageCard.dart';
import 'package:lab5v2/searchBarUI.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:lab5v2/trendingRestaurants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lab5',
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
      home: const MyHomePage(title: 'Flutter Lab5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget>? imagecards = [
    mainImageCard(
      imgscr:
          "https://www.nia.nih.gov/sites/default/files/inline-images/salmonbowl_inline.jpg",
      header: "Happy Bones",
      description: "394 Queens, NYC",
      category: "Italian",
      isOpen: true,
      rate: 4.5,
      itemCounts: 4,
    ),
    mainImageCard(
      imgscr:
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
      header: "Breakfast",
      description: "315 Cairo, Egypt",
      category: "Chinese",
      isOpen: true,
      rate: 4.3,
      itemCounts: 3,
    ),
    mainImageCard(
      imgscr:
          "https://media.istockphoto.com/photos/delicious-meal-on-a-black-plate-top-view-copy-space-picture-id1165399909?k=20&m=1165399909&s=612x612&w=0&h=5g5C4BDoxaejlIr4r_8cV6jDYXzN8n1-JkIW3LgPUuA=",
      header: "Orange Salmon",
      description: "123 Khobar, KSA",
      category: "Mexican",
      isOpen: false,
      rate: 3.8,
      itemCounts: 2,
    ),
  ];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: searchBarUI(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending Resturants",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                              onPressed: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              trendingRestaurants()),
                                    )
                                  },
                              child: Text(
                                "See all",
                                style: TextStyle(color: Colors.grey),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return imagecards![index];
                          },
                          itemCount: imagecards!.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.2,
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 120,
                              width: 120,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            'https://www.al.com/resizer/9LQCPopOdBOdK7X4yEH1qgBS3MY=/1280x0/smart/arc-anglerfish-arc2-prod-advancelocal.s3.amazonaws.com/public/NDLTPCRRHVAKFOBP2C2D4JGVVQ.jpg')),
                                  ),
                                  height: 120,
                                  width: 120,
                                ),
                                Container(
                                  height: 120,
                                  width: 120,
                                  child: Center(
                                    child: Text(
                                      "Italian",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      gradient: LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [
                                          Color.fromARGB(255, 255, 162, 57)
                                              .withOpacity(0.7),
                                          Color.fromARGB(255, 115, 115, 239)
                                              .withOpacity(0.9),
                                        ],
                                      )),
                                )
                              ]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 120,
                              width: 120,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            'https://www.greenqueen.com.hk/wp-content/uploads/2022/02/orijit-chatterjee-wEBg_pYtynw-unsplash-scaled.jpg')),
                                  ),
                                  height: 120,
                                  width: 120,
                                ),
                                Container(
                                  height: 120,
                                  width: 120,
                                  child: Center(
                                    child: Text(
                                      "Chinese",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      gradient: LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [
                                          Color.fromARGB(0, 248, 95, 182)
                                              .withOpacity(0.4),
                                          Color.fromARGB(0, 72, 123, 252)
                                              .withOpacity(0.7),
                                        ],
                                      )),
                                )
                              ]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 120,
                              width: 120,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHrHshJxNMzA04dHqPw2pZQc27nY6x1bFVKw&usqp=CAU')),
                                  ),
                                  height: 120,
                                  width: 120,
                                ),
                                Container(
                                  height: 120,
                                  width: 120,
                                  child: Center(
                                    child: Text(
                                      "Mexican",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      gradient: LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [
                                          Color.fromARGB(0, 101, 194, 129)
                                              .withOpacity(0.8),
                                          Color.fromARGB(0, 76, 89, 175)
                                              .withOpacity(0.8),
                                        ],
                                      )),
                                )
                              ]),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Friends",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.fromLTRB(20, 0, 5, 10),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://preview.keenthemes.com/metronic-v4/theme_rtl/assets/pages/media/profile/profile_user.jpg"),
                            radius: 100,
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.fromLTRB(20, 0, 5, 10),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "http://lavinephotography.com.au/wp-content/uploads/2017/01/PROFILE-Photography-112.jpg"),
                            radius: 100,
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.fromLTRB(20, 0, 5, 10),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo="),
                            radius: 100,
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.fromLTRB(20, 0, 5, 10),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg?fit=640,427"),
                            radius: 100,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            Icons.home,
            Icons.bookmark,
            Icons.notifications,
            Icons.person
          ],
          onTap: (index) => setState(() => _bottomNavIndex = index),
          gapLocation: GapLocation.center,
          activeIndex: _bottomNavIndex,
          inactiveColor: Colors.grey,
          activeColor: Colors.blueAccent,
          splashColor: Colors.blue,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
