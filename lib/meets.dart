import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class Meets extends StatefulWidget {
  final String url;
  Meets(this.url);

  @override
  _MeetsState createState() => _MeetsState();
}

class _MeetsState extends State<Meets> {
  String fullUrl = '';
  List elements = [];
  List manipulatedElements = [];
  List originalElements = [];

  void grabData() async {
    final swimmerPage = WebScraper("https://www.swimmingrank.com");
    // scraping swimmer age
    if (await swimmerPage.loadWebPage(widget.url)) {
      elements = swimmerPage.getElementTitle('tr');
      elements.removeRange(0, 5);
      elements.removeWhere((item) => item == elements[2]);
      elements.removeLast();
      elements.removeWhere((item) => item.contains('Age'));
      elements.removeWhere((item) => item.contains('seconds'));
    }
  }

  void createOriginal() async {
    final swimmerPage = WebScraper("https://www.swimmingrank.com");
    // scraping swimmer age
    if (await swimmerPage.loadWebPage(widget.url)) {
      originalElements = swimmerPage.getElementTitle('tr');
      originalElements.removeRange(0, 5);
      originalElements.removeWhere((item) => item == elements[2]);
      originalElements.removeLast();
    }
  }

  meetDialog(context, index, manipulatedElements) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(elements[index]),
            content: Container(
              child: ListView.builder(
                  itemCount: manipulatedElements.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return Card(
                      child: ListTile(
                        onTap: () {},
                        title: Text(manipulatedElements[index]),
                      ),
                    );
                  }),
            ),
            actions: [
              MaterialButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ]);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    grabData();
    createOriginal();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: elements.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  setState(() {
                    manipulatedElements = originalElements;
                    manipulatedElements.removeRange(
                        0,
                        manipulatedElements
                            .indexWhere((item) => item == elements[index]));
                    manipulatedElements.removeRange(
                        manipulatedElements
                            .indexWhere((item) => item == elements[index + 1]),
                        manipulatedElements.length);
                  });

                  meetDialog(context, index, manipulatedElements);
                  manipulatedElements = originalElements;
                },
                title: Text(elements[index]),
              ),
            );
          }),
    );
  }
}
