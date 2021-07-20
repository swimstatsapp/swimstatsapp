import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:swimstatsapp/newhome.dart';

class DisplayTime extends StatefulWidget {
  const DisplayTime({Key? key}) : super(key: key);

  @override
  _DisplayTimeState createState() => _DisplayTimeState();
}

class _DisplayTimeState extends State<DisplayTime> {
  String free50YTime = '';
  String free50MTime = '';
  String free100YTime = '';
  String free100MTime = '';
  String free200YTime = '';
  String free200MTime = '';
  String free500YTime = '';
  String free400MTime = '';
  String free1000YTime = '';
  String free800MTime = '';
  String free1650YTime = '';
  String free1500MTime = '';
  String back100YTime = '';
  String back100MTime = '';
  String back200YTime = '';
  String back200MTime = '';
  String brst100YTime = '';
  String brst100MTime = '';
  String brst200YTime = '';
  String brst200MTime = '';
  String fly100YTime = '';
  String fly100MTime = '';
  String fly200YTime = '';
  String fly200MTime = '';
  String im200YTime = '';
  String im200MTime = '';
  String im400YTime = '';
  String im400MTime = '';

  void free50YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          free50YTime = elements[7]['title'];
          free50MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          free50YTime = elements[7]['title'];
          free50MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          free50YTime = 'N/A';
          free50MTime = elements[12]['title'];
        } else {
          free50YTime = 'N/A';
          free50MTime = 'N/A';
        }
      });
      print('free ' + free50YTime);
      print('free ' + free50MTime);
      times.replaceRange(3, 6, [free50MTime, '50 Freestyle', free50YTime]);
    }
  }

  void free100YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_100FR.html'))
    {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          free100YTime = elements[7]['title'];
          free100MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          free100YTime = elements[7]['title'];
          free100MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          free100YTime = 'N/A';
          free100MTime = elements[12]['title'];
        } else {
          free100YTime = 'N/A';
          free100MTime = 'N/A';
        }
      });
      print('free ' + free100YTime);
      print('free' + free100MTime);
      times.replaceRange(6, 9, [free100MTime, '100 Freestyle', free100YTime]);
    }
  }

  void free200YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_200FR.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          free200YTime = elements[7]['title'];
          free200MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          free200YTime = elements[7]['title'];
          free200MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          free200YTime = 'N/A';
          free200MTime = elements[12]['title'];
        } else {
          free200YTime = 'N/A';
          free200MTime = 'N/A';
        }
      });
      print('free' + free200YTime);
      print('free' + free200MTime);
      times.replaceRange(9, 12, [free200MTime, '200 Freestyle', free200YTime]);
    }
  }

  void free500YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_400500FR.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          free500YTime = elements[7]['title'];
          free400MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          free500YTime = elements[7]['title'];
          free400MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          free500YTime = 'N/A';
          free400MTime = elements[12]['title'];
        } else {
          free500YTime = 'N/A';
          free400MTime = 'N/A';
        }
      });
      print('free' + free500YTime);
      print('free' + free400MTime);
      times.replaceRange(
          12, 15, [free400MTime, '400/500 Freestyle', free500YTime]);
    }
  }

  void free1000YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_8001000FR.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          free1000YTime = elements[7]['title'];
          free800MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          free1000YTime = elements[7]['title'];
          free800MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          free1000YTime = 'N/A';
          free800MTime = elements[12]['title'];
        } else {
          free1000YTime = 'N/A';
          free800MTime = 'N/A';
        }
      });
      print('free ' + free1000YTime);
      print('free ' + free800MTime);
      times.replaceRange(
          15, 18, [free800MTime, '800/1000 Freestyle', free1000YTime]);
    }
  }

  void free1650YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_15001650FR.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          free1650YTime = elements[7]['title'];
          free1500MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          free1650YTime = elements[7]['title'];
          free1500MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          free1650YTime = 'N/A';
          free1500MTime = elements[12]['title'];
        } else {
          free1650YTime = 'N/A';
          free1500MTime = 'N/A';
        }
      });
      print('free ' + free1650YTime);
      print('free ' + free1500MTime);
      times.replaceRange(
          18, 21, [free1500MTime, '1500/1650 Freestyle', free1650YTime]);
    }
  }

  void back100YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_100BK.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          back100YTime = elements[7]['title'];
          back100MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          back100YTime = elements[7]['title'];
          back100MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          back100YTime = 'N/A';
          back100MTime = elements[12]['title'];
        } else {
          back100YTime = 'N/A';
          back100MTime = 'N/A';
        }
      });
      print('back' + back100YTime);
      print('back' + back100MTime);
      times
          .replaceRange(21, 24, [back100MTime, '100 Backstroke', back100YTime]);
    }
  }

  void back200YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_200BK.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          back200YTime = elements[7]['title'];
          back200MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          back200YTime = elements[7]['title'];
          back200MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          back200YTime = 'N/A';
          back200MTime = elements[12]['title'];
        } else {
          back200YTime = 'N/A';
          back200MTime = 'N/A';
        }
      });
      print('back' + back200YTime);
      print('back' + back200MTime);
      times
          .replaceRange(24, 27, [back200MTime, '200 Backstroke', back200YTime]);
    }
  }

  void brst100YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_100BR.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          brst100YTime = elements[7]['title'];
          brst100MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          brst100YTime = elements[7]['title'];
          brst100MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          brst100YTime = 'N/A';
          brst100MTime = elements[12]['title'];
        } else {
          brst100YTime = 'N/A';
          brst100MTime = 'N/A';
        }
      });
      print('brst' + brst100YTime);
      print('brst' + brst100MTime);
      times.replaceRange(
          27, 30, [brst100MTime, '100 Breaststroke', brst100YTime]);
    }
  }

  void brst200YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_200BR.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          brst200YTime = elements[7]['title'];
          brst200MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          brst200YTime = elements[7]['title'];
          brst200MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          brst200YTime = 'N/A';
          brst200MTime = elements[12]['title'];
        } else {
          brst200YTime = 'N/A';
          brst200MTime = 'N/A';
        }
      });
      print('brst' + brst200YTime);
      print('brst' + brst200MTime);
      times.replaceRange(
          30, 33, [brst200MTime, '200 Breaststroke', brst200YTime]);
    }
  }

  void fly100YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_100FL.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          fly100YTime = elements[7]['title'];
          fly100MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          fly100YTime = elements[7]['title'];
          fly100MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          fly100YTime = 'N/A';
          fly100MTime = elements[12]['title'];
        } else {
          fly100YTime = 'N/A';
          fly100MTime = 'N/A';
        }
      });
      print('fly ' + fly100YTime);
      print('fly' + fly100MTime);
      times.replaceRange(33, 36, [fly100MTime, '100 Butterfly', fly100YTime]);
    }
  }

  void fly200YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_200FL.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          fly200YTime = elements[7]['title'];
          fly200MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          fly200YTime = elements[7]['title'];
          fly200MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          fly200YTime = 'N/A';
          fly200MTime = elements[12]['title'];
        } else {
          fly200YTime = 'N/A';
          fly200MTime = 'N/A';
        }
      });
      print('fly' + fly200YTime);
      print('fly' + fly200MTime);
      times.replaceRange(36, 39, [fly200MTime, '200 Butterfly', fly200YTime]);
    }
  }

  void im200YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_200IM.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          im200YTime = elements[7]['title'];
          im200MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          im200YTime = elements[7]['title'];
          im200MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          im200YTime = 'N/A';
          im200MTime = elements[12]['title'];
        } else {
          im200YTime = 'N/A';
          im200MTime = 'N/A';
        }
      });
      print('IM' + im200YTime);
      print('IM' + im200MTime);
      times.replaceRange(39, 42, [im200MTime, '200 IM', im200YTime]);
    }
  }

  void im400YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper
        .loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_400IM.html')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == true) {
          im400YTime = elements[7]['title'];
          im400MTime = elements[12]['title'];
        } else if (elements[7]['title'].contains('.') == true &&
            elements[12]['title'].contains('.') == false) {
          im400YTime = elements[7]['title'];
          im400MTime = 'N/A';
        } else if (elements[7]['title'].contains('.') == false &&
            elements[12]['title'].contains('.') == true) {
          im400YTime = 'N/A';
          im400MTime = elements[12]['title'];
        } else {
          im400YTime = 'N/A';
          im400MTime = 'N/A';
        }
      });
      print('IM' + im400YTime);
      print('IM' + im400MTime);
      times.replaceRange(42, 45, [im400MTime, '400 IM', im400YTime]);
    }
  }

  @override
  void initState() {
    super.initState();
    free50YScrap();
    free100YScrap();
    free200YScrap();
    free500YScrap();
    free1000YScrap();
    free1650YScrap();
    back100YScrap();
    back200YScrap();
    brst100YScrap();
    brst200YScrap();
    fly100YScrap();
    fly200YScrap();
    im200YScrap();
    im400YScrap();
  }

  List<dynamic> times = [
    'LCM',
    'Event',
    'SCY',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        scrollDirection: Axis.vertical,
        controller: ScrollController(),
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 3.0,
        ),
        children: times
            .map((e) => Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue[200],
                  alignment: Alignment.center,
                  child: Text('$e'),
                ))
            .toList(),
      ),
    );
  }
}
