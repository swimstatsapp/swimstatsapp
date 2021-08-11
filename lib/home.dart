import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:database/model/swimmer.dart';
import 'package:database/database/swimmer_database.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'package:web_scraper/web_scraper.dart';

List<Swimmer> swimmers = [];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;

  String _url = 'https://swimstatsapp.github.io/#donate';
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  // error dialog
  welcomeDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: double.maxFinite,
            child: DefaultTabController(
              length: 7,
              child: Builder(
                  builder: (BuildContext context) => Center(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(children: [
                            TabPageSelector(),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          width: 100,
                                          image:
                                              AssetImage('./assets/logo.png'),
                                        ),
                                        SizedBox(height: 10),
                                        Text('Welcome to SwimStats',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 35)),
                                        Text(
                                            'Here is a small guide to get you started.'),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 7),
                                        Image.asset('assets/1.gif', width: 140),
                                        SizedBox(height: 20),
                                        Text(
                                            'Click the floating action button to add a swimmer.')
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 7),
                                        Image.asset('assets/2.gif', width: 140),
                                        SizedBox(height: 20),
                                        Text(
                                            'Click the hamburger menu or swipe right to open more options.')
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 7),
                                        Image.asset('assets/3.gif', width: 140),
                                        SizedBox(height: 20),
                                        Text(
                                            'Tap on the swimmer card to display more swimmer information.')
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 7),
                                        Image.asset('assets/4.gif', width: 140),
                                        SizedBox(height: 20),
                                        Text(
                                            'Navigate to the compare section and click the floating action button to add goals.')
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 7),
                                        Image.asset('assets/5.gif', width: 140),
                                        SizedBox(height: 20),
                                        Text(
                                            'Swipe down on home page to reload swimmer data.')
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 7),
                                        Icon(Icons.thumb_up_alt, size: 40),
                                        SizedBox(height: 20),
                                        Text('Enjoy!',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        SizedBox(height: 15),
                                        Text(
                                          'If you like this app, please consider donating to SwimStats to support the development.',
                                        ),
                                        Center(
                                          child: TextButton(
                                              child: Text('Buy us a coffee'),
                                              onPressed: () {
                                                _launchURL();
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      TabController controller =
                                          DefaultTabController.of(context)!;
                                      print('pressed back');
                                      if (!controller.indexIsChanging) {
                                        controller
                                            .animateTo(controller.index - 1);
                                      }
                                    },
                                    icon: Icon(Icons.arrow_left)),
                                IconButton(
                                    onPressed: () {
                                      TabController controller =
                                          DefaultTabController.of(context)!;
                                      print('pressed next');
                                      if (!controller.indexIsChanging) {
                                        controller
                                            .animateTo(controller.index + 1);
                                      }
                                    },
                                    icon: Icon(Icons.arrow_right)),
                              ],
                            ),
                          ]),
                        ),
                      )),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    refreshInitSwimmers();
  }

  //refresh swimmer list
  Future refreshSwimmers() async {
    setState(() => isLoading = true);

    swimmers = await SwimmerDatabase.instance.readAll();

    setState(() => isLoading = false);
  }

  Future refreshInitSwimmers() async {
    setState(() => isLoading = true);

    swimmers = await SwimmerDatabase.instance.readAll();
    if (swimmers.isEmpty) {
      welcomeDialog(context);
    }
    setState(() => isLoading = false);
  }

  //double tap to exit app
  DateTime backbuttonpressedTime = DateTime.now();
  // double click to exit
  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton =
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
        msg: "Click again to exit app",
        backgroundColor: Colors.black.withOpacity(0.3),
        textColor: Colors.white,
      );
      return false;
    }
    return true;
  }

// share swimmer identifier
  createShareSwimmerDialog(context, Swimmer swimmer) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text('Share'),
            content: Container(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(swimmer.firstName! + " " + swimmer.lastName!,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\'s identifier:'),
                  ]),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(swimmer.identifier!,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              MaterialButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                child: Text('Copy'),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: swimmer.identifier));
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                    msg: "Copied to clipboard",
                    backgroundColor: Colors.black.withOpacity(0.3),
                    textColor: Colors.white,
                  );
                  Navigator.pop(context);
                },
              ),
            ]);
      },
    );
  }

  //build the swimmer list
  Widget buildList() => ListView(
        children: <Widget>[
              if (swimmers.isEmpty)
                Center(
                    child: isLoading
                        ? JumpingDotsProgressIndicator(
                            fontSize: 20.0,
                            color: Colors.black,
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                            child: Column(
                              children: [
                                Text('No swimmers added yet.'),
                                SizedBox(height: 20),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          style: TextStyle(color: Colors.black),
                                          text:
                                              'Add a swimmer by clicking the '),
                                      WidgetSpan(
                                        child: Icon(Icons.menu),
                                      ),
                                      TextSpan(
                                          style: TextStyle(color: Colors.black),
                                          text: ' button below.'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
            ] +
            swimmers
                .map((swimmer) => InkWell(
                      onTap: () {
                        print(swimmer.free1000YTime);
                        Navigator.pushNamed(
                          context,
                          '/swimmerinfo',
                          arguments: {'swimmer': swimmer},
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: ListTile(
                          trailing: PopupMenuButton(
                              itemBuilder: (BuildContext context) => [
                                    PopupMenuItem(
                                      child: ListTile(
                                          leading: Icon(Icons.delete),
                                          title: Text('Delete'),
                                          onTap: () async {
                                            await SwimmerDatabase.instance
                                                .delete(swimmer.id!);
                                            Fluttertoast.showToast(
                                              msg: "Deleted swimmer.",
                                              backgroundColor:
                                                  Colors.black.withOpacity(0.3),
                                              textColor: Colors.white,
                                            );
                                            refreshSwimmers();
                                            Navigator.pop(context);
                                          }),
                                    ),
                                    PopupMenuItem(
                                      child: ListTile(
                                          leading: Icon(Icons.share),
                                          title: Text('Share'),
                                          onTap: () {
                                            print('Pressed share!');
                                            createShareSwimmerDialog(
                                                context, swimmer);
                                          }),
                                    ),
                                  ]),
                          title: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Text('${swimmer.id}',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    if (swimmer.swimmerGender == "Male")
                                      Text(
                                          swimmer.firstName! +
                                              ' ' +
                                              swimmer.lastName!,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue[800],
                                          )),
                                    if (swimmer.swimmerGender == "Female")
                                      Text(
                                          swimmer.firstName! +
                                              ' ' +
                                              swimmer.lastName!,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.pinkAccent,
                                          )),
                                  ],
                                ),
                                SizedBox(height: 6),
                                // Row(children: [
                                //   Text('Age: ',
                                //       style:
                                //           TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                //   Text('${swimmer.age} ',
                                //       style: TextStyle(
                                //         fontSize: 14,
                                //       )),
                                // ]),
                                // SizedBox(height: 6),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Team: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '${swimmer.swimmerClub}',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Last Meet: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${swimmer.swimmerLastMeet} (${swimmer.swimmerLastMeetDate})',
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
      );
// error dialog

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Swimmer'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Center(
                  child: Column(
                children: [
                  Container(
                    width: 200,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Image(
                      image: AssetImage('assets/titlelogo.png'),
                    ),
                  )
                ],
              )),
            ),
            ListTile(
                leading: Icon(Icons.menu_book_sharp, color: Colors.black),
                title: Text('How To Use'),
                onTap: () {
                  welcomeDialog(context);
                }),
            ListTile(
                leading: Icon(Icons.info_outline_rounded, color: Colors.black),
                title: Text('About'),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                }),
            ListTile(
                leading: Icon(Icons.privacy_tip_outlined, color: Colors.black),
                title: Text('Privacy Policy'),
                onTap: () {
                  Navigator.pushNamed(context, '/privacypolicy');
                }),
            ListTile(
                leading: Icon(Icons.favorite, color: Colors.black),
                title: Text('Donate'),
                onTap: () {
                  String _url = 'https://swimstatsapp.github.io/#donate';
                  void _launchURL() async => await canLaunch(_url)
                      ? await launch(_url)
                      : throw 'Could not launch $_url';

                  _launchURL();
                }),
            ListTile(
                leading: Icon(Icons.bug_report, color: Colors.black),
                title: Text('Report Bug'),
                onTap: () {
                  String _url =
                      'https://github.com/swimstatsapp/swimstatsapp/issues';
                  void _launchURL() async => await canLaunch(_url)
                      ? await launch(_url)
                      : throw 'Could not launch $_url';

                  _launchURL();
                }),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: RefreshIndicator(
            displacement: 10,
            child: buildList(),
            onRefresh: () async {
              ScaffoldMessengerState scaffoldMessenger =
                  ScaffoldMessenger.of(context);
              for (int x = 0; x < swimmers.length; x++) {
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

                final swimmerPage = WebScraper("https://www.swimmingrank.com");

                try {
                  // scraping swimmer age
                  if (await swimmerPage.loadWebPage(swimmers[x].fullUrl!)) {
                    List<Map<String, dynamic>> elements =
                        swimmerPage.getElement('td.ui-helper-center', ['']);
                    swimmers[x].swimmerintAge = int.parse(elements[2]['title']);
                  }
                  // scraping swimmer club
                  if (await swimmerPage.loadWebPage(swimmers[x].fullUrl!)) {
                    List<Map<String, dynamic>> elements =
                        swimmerPage.getElement('td > button', ['']);
                    swimmers[x].swimmerClub = elements[0]['title'];
                  }
                  //scraping swimmer gender
                  if (await swimmerPage.loadWebPage(swimmers[x].fullUrl!)) {
                    List<Map<String, dynamic>> elements =
                        swimmerPage.getElement('td.ui-helper-center', ['']);
                    swimmers[x].swimmerGender = elements[3]['title'];
                  }
                  //scraping swimmer's last swim meet
                  if (await swimmerPage.loadWebPage(swimmers[x].fullUrl!)) {
                    List<Map<String, dynamic>> elements =
                        swimmerPage.getElement('th', ['']);
                    swimmers[x].swimmerLastMeet = elements[5]['title'];
                  }

                  if (await swimmerPage.loadWebPage(swimmers[x].fullUrl!)) {
                    List<Map<String, dynamic>> elements =
                        swimmerPage.getElement('th', ['']);
                    swimmers[x].swimmerLastMeetDate = elements[6]['title'];
                  }
                  String free50Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_50FR.html";
                  final free50Scrap = WebScraper('https://swimmingrank.com');
                  if (await free50Scrap.loadWebPage('$free50Url')) {
                    List<Map<String, dynamic>> elements = free50Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                      print(free50YTime);
                    });
                  }

                  String free100Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_100FR.html";
                  final free100Scrap = WebScraper('https://swimmingrank.com');
                  if (await free100Scrap.loadWebPage('$free100Url')) {
                    List<Map<String, dynamic>> elements = free100Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                    print(free100YTime);
                  }

                  String free200Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_200FR.html";
                  final free200Scrap = WebScraper('https://swimmingrank.com');
                  if (await free200Scrap.loadWebPage('$free200Url')) {
                    List<Map<String, dynamic>> elements = free200Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String free400Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_400500FR.html";
                  final free400Scrap = WebScraper('https://swimmingrank.com');
                  if (await free400Scrap.loadWebPage('$free400Url')) {
                    List<Map<String, dynamic>> elements = free400Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String free800Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_8001000FR.html";
                  final free800Scrap = WebScraper('https://swimmingrank.com');
                  if (await free800Scrap.loadWebPage('$free800Url')) {
                    List<Map<String, dynamic>> elements = free800Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String free1500Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_15001650FR.html";
                  final free1500Scrap = WebScraper('https://swimmingrank.com');
                  if (await free1500Scrap.loadWebPage('$free1500Url')) {
                    List<Map<String, dynamic>> elements = free1500Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String back100Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_100BK.html";
                  final back100Scrap = WebScraper('https://swimmingrank.com');
                  if (await back100Scrap.loadWebPage('$back100Url')) {
                    List<Map<String, dynamic>> elements = back100Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String back200Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_200BK.html";
                  final back200Scrap = WebScraper('https://swimmingrank.com');
                  if (await back200Scrap.loadWebPage('$back200Url')) {
                    List<Map<String, dynamic>> elements = back200Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String brst100Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_100BR.html";
                  final brst100Scrap = WebScraper('https://swimmingrank.com');
                  if (await brst100Scrap.loadWebPage('$brst100Url')) {
                    List<Map<String, dynamic>> elements = brst100Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String brst200Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_200BR.html";
                  final brst200Scrap = WebScraper('https://swimmingrank.com');
                  if (await brst200Scrap.loadWebPage('$brst200Url')) {
                    List<Map<String, dynamic>> elements = brst200Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String fly100Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_100FL.html";
                  final fly100Scrap = WebScraper('https://swimmingrank.com');
                  if (await fly100Scrap.loadWebPage('$fly100Url')) {
                    List<Map<String, dynamic>> elements = fly100Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String fly200Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_200FL.html";
                  final fly200Scrap = WebScraper('https://swimmingrank.com');
                  if (await fly200Scrap.loadWebPage('$fly200Url')) {
                    List<Map<String, dynamic>> elements = fly200Scrap
                        .getElement(
                            'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String im200Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_200IM.html";
                  final im200Scrap = WebScraper('https://swimmingrank.com');
                  if (await im200Scrap.loadWebPage('$im200Url')) {
                    List<Map<String, dynamic>> elements = im200Scrap.getElement(
                        'body > div > table > tbody > tr > td', ['title']);
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
                  }

                  String im400Url = "/" +
                      swimmers[x].currentRegion! +
                      "/strokes/strokes_" +
                      swimmers[x].currentLSCidentifier! +
                      "/" +
                      swimmers[x].identifier! +
                      "_400IM.html";
                  final im400Scrap = WebScraper('https://swimmingrank.com');
                  if (await im400Scrap.loadWebPage('$im400Url')) {
                    List<Map<String, dynamic>> elements = im400Scrap.getElement(
                        'body > div > table > tbody > tr > td', ['title']);
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
                  }
                  final swimmer = Swimmer(
                      firstName: swimmers[x].firstName,
                      lastName: swimmers[x].lastName,
                      identifier: swimmers[x].identifier,
                      swimmerintAge: swimmers[x].swimmerintAge,
                      swimmerClub: swimmers[x].swimmerClub,
                      swimmerGender: swimmers[x].swimmerGender,
                      swimmerLastMeet: swimmers[x].swimmerLastMeet,
                      swimmerLastMeetDate: swimmers[x].swimmerLastMeetDate,
                      free50YTime: '$free50YTime',
                      free50MTime: '$free50MTime',
                      free100YTime: '$free100YTime',
                      free100MTime: '$free100MTime',
                      free200YTime: '$free200YTime',
                      free200MTime: '$free200MTime',
                      free500YTime: '$free500YTime',
                      free400MTime: '$free400MTime',
                      free1000YTime: '$free1000YTime',
                      free800MTime: '$free800MTime',
                      free1650YTime: '$free1650YTime',
                      free1500MTime: '$free1500MTime',
                      back100YTime: '$back100YTime',
                      back100MTime: '$back100MTime',
                      back200YTime: '$back200YTime',
                      back200MTime: '$back200MTime',
                      brst100YTime: '$brst100YTime',
                      brst100MTime: '$brst100MTime',
                      brst200YTime: '$brst200YTime',
                      brst200MTime: '$brst200MTime',
                      fly100YTime: '$fly100YTime',
                      fly100MTime: '$fly100MTime',
                      fly200YTime: '$fly200YTime',
                      fly200MTime: '$fly200MTime',
                      im200YTime: '$im200YTime',
                      im200MTime: '$im200MTime',
                      im400YTime: '$im400YTime',
                      im400MTime: '$im400MTime',
                      fullUrl: swimmers[x].fullUrl,
                      currentRegion: swimmers[x].currentRegion,
                      currentLSCidentifier: swimmers[x].currentLSCidentifier);

                  await SwimmerDatabase.instance.update(swimmer);
                  scaffoldMessenger.showSnackBar(SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green[50],
                    content: Row(
                      children: [
                        Icon(Icons.check, color: Colors.green),
                        SizedBox(width: 10),
                        Text('Successfully refreshed swimmer.',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ));
                  print('Pressed!');
                } catch (e) {
                  try {
                    // scraping swimmer age
                    if (await swimmerPage.loadWebPage(swimmers[x].fullUrl!)) {
                      List<Map<String, dynamic>> elements =
                          swimmerPage.getElement('td.ui-helper-center', ['']);
                      swimmers[x].swimmerintAge =
                          int.parse(elements[1]['title']);
                    }
                    // scraping swimmer club
                    if (await swimmerPage.loadWebPage(swimmers[x].fullUrl!)) {
                      List<Map<String, dynamic>> elements =
                          swimmerPage.getElement('td > button', ['']);
                      swimmers[x].swimmerClub = elements[0]['title'];
                    }
                    //scraping swimmer gender
                    if (await swimmerPage.loadWebPage(swimmers[x].fullUrl!)) {
                      List<Map<String, dynamic>> elements =
                          swimmerPage.getElement('td.ui-helper-center', ['']);
                      swimmers[x].swimmerGender = elements[2]['title'];
                    }
                    //scraping swimmer's last swim meet
                    if (await swimmerPage.loadWebPage(swimmers[x].fullUrl!)) {
                      List<Map<String, dynamic>> elements =
                          swimmerPage.getElement('th', ['']);
                      swimmers[x].swimmerLastMeet = elements[4]['title'];
                    }

                    if (await swimmerPage.loadWebPage(swimmers[x].fullUrl!)) {
                      List<Map<String, dynamic>> elements =
                          swimmerPage.getElement('th', ['']);
                      swimmers[x].swimmerLastMeetDate = elements[5]['title'];
                    }

                    final swimmer = Swimmer(
                        firstName: swimmers[x].firstName,
                        lastName: swimmers[x].lastName,
                        identifier: swimmers[x].identifier,
                        swimmerintAge: swimmers[x].swimmerintAge,
                        swimmerClub: swimmers[x].swimmerClub,
                        swimmerGender: swimmers[x].swimmerGender,
                        swimmerLastMeet: swimmers[x].swimmerLastMeet,
                        swimmerLastMeetDate: swimmers[x].swimmerLastMeetDate,
                        free50YTime: '$free50YTime',
                        free50MTime: '$free50MTime',
                        free100YTime: '$free100YTime',
                        free100MTime: '$free100MTime',
                        free200YTime: '$free200YTime',
                        free200MTime: '$free200MTime',
                        free500YTime: '$free500YTime',
                        free400MTime: '$free400MTime',
                        free1000YTime: '$free1000YTime',
                        free800MTime: '$free800MTime',
                        free1650YTime: '$free1650YTime',
                        free1500MTime: '$free1500MTime',
                        back100YTime: '$back100YTime',
                        back100MTime: '$back100MTime',
                        back200YTime: '$back200YTime',
                        back200MTime: '$back200MTime',
                        brst100YTime: '$brst100YTime',
                        brst100MTime: '$brst100MTime',
                        brst200YTime: '$brst200YTime',
                        brst200MTime: '$brst200MTime',
                        fly100YTime: '$fly100YTime',
                        fly100MTime: '$fly100MTime',
                        fly200YTime: '$fly200YTime',
                        fly200MTime: '$fly200MTime',
                        im200YTime: '$im200YTime',
                        im200MTime: '$im200MTime',
                        im400YTime: '$im400YTime',
                        im400MTime: '$im400MTime',
                        fullUrl: swimmers[x].fullUrl,
                        currentRegion: swimmers[x].currentRegion,
                        currentLSCidentifier: swimmers[x].currentLSCidentifier);
                    await SwimmerDatabase.instance.create(swimmer);
                    scaffoldMessenger.showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green[50],
                      content: Row(
                        children: [
                          Icon(Icons.check, color: Colors.green),
                          SizedBox(width: 10),
                          Text('Successfully refreshed swimmer.',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ));
                    print('Pressed!');
                  } catch (e) {
                    print('Invalid!');
                    scaffoldMessenger.showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red[50],
                      content: Row(
                        children: [
                          Icon(Icons.check, color: Colors.red),
                          SizedBox(width: 10),
                          Text('Error: No internet connection.',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ));
                    print(e);
                  }
                }
              }
            }),
      ),
      floatingActionButton: SpeedDial(
        label: Text('Menu'),
        marginEnd: 18,
        marginBottom: 20,
        icon: Icons.menu,
        activeIcon: Icons.close,
        buttonSize: 56,
        visible: true,
        closeManually: false,
        renderOverlay: false,
        curve: Curves.easeInOut,
        overlayColor: Colors.black,
        overlayOpacity: 0.3,
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue[400],
            label: 'Add By Name',
            labelStyle: TextStyle(
              fontSize: 18.0,
            ),
            onTap: () async {
              Navigator.pushNamed(context, '/swimmermenu').then((value) {
                refreshSwimmers();
              });
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.add),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue[400],
            label: 'Add By Identifier',
            labelStyle: TextStyle(
              fontSize: 18.0,
            ),
            onTap: () async {
              Navigator.pushNamed(context, '/identifiermenu').then((value) {
                refreshSwimmers();
              });
            },
          ),
        ],
      ),
    );
  }
}
