import 'package:flutter/material.dart';
import 'package:overlay_group_avatar/overlay_group_avatar.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

class mainImageCard extends StatelessWidget {
  final String? imgscr;
  final String? header;
  final String? description;
  final String? category;
  final bool? isOpen;
  final double? rate;
  final int? itemCounts;
  const mainImageCard(
      {Key? key,
      String? this.imgscr,
      String? this.header,
      String? this.description,
      String? this.category,
      bool? this.isOpen,
      double? this.rate,
      int? this.itemCounts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.network(
                    imgscr!,
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Positioned(
                    top: 20,
                    left: 14,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Text(
                        (() {
                          if (isOpen!) {
                            return 'OPEN';
                          } else {
                            return 'CLOSE';
                          }
                        }()),
                        style: TextStyle(
                            color: (() {
                              if (isOpen!) {
                                return Colors.green;
                              } else {
                                return Colors.red;
                              }
                            }()),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 14,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                            size: 16,
                          ),
                          Text(
                            "${rate}",
                            style: TextStyle(color: Colors.blueGrey),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              ListTile(
                title: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 30, 10),
                        child: Text("${header}"),
                      ),
                      SizedBox(
                        height: 20,
                        child: ElevatedButton(
                          child: Text(
                            "${category}",
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: (() {
                                if (category == "Italian") {
                                  return Color.fromARGB(255, 115, 115, 239);
                                } else if (category == "Chinese") {
                                  return Color.fromARGB(255, 248, 95, 182);
                                } else if (category == "Mexican") {
                                  return Color.fromARGB(255, 101, 194, 129);
                                }
                              }()),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Text("${description}"),
                trailing: Container(
                  width: 70,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OverlapAvatar(
                          groupWidth: (() {
                            if (itemCounts! == 4) {
                              return 60.0;
                            } else if (itemCounts! == 3) {
                              return 45.0;
                            } else if (itemCounts! == 2) {
                              return 30.0;
                            } else if (itemCounts! == 1) {
                              return 20.0;
                            } else {
                              return 70.0;
                            }
                          }()),
                          itemCount: itemCounts,
                          insideRadius: 12,

                          ///Determines how much in radius [Default value: 20]
                          outSideRadius: 15,

                          ///[outsideRadius must be gretter then insideRadius]Determines how much in radius [Default value: 24]
                          widthFactor: 0.5,

                          ///  Determines how much in horizontal they should overlap.[Default value: 0.6]
                          backgroundImage: NetworkImage(
                            'https://www.w3schools.com/howto/img_avatar2.png',
                          ),
                          backgroundColor: Colors.white),
                    ],
                  ),
                ),
                dense: true,
              ),
            ],
          )),
    );
  }
}
