import 'package:flutter/material.dart';
import 'package:swimstatsapp/webscrapper.dart';
import 'package:web_scraper/web_scraper.dart';

class DisplayTime extends StatefulWidget {
  const DisplayTime({Key? key}) : super(key: key);

  @override
  _DisplayTimeState createState() => _DisplayTimeState();
}


class _DisplayTimeState extends State<DisplayTime> {

  String free50YTime = '';
  String free100YTime = '';
  String free200YTime = '';
  String free500YTime = '';
  String free1000YTime = '';
  String free1650YTime = '';
  String back100YTime = '';
  String back200YTime = '';
  String brst100YTime = '';
  String brst200YTime = '';
  String fly100YTime = '';
  String fly200YTime = '';
  String im200YTime = '';
  String im400YTime = '';

  void free50YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_50FR.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        free50YTime = elements[7]['title'];
      });
      print(free50YTime);
    }

  }

  void free100YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_100FR.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        free100YTime = elements[7]['title'];
      });
      print(free100YTime);
    }

  }

  void free200YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_200FR.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        free200YTime = elements[7]['title'];
      });
      print(free200YTime);
    }

  }

  void free500YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_400500FR.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        free500YTime = elements[7]['title'];
      });
      print(free500YTime);
    }

  }

  void free1650YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_15001650FR.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        free1650YTime = elements[7]['title'];
      });
      print(free1650YTime);
    }

  }

  void back100YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_100BK.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        back100YTime = elements[7]['title'];
      });
      print(back100YTime);
    }

  }

  void back200YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_200BK.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        back200YTime = elements[7]['title'];
      });
      print(back200YTime);
    }

  }

  void brst100YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_100BR.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        brst100YTime = elements[7]['title'];
      });
      print(brst100YTime);
    }

  }

  void brst200YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_200BR.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        brst200YTime = elements[7]['title'];
      });
      print(brst200YTime);
    }

  }

  void fly100YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_100FL.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        fly100YTime = elements[7]['title'];
      });
      print(fly100YTime);
    }

  }

  void fly200YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_200FL.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        fly200YTime = elements[7]['title'];
      });
      print(fly200YTime);
    }

  }

  void im200YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_200IM.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        im200YTime = elements[7]['title'];
      });
      print(im200YTime);
    }

  }

  void im400YScrap() async {
    final webScraper = WebScraper('https://swimmingrank.com');
    if (await webScraper.loadWebPage('/cal/strokes/strokes_scs/MDAKRAYEU_400IM.html')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body > div > table > tbody > tr > td', ['title']);
      setState(() {
        im400YTime = elements[7]['title'];
      });
      print(im400YTime);
    }

  }

  @override
  void initState() {
    super.initState();
    free50YScrap();
    free100YScrap();
    free200YScrap();
    free500YScrap();
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text('$free50YTime')
            ),
            Container(
              child: Text('$free100YTime'),
            ),
            Container(
              child: Text('$free200YTime'),
            ),
            Container(
              child: Text('$free500YTime'),
            ),
            Container(
              child: Text('$free1650YTime'),
            ),
            Container(
              child: Text('$back100YTime'),
            ),
            Container(
              child: Text('$back200YTime'),
            ),
            Container(
              child: Text('$brst100YTime'),
            ),
            Container(
              child: Text('$brst200YTime'),
            ),
            Container(
              child: Text('$fly100YTime'),
            ),
            Container(
              child: Text('$fly200YTime'),
            ),
            Container(
              child: Text('$im200YTime'),
            ),
            Container(
              child: Text('$im400YTime'),
            ),
          ],
        ),
      ),
    );
  }
}
