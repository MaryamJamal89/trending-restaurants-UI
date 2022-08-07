import 'package:flutter/material.dart';
import 'package:overlay_group_avatar/overlay_group_avatar.dart';

class imageCard extends StatelessWidget {
  final String? imgscr;
  final String? header;
  final String? description;
  final bool? isOpen;
  final double? rate;
  final int? itemCounts;
  const imageCard(
      {Key? key,
      String? this.imgscr,
      String? this.header,
      String? this.description,
      bool? this.isOpen,
      double? this.rate,
      int? this.itemCounts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    imgscr!,
                    width: 400,
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
                title: Text("${header}"),
                subtitle: Text("${description}"),
                trailing: Container(
                  width: 150,
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
