import 'package:flutter/material.dart';

class Meets extends StatefulWidget {
  final List meets;
  Meets(this.meets);

  @override
  _MeetsState createState() => _MeetsState();
}

class _MeetsState extends State<Meets> {
  FontWeight textWeight = FontWeight.normal;
  @override
  Widget build(BuildContext context) {
    int colorCounter = 0;
    List meets = widget.meets;
    Color? background = Colors.red;
    Color textColor = Colors.black;
    String swimResult = '';
    Color borderColor = Colors.black;

    return Container(
      child: ListView(
        children: meets.map((meet) {
          if (meet.contains('Age')) {
            setState(() {
              background = Colors.blue[50];
              textWeight = FontWeight.bold;
              borderColor = Colors.black;
            });
          } else if (meet.contains('2018') ||
              meet.contains('2019') ||
              meet.contains('2020') ||
              meet.contains('2021') ||
              meet.contains('SC')) {
            setState(() {
              background = Colors.blue[100];
              textWeight = FontWeight.bold;
              borderColor = Colors.black;
            });
          } else if (meet.contains('seconds') && colorCounter == 0) {
            if (meet.contains('-')) {
              setState(() {
                swimResult =
                    meet.substring(meet.indexOf("-"), meet.length) + '👍';
                meet = meet.substring(0, meet.indexOf("-"));
                textColor = Colors.green;
                print(swimResult);
                textWeight = FontWeight.normal;
                borderColor = Colors.white;
              });
            } else if (meet.contains('+')) {
              setState(() {
                swimResult = meet.substring(meet.indexOf("+"), meet.length);
                meet = meet.substring(0, meet.indexOf("+"));
                textColor = Colors.red;
                print(swimResult);
                textWeight = FontWeight.normal;
                borderColor = Colors.white;
              });
            } else {
              setState(() {
                swimResult = '';
              });
            }
            setState(() {
              background = Colors.grey[200];
              colorCounter++;
            });
          } else if (meet.contains('seconds') && colorCounter == 1) {
            if (meet.contains('-')) {
              setState(() {
                swimResult =
                    meet.substring(meet.indexOf("-"), meet.length) + '👍';
                meet = meet.substring(0, meet.indexOf("-"));
                textColor = Colors.green;
                print(swimResult);
                textWeight = FontWeight.normal;
                borderColor = Colors.white;
              });
            } else if (meet.contains('+')) {
              setState(() {
                swimResult = meet.substring(meet.indexOf("+"), meet.length);
                meet = meet.substring(0, meet.indexOf("+"));
                textColor = Colors.red;
                print(swimResult);
                textWeight = FontWeight.normal;
                borderColor = Colors.white;
              });
            } else {
              setState(() {
                swimResult = '';
              });
            }

            setState(() {
              background = Colors.white;
              colorCounter--;
            });
          } else {
            setState(() {
              background = Colors.white;
            });
          }
          return Container(
            color: background,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                  width: 1,
                ),
              ),
              child: ListTile(
                onTap: () {},
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // int colorCounter = 0;
                    // List meets = widget.meets;
                    // FontWeight textWeight = FontWeight.normal;
                    // Color? background = Colors.red;
                    // Color textColor = Colors.black;
                    // String swimResult = '';

                    if (meet.contains(':') || meet.contains('.'))
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(meet, style: TextStyle(fontWeight: textWeight)),
                          Text(swimResult, style: TextStyle(color: textColor)),
                        ],
                      )
                    else
                      Text(meet, style: TextStyle(fontWeight: textWeight)),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
