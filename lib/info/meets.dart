import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

List? meets = [];

class Meets extends StatefulWidget {
  String? fullUrl = '';
  Meets({required this.fullUrl});
  @override
  _MeetsState createState() => _MeetsState();
}

class _MeetsState extends State<Meets> {
  FontWeight textWeight = FontWeight.normal;

  void grabMeets() async {
    final swimmerPage = WebScraper("https://www.swimmingrank.com");
    if (await swimmerPage.loadWebPage(widget.fullUrl!)) {
      meets = swimmerPage.getElementTitle('tr');
      meets!.removeRange(0, 5);
      meets!.removeWhere((item) => item == meets![2]);
      meets!.removeLast();
    }
  }

  @override
  void initState() {
    super.initState();
    grabMeets();
  }

  @override
  Widget build(BuildContext context) {
    int colorCounter = 0;
    Color? background = Colors.red;
    Color textColor = Colors.black;
    String swimResult = '';
    String swimEvent = '';
    String swimTime = '';
    String swimAchievement = '';

    return ListView(
      children: meets!.map((meet) {
        if (meet.contains('Age')) {
          setState(() {
            background = Colors.blue[100];
            textWeight = FontWeight.bold;
          });
        } else if (meet.contains('2018') ||
            meet.contains('2019') ||
            meet.contains('2020') ||
            meet.contains('2021') ||
            meet.contains('SC') ||
            meet.contains('Invite') ||
            meet.contains('Intrasquad') ||
            meet.contains('Dual') ||
            meet.contains('Trials') ||
            meet.contains('vs') ||
            meet.contains('Finals')) {
          setState(() {
            background = Colors.blue[100];
            textWeight = FontWeight.bold;
          });
        } else if (meet.contains('seconds') && colorCounter == 0) {
          if (meet.contains('-')) {
            setState(() {
              RegExp regex = RegExp(r'-?\+?\d{0,3}\.\d{2}');
              swimResult = meet.substring(meet.indexOf("-"), meet.length);
              var matches = regex.firstMatch(swimResult);
              swimResult = matches!.group(0).toString() + '👍';
              meet = meet.substring(0, meet.indexOf("-"));
              textColor = Colors.green;
              textWeight = FontWeight.normal;
            });
          } else if (meet.contains('+')) {
            setState(() {
              RegExp regex = RegExp(r'-?\+?\d{0,3}\.\d{2}');
              swimResult = meet.substring(meet.indexOf("+"), meet.length);
              var matches = regex.firstMatch(swimResult);
              swimResult = matches!.group(0).toString();
              textColor = Colors.red;
              textWeight = FontWeight.normal;
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
              RegExp regex = RegExp(r'-?\+?\d{0,3}\.\d{2}');
              swimResult = meet.substring(meet.indexOf("-"), meet.length);
              var matches = regex.firstMatch(swimResult);
              swimResult = matches!.group(0).toString() + '👍';
              // meet = meet.substring(0, meet.indexOf("-"));
              textColor = Colors.green;
              textWeight = FontWeight.normal;
            });
          } else if (meet.contains('+')) {
            setState(() {
              RegExp regex = RegExp(r'-?\+?\d{0,3}\.\d{2}');
              swimResult = meet.substring(meet.indexOf("+"), meet.length);
              var matches = regex.firstMatch(swimResult);
              swimResult = matches!.group(0).toString();
              // meet = meet.substring(0, meet.indexOf("+"));
              textColor = Colors.red;
              textWeight = FontWeight.normal;
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
        if (meet.contains('Freestyle')) {
          RegExp regex = RegExp(r'\d{0,4} (Yd)?(M)?');
          var bopper = regex.firstMatch(meet);
          swimEvent = bopper!.group(0).toString() + ' FR';
          RegExp exp = RegExp(r'(\d?\d?)?\:?(\d{2})\.(\d{2})');
          var bop = exp.firstMatch(meet);
          swimTime = bop!.group(0).toString();
          if (meet.contains("(")) {
            swimAchievement =
                meet.substring(meet.indexOf("("), meet.indexOf(")"));
          }
        } else if (meet.contains('Breaststroke')) {
          RegExp regex = RegExp(r'\d{0,4} (Yd)?(M)?');
          var bopper = regex.firstMatch(meet);
          swimEvent = bopper!.group(0).toString() + ' BR';
          RegExp exp = RegExp(r'(\d?\d?)?\:?(\d{2})\.(\d{2})');
          var bop = exp.firstMatch(meet);
          swimTime = bop!.group(0).toString();
          if (meet.contains("(")) {
            swimAchievement =
                meet.substring(meet.indexOf("("), meet.indexOf(")"));
          }
        } else if (meet.contains('Butterfly')) {
          RegExp regex = RegExp(r'\d{0,4} (Yd)?(M)?');
          var bopper = regex.firstMatch(meet);
          swimEvent = bopper!.group(0).toString() + ' FL';
          RegExp exp = RegExp(r'(\d?\d?)?\:?(\d{2})\.(\d{2})');
          var bop = exp.firstMatch(meet);
          swimTime = bop!.group(0).toString();
          if (meet.contains("(")) {
            swimAchievement =
                meet.substring(meet.indexOf("("), meet.indexOf(")"));
          }
        } else if (meet.contains('Backstroke')) {
          RegExp regex = RegExp(r'\d{0,4} (Yd)?(M)?');
          var bopper = regex.firstMatch(meet);
          swimEvent = bopper!.group(0).toString() + ' BK';
          RegExp exp = RegExp(r'(\d?\d?)?\:?(\d{2})\.(\d{2})');
          var bop = exp.firstMatch(meet);
          swimTime = bop!.group(0).toString();
          if (meet.contains("(")) {
            swimAchievement =
                meet.substring(meet.indexOf("("), meet.indexOf(")"));
          }
        } else if (meet.contains('Individual Medley')) {
          RegExp regex = RegExp(r'\d{0,4} (Yd)?(M)?');
          var bopper = regex.firstMatch(meet);
          swimEvent = bopper!.group(0).toString() + ' IM';
          RegExp exp = RegExp(r'(\d?\d?)?\:?(\d{2})\.(\d{2})');
          var bop = exp.firstMatch(meet);
          swimTime = bop!.group(0).toString();
          if (meet.contains("(")) {
            swimAchievement =
                meet.substring(meet.indexOf("("), meet.indexOf(")"));
          }
        }

        return Column(
          children: [
            if (meet.contains(':') || meet.contains('.'))
              Column(
                children: [
                  Container(
                    color: background,
                    child: ListTile(
                      onTap: () {},
                      title: SingleChildScrollView(
                        child: DataTable(
                          showBottomBorder: false,
                          dividerThickness: 0.0,
                          headingRowHeight: 0,
                          columns: [
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell((Text(swimEvent,
                                  style: TextStyle(fontWeight: textWeight)))),
                              DataCell(Text(swimTime)),
                              DataCell(
                                Text(swimResult,
                                    style: TextStyle(color: textColor)),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              Container(
                  color: background,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(meet, style: TextStyle(fontWeight: textWeight)),
                    ],
                  )),
          ],
        );
      }).toList(),
    );
  }
}
