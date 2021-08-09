import 'package:flutter/material.dart';
import 'package:database/database/swimmer_database.dart';
import 'package:database/model/swimmer.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:web_scraper/web_scraper.dart';

class IdentifierMenu extends StatefulWidget {
  const IdentifierMenu({Key? key}) : super(key: key);

  @override
  _IdentifierMenuState createState() => _IdentifierMenuState();
}

class _IdentifierMenuState extends State<IdentifierMenu> {
  @override
  Widget build(BuildContext context) {
    //key for form validation
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    //swimmer fields
    String? _firstName;
    String? _lastName;
    String _currentRegion = 'aft';
    String currentLSCidentifier = '';
    String _currentLSC = 'Florida';
    List<String> lsc = ['Florida', 'Florida Gold Coast', 'Southeastern'];
    String swimmerAge = '';
    int swimmerintAge = 0;
    String swimmerClub = '';
    String swimmerGender = '';
    String swimmerLastMeet = '';
    String swimmerLastMeetDate = '';
    String swimmerIdentifier = '';

    Widget _buildIdentifier() {
      return TextFormField(
          decoration: InputDecoration(
            hintText: 'Identifier',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.blueAccent,
            ),
            filled: true,
            fillColor: Colors.blue[50],
          ),
          onSaved: (value) {
            swimmerIdentifier = value!;
          });
    }

// error dialog
    errorDialog(context) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Error'),
              content: Container(
                child: Row(
                  children: [
                    Flexible(
                        child:
                            Text('Swimmer does not exist. Please try again.')),
                  ],
                ),
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

    return Scaffold(
        appBar: AppBar(
          title: Text('Add New Swimmer'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () async {
                  if (_formkey.currentState!.validate() == true) {
                    _formkey.currentState!.save();
                    showGeneralDialog(
                        context: context,
                        barrierColor: Colors.black54,
                        pageBuilder: (_, __, ___) => Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    JumpingDotsProgressIndicator(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                    Text('Submitting...',
                                        style: TextStyle(color: Colors.white)),
                                  ]),
                            )));

                    // //creating usable LSC output
                    if (_currentLSC == 'Florida') {
                      currentLSCidentifier = 'fl';
                    }
                    if (_currentLSC == 'Florida Gold Coast') {
                      currentLSCidentifier = 'fg';
                    }
                    if (_currentLSC == 'Southeastern') {
                      currentLSCidentifier = 'se';
                    }
                    if (_currentLSC == 'Alaska') {
                      currentLSCidentifier = 'ak';
                    }
                    if (_currentLSC == 'Arizona') {
                      currentLSCidentifier = 'az';
                    }
                    if (_currentLSC == 'Southern California') {
                      currentLSCidentifier = 'scs';
                    }
                    if (_currentLSC == 'Pacific') {
                      currentLSCidentifier = 'pc';
                    }
                    if (_currentLSC == 'San Diego - Imperial') {
                      currentLSCidentifier = 'si';
                    }
                    if (_currentLSC == 'Central') {
                      currentLSCidentifier = 'cc';
                    }
                    if (_currentLSC == 'Sierra Nevada') {
                      currentLSCidentifier = 'sn';
                    }
                    if (_currentLSC == 'Colorado') {
                      currentLSCidentifier = 'co';
                    }
                    if (_currentLSC == 'New Mexico') {
                      currentLSCidentifier = 'nm';
                    }
                    if (_currentLSC == 'Utah') {
                      currentLSCidentifier = 'ut';
                    }
                    if (_currentLSC == 'Wyoming') {
                      currentLSCidentifier = 'wy';
                    }
                    if (_currentLSC == 'Connecticut') {
                      currentLSCidentifier = 'ct';
                    }
                    if (_currentLSC == 'Maine') {
                      currentLSCidentifier = 'me';
                    }
                    if (_currentLSC == 'New England') {
                      currentLSCidentifier = 'ne';
                    }
                    if (_currentLSC == 'Maryland') {
                      currentLSCidentifier = 'md';
                    }
                    if (_currentLSC == 'Potomac Valley') {
                      currentLSCidentifier = 'pv';
                    }
                    if (_currentLSC == 'Virginia') {
                      currentLSCidentifier = 'va';
                    }
                    if (_currentLSC == 'Allegheny Mountain') {
                      currentLSCidentifier = 'am';
                    }
                    if (_currentLSC == 'Mid Atlantic') {
                      currentLSCidentifier = 'ma';
                    }
                    if (_currentLSC == 'New Jersey') {
                      currentLSCidentifier = 'nj';
                    }
                    if (_currentLSC == 'Georgia') {
                      currentLSCidentifier = 'ga';
                    }
                    if (_currentLSC == 'North Carolina') {
                      currentLSCidentifier = 'nc';
                    }
                    if (_currentLSC == 'South Carolina') {
                      currentLSCidentifier = 'fl';
                    }
                    if (_currentLSC == 'Hawaii') {
                      currentLSCidentifier = 'hi';
                    }
                    if (_currentLSC == 'Inland Empire') {
                      currentLSCidentifier = 'ie';
                    }
                    if (_currentLSC == 'Montana') {
                      currentLSCidentifier = 'mt';
                    }
                    if (_currentLSC == 'Oregon') {
                      currentLSCidentifier = 'or';
                    }
                    if (_currentLSC == 'Pacific Northwest') {
                      currentLSCidentifier = 'pn';
                    }
                    if (_currentLSC == 'Snake River') {
                      currentLSCidentifier = 'sr';
                    }
                    if (_currentLSC == 'Illinois') {
                      currentLSCidentifier = 'il';
                    }
                    if (_currentLSC == 'Iowa') {
                      currentLSCidentifier = 'ia';
                    }
                    if (_currentLSC == 'Indiana') {
                      currentLSCidentifier = 'in';
                    }
                    if (_currentLSC == 'Kentucky') {
                      currentLSCidentifier = 'ky';
                    }
                    if (_currentLSC == 'West Virginia') {
                      currentLSCidentifier = 'wv';
                    }
                    if (_currentLSC == 'Lake Erie') {
                      currentLSCidentifier = 'fl';
                    }
                    if (_currentLSC == 'Michigan') {
                      currentLSCidentifier = 'mi';
                    }
                    if (_currentLSC == 'Ohio') {
                      currentLSCidentifier = 'oh';
                    }
                    if (_currentLSC == 'Louisiana') {
                      currentLSCidentifier = 'la';
                    }
                    if (_currentLSC == 'Mississippi') {
                      currentLSCidentifier = 'ms';
                    }
                    if (_currentLSC == 'Minnesota') {
                      currentLSCidentifier = 'mn';
                    }
                    if (_currentLSC == 'North Dakota') {
                      currentLSCidentifier = 'nd';
                    }
                    if (_currentLSC == 'South Dakota') {
                      currentLSCidentifier = 'sd';
                    }
                    if (_currentLSC == 'Wisconsin') {
                      currentLSCidentifier = 'wi';
                    }
                    if (_currentLSC == 'Adirondack') {
                      currentLSCidentifier = 'ad';
                    }
                    if (_currentLSC == 'Metropolitan') {
                      currentLSCidentifier = 'mr';
                    }
                    if (_currentLSC == 'Niagara') {
                      currentLSCidentifier = 'ni';
                    }
                    if (_currentLSC == 'Border') {
                      currentLSCidentifier = 'bd';
                    }
                    if (_currentLSC == 'Gulf') {
                      currentLSCidentifier = 'gu';
                    }
                    if (_currentLSC == 'North Texas') {
                      currentLSCidentifier = 'nt';
                    }
                    if (_currentLSC == 'South Texas') {
                      currentLSCidentifier = 'st';
                    }
                    if (_currentLSC == 'West Texas') {
                      currentLSCidentifier = 'wt';
                    }
                    if (_currentLSC == 'Arkansas') {
                      currentLSCidentifier = 'ar';
                    }
                    if (_currentLSC == 'Missouri Valley') {
                      currentLSCidentifier = 'mv';
                    }
                    if (_currentLSC == 'Oklahoma') {
                      currentLSCidentifier = 'ok';
                    }
                    if (_currentLSC == 'Midwestern') {
                      currentLSCidentifier = 'mw';
                    }
                    if (_currentLSC == 'Ozark') {
                      currentLSCidentifier = 'oz';
                    }

                    //using index of array to correspond to value
                    List letter = [
                      'A',
                      'B',
                      'C',
                      'D',
                      'E',
                      'F',
                      'G',
                      'H',
                      'I',
                      'J',
                      'K',
                      'L',
                      'M',
                      'O',
                      'P',
                      'Q',
                      'R',
                      'S',
                      'T',
                      'U',
                      'V',
                      'W',
                      'X',
                      'Y',
                      'Z',
                      '0',
                      '1',
                      '2',
                      '3',
                      '4',
                      '5'
                    ];

                    String fullUrl = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_meets.html";

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

                    final swimmerPage =
                        WebScraper("https://www.swimmingrank.com");

                    try {
                      // scraping swimmer name
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('h1', ['']);
                        var name = elements[0]['title'];
                        print(name);
                        if (name == 'Swimming Rank') {
                          Navigator.pop(context);
                          errorDialog(context);
                        } else {
                          List listofNames = name.split(" ");
                          _firstName = listofNames[0];
                          _lastName = listofNames[1];
                        }
                      }
                      // scraping swimmer age
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('td.ui-helper-center', ['']);
                        swimmerAge = elements[2]['title'];
                      }
                      // scraping swimmer club
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('td > button', ['']);
                        swimmerClub = elements[0]['title'];
                      }
                      //scraping swimmer gender
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('td.ui-helper-center', ['']);
                        swimmerGender = elements[3]['title'];
                      }
                      //scraping swimmer's last swim meet
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('th', ['']);
                        swimmerLastMeet = elements[5]['title'];
                      }

                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('th', ['']);
                        swimmerLastMeetDate = elements[6]['title'];
                        swimmerintAge = int.parse(swimmerAge);
                      }
                      String free50Url = "/" +
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_50FR.html";

                      final free50Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await free50Scrap.loadWebPage('$free50Url')) {
                        List<Map<String, dynamic>> elements = free50Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            free50YTime = elements[7]['title'];
                            free50MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            free50YTime = elements[7]['title'];
                            free50MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
                              elements[12]['title'].contains('.') == true) {
                            free50YTime = 'N/A';
                            free50MTime = elements[12]['title'];
                          } else {
                            free50YTime = 'N/A';
                            free50MTime = 'N/A';
                          }
                        });
                      }

                      String free100Url = "/" +
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_100FR.html";

                      final free100Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await free100Scrap.loadWebPage('$free100Url')) {
                        List<Map<String, dynamic>> elements = free100Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            free100YTime = elements[7]['title'];
                            free100MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            free100YTime = elements[7]['title'];
                            free100MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
                              elements[12]['title'].contains('.') == true) {
                            free100YTime = 'N/A';
                            free100MTime = elements[12]['title'];
                          } else {
                            free100YTime = 'N/A';
                            free100MTime = 'N/A';
                          }
                        });
                      }

                      String free200Url = "/" +
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_200FR.html";

                      final free200Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await free200Scrap.loadWebPage('$free200Url')) {
                        List<Map<String, dynamic>> elements = free200Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            free200YTime = elements[7]['title'];
                            free200MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            free200YTime = elements[7]['title'];
                            free200MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_400500FR.html";
                      final free400Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await free400Scrap.loadWebPage('$free400Url')) {
                        List<Map<String, dynamic>> elements = free400Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            free500YTime = elements[7]['title'];
                            free400MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            free500YTime = elements[7]['title'];
                            free400MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_8001000FR.html";
                      final free800Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await free800Scrap.loadWebPage('$free800Url')) {
                        List<Map<String, dynamic>> elements = free800Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            free1000YTime = elements[7]['title'];
                            free800MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            free1000YTime = elements[7]['title'];
                            free800MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_15001650FR.html";
                      final free1500Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await free1500Scrap.loadWebPage('$free1500Url')) {
                        List<Map<String, dynamic>> elements = free1500Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            free1650YTime = elements[7]['title'];
                            free1500MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            free1650YTime = elements[7]['title'];
                            free1500MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_100BK.html";
                      final back100Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await back100Scrap.loadWebPage('$back100Url')) {
                        List<Map<String, dynamic>> elements = back100Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            back100YTime = elements[7]['title'];
                            back100MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            back100YTime = elements[7]['title'];
                            back100MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_200BK.html";
                      final back200Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await back200Scrap.loadWebPage('$back200Url')) {
                        List<Map<String, dynamic>> elements = back200Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            back200YTime = elements[7]['title'];
                            back200MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            back200YTime = elements[7]['title'];
                            back200MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_100BR.html";
                      final brst100Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await brst100Scrap.loadWebPage('$brst100Url')) {
                        List<Map<String, dynamic>> elements = brst100Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            brst100YTime = elements[7]['title'];
                            brst100MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            brst100YTime = elements[7]['title'];
                            brst100MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_200BR.html";
                      final brst200Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await brst200Scrap.loadWebPage('$brst200Url')) {
                        List<Map<String, dynamic>> elements = brst200Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            brst200YTime = elements[7]['title'];
                            brst200MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            brst200YTime = elements[7]['title'];
                            brst200MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_100FL.html";
                      final fly100Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await fly100Scrap.loadWebPage('$fly100Url')) {
                        List<Map<String, dynamic>> elements = fly100Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            fly100YTime = elements[7]['title'];
                            fly100MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            fly100YTime = elements[7]['title'];
                            fly100MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_200FL.html";
                      final fly200Scrap =
                          WebScraper('https://swimmingrank.com');
                      if (await fly200Scrap.loadWebPage('$fly200Url')) {
                        List<Map<String, dynamic>> elements = fly200Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            fly200YTime = elements[7]['title'];
                            fly200MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            fly200YTime = elements[7]['title'];
                            fly200MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_200IM.html";
                      final im200Scrap = WebScraper('https://swimmingrank.com');
                      if (await im200Scrap.loadWebPage('$im200Url')) {
                        List<Map<String, dynamic>> elements = im200Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            im200YTime = elements[7]['title'];
                            im200MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            im200YTime = elements[7]['title'];
                            im200MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
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
                          _currentRegion +
                          "/strokes/strokes_" +
                          currentLSCidentifier +
                          "/" +
                          swimmerIdentifier +
                          "_400IM.html";
                      final im400Scrap = WebScraper('https://swimmingrank.com');
                      if (await im400Scrap.loadWebPage('$im400Url')) {
                        List<Map<String, dynamic>> elements = im400Scrap
                            .getElement('body > div > table > tbody > tr > td',
                                ['title']);
                        setState(() {
                          if (elements[7]['title'].contains('.') == true &&
                              elements[12]['title'].contains('.') == true) {
                            im400YTime = elements[7]['title'];
                            im400MTime = elements[12]['title'];
                          } else if (elements[7]['title'].contains('.') ==
                                  true &&
                              elements[12]['title'].contains('.') == false) {
                            im400YTime = elements[7]['title'];
                            im400MTime = 'N/A';
                          } else if (elements[7]['title'].contains('.') ==
                                  false &&
                              elements[12]['title'].contains('.') == true) {
                            im400YTime = 'N/A';
                            im400MTime = elements[12]['title'];
                          } else {
                            im400YTime = 'N/A';
                            im400MTime = 'N/A';
                          }
                        });
                      }
                      print(free1000YTime);
                      final swimmer = Swimmer(
                          firstName: '$_firstName',
                          lastName: '$_lastName',
                          identifier: '$swimmerIdentifier',
                          swimmerintAge: swimmerintAge,
                          swimmerClub: '$swimmerClub',
                          swimmerGender: '$swimmerGender',
                          swimmerLastMeet: '$swimmerLastMeet',
                          swimmerLastMeetDate: '$swimmerLastMeetDate',
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
                          fullUrl: '$fullUrl',
                          currentRegion: '$_currentRegion',
                          currentLSCidentifier: '$currentLSCidentifier');
                      print(free1000YTime);
                      await SwimmerDatabase.instance.create(swimmer);
                      Navigator.pop(context);
                      print('Pressed!');
                    } catch (e) {
                      try {
                        // scraping swimmer age
                        if (await swimmerPage.loadWebPage(fullUrl)) {
                          List<Map<String, dynamic>> elements = swimmerPage
                              .getElement('td.ui-helper-center', ['']);
                          swimmerAge = elements[1]['title'];
                        }
                        // scraping swimmer club
                        if (await swimmerPage.loadWebPage(fullUrl)) {
                          List<Map<String, dynamic>> elements =
                              swimmerPage.getElement('td > button', ['']);
                          swimmerClub = elements[0]['title'];
                        }
                        //scraping swimmer gender
                        if (await swimmerPage.loadWebPage(fullUrl)) {
                          List<Map<String, dynamic>> elements = swimmerPage
                              .getElement('td.ui-helper-center', ['']);
                          swimmerGender = elements[2]['title'];
                        }
                        //scraping swimmer's last swim meet
                        if (await swimmerPage.loadWebPage(fullUrl)) {
                          List<Map<String, dynamic>> elements =
                              swimmerPage.getElement('th', ['']);
                          swimmerLastMeet = elements[4]['title'];
                        }

                        if (await swimmerPage.loadWebPage(fullUrl)) {
                          List<Map<String, dynamic>> elements =
                              swimmerPage.getElement('th', ['']);
                          swimmerLastMeetDate = elements[5]['title'];
                          swimmerintAge = int.parse(swimmerAge);
                        }
                        String free50Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_50FR.html";

                        final free50Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await free50Scrap.loadWebPage('$free50Url')) {
                          List<Map<String, dynamic>> elements = free50Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              free50YTime = elements[6]['title'];
                              print(free50YTime);
                              free50MTime = elements[11]['title'];
                              print(free50MTime);
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              free50YTime = elements[6]['title'];
                              free50MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              free50YTime = 'N/A';
                              free50MTime = elements[11]['title'];
                            } else {
                              free50YTime = 'N/A';
                              free50MTime = 'N/A';
                            }
                          });
                        }

                        String free100Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_100FR.html";

                        final free100Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await free100Scrap.loadWebPage('$free100Url')) {
                          List<Map<String, dynamic>> elements = free100Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              free100YTime = elements[6]['title'];
                              free100MTime = elements[11]['title'];
                            } else if (elements[7]['title'].contains('.') ==
                                    true &&
                                elements[6]['title'].contains('.') == false) {
                              free100YTime = elements[7]['title'];
                              free100MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              free100YTime = 'N/A';
                              free100MTime = elements[11]['title'];
                            } else {
                              free100YTime = 'N/A';
                              free100MTime = 'N/A';
                            }
                          });
                        }

                        String free200Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_200FR.html";

                        final free200Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await free200Scrap.loadWebPage('$free200Url')) {
                          List<Map<String, dynamic>> elements = free200Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              free200YTime = elements[6]['title'];
                              free200MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              free200YTime = elements[6]['title'];
                              free200MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              free200YTime = 'N/A';
                              free200MTime = elements[11]['title'];
                            } else {
                              free200YTime = 'N/A';
                              free200MTime = 'N/A';
                            }
                          });
                        }

                        String free400Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_400500FR.html";
                        final free400Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await free400Scrap.loadWebPage('$free400Url')) {
                          List<Map<String, dynamic>> elements = free400Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              free500YTime = elements[6]['title'];
                              free400MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              free500YTime = elements[6]['title'];
                              free400MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              free500YTime = 'N/A';
                              free400MTime = elements[11]['title'];
                            } else {
                              free500YTime = 'N/A';
                              free400MTime = 'N/A';
                            }
                          });
                        }

                        String free800Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_8001000FR.html";
                        final free800Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await free800Scrap.loadWebPage('$free800Url')) {
                          List<Map<String, dynamic>> elements = free800Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              free1000YTime = elements[6]['title'];
                              free800MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              free1000YTime = elements[6]['title'];
                              free800MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              free1000YTime = 'N/A';
                              free800MTime = elements[11]['title'];
                            } else {
                              free1000YTime = 'N/A';
                              free800MTime = 'N/A';
                            }
                          });
                        }

                        String free1500Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_15001650FR.html";
                        final free1500Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await free1500Scrap.loadWebPage('$free1500Url')) {
                          List<Map<String, dynamic>> elements = free1500Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              free1650YTime = elements[6]['title'];
                              free1500MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              free1650YTime = elements[6]['title'];
                              free1500MTime = 'N/A';
                            } else if (elements[7]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              free1650YTime = 'N/A';
                              free1500MTime = elements[11]['title'];
                            } else {
                              free1650YTime = 'N/A';
                              free1500MTime = 'N/A';
                            }
                          });
                        }

                        String back100Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_100BK.html";
                        final back100Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await back100Scrap.loadWebPage('$back100Url')) {
                          List<Map<String, dynamic>> elements = back100Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              back100YTime = elements[6]['title'];
                              back100MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              back100YTime = elements[6]['title'];
                              back100MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              back100YTime = 'N/A';
                              back100MTime = elements[11]['title'];
                            } else {
                              back100YTime = 'N/A';
                              back100MTime = 'N/A';
                            }
                          });
                        }

                        String back200Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_200BK.html";
                        final back200Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await back200Scrap.loadWebPage('$back200Url')) {
                          List<Map<String, dynamic>> elements = back200Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              back200YTime = elements[6]['title'];
                              back200MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              back200YTime = elements[6]['title'];
                              back200MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              back200YTime = 'N/A';
                              back200MTime = elements[11]['title'];
                            } else {
                              back200YTime = 'N/A';
                              back200MTime = 'N/A';
                            }
                          });
                        }

                        String brst100Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_100BR.html";
                        final brst100Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await brst100Scrap.loadWebPage('$brst100Url')) {
                          List<Map<String, dynamic>> elements = brst100Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              brst100YTime = elements[6]['title'];
                              brst100MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              brst100YTime = elements[6]['title'];
                              brst100MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              brst100YTime = 'N/A';
                              brst100MTime = elements[11]['title'];
                            } else {
                              brst100YTime = 'N/A';
                              brst100MTime = 'N/A';
                            }
                          });
                        }

                        String brst200Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_200BR.html";
                        final brst200Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await brst200Scrap.loadWebPage('$brst200Url')) {
                          List<Map<String, dynamic>> elements = brst200Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              brst200YTime = elements[6]['title'];
                              brst200MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              brst200YTime = elements[6]['title'];
                              brst200MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              brst200YTime = 'N/A';
                              brst200MTime = elements[11]['title'];
                            } else {
                              brst200YTime = 'N/A';
                              brst200MTime = 'N/A';
                            }
                          });
                        }

                        String fly100Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_100FL.html";
                        final fly100Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await fly100Scrap.loadWebPage('$fly100Url')) {
                          List<Map<String, dynamic>> elements = fly100Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              fly100YTime = elements[6]['title'];
                              fly100MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              fly100YTime = elements[6]['title'];
                              fly100MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              fly100YTime = 'N/A';
                              fly100MTime = elements[11]['title'];
                            } else {
                              fly100YTime = 'N/A';
                              fly100MTime = 'N/A';
                            }
                          });
                        }

                        String fly200Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_200FL.html";
                        final fly200Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await fly200Scrap.loadWebPage('$fly200Url')) {
                          List<Map<String, dynamic>> elements = fly200Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              fly200YTime = elements[6]['title'];
                              fly200MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              fly200YTime = elements[6]['title'];
                              fly200MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              fly200YTime = 'N/A';
                              fly200MTime = elements[11]['title'];
                            } else {
                              fly200YTime = 'N/A';
                              fly200MTime = 'N/A';
                            }
                          });
                        }

                        String im200Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_200IM.html";
                        final im200Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await im200Scrap.loadWebPage('$im200Url')) {
                          List<Map<String, dynamic>> elements = im200Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              im200YTime = elements[6]['title'];
                              im200MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              im200YTime = elements[6]['title'];
                              im200MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              im200YTime = 'N/A';
                              im200MTime = elements[11]['title'];
                            } else {
                              im200YTime = 'N/A';
                              im200MTime = 'N/A';
                            }
                          });
                        }

                        String im400Url = "/" +
                            _currentRegion +
                            "/strokes/strokes_" +
                            currentLSCidentifier +
                            "/" +
                            swimmerIdentifier +
                            "_400IM.html";
                        final im400Scrap =
                            WebScraper('https://swimmingrank.com');
                        if (await im400Scrap.loadWebPage('$im400Url')) {
                          List<Map<String, dynamic>> elements = im400Scrap
                              .getElement(
                                  'body > div > table > tbody > tr > td',
                                  ['title']);
                          setState(() {
                            if (elements[6]['title'].contains('.') == true &&
                                elements[11]['title'].contains('.') == true) {
                              im400YTime = elements[6]['title'];
                              im400MTime = elements[11]['title'];
                            } else if (elements[6]['title'].contains('.') ==
                                    true &&
                                elements[11]['title'].contains('.') == false) {
                              im400YTime = elements[6]['title'];
                              im400MTime = 'N/A';
                            } else if (elements[6]['title'].contains('.') ==
                                    false &&
                                elements[11]['title'].contains('.') == true) {
                              im400YTime = 'N/A';
                              im400MTime = elements[11]['title'];
                            } else {
                              im400YTime = 'N/A';
                              im400MTime = 'N/A';
                            }
                          });
                        }
                        print(free1000YTime);
                        final swimmer = Swimmer(
                            firstName: '$_firstName',
                            lastName: '$_lastName',
                            identifier: '$swimmerIdentifier',
                            swimmerintAge: swimmerintAge,
                            swimmerClub: '$swimmerClub',
                            swimmerGender: '$swimmerGender',
                            swimmerLastMeet: '$swimmerLastMeet',
                            swimmerLastMeetDate: '$swimmerLastMeetDate',
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
                            fullUrl: '$fullUrl',
                            currentRegion: '$_currentRegion',
                            currentLSCidentifier: '$currentLSCidentifier');
                        await SwimmerDatabase.instance.create(swimmer);
                        Navigator.pop(context);
                        print('Pressed!');
                      } catch (e) {
                        print('Invalid!');
                        print(e);
                        errorDialog(context);
                      }
                    }

                    Navigator.pop(context);
                  }
                }),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Form(
              key: _formkey,
              child: ListView(
                children: [
                  Text('Identifier',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                  SizedBox(height: 10),
                  _buildIdentifier(),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(Icons.info),
                      SizedBox(width: 10),
                      Flexible(
                          child: Text(
                              'Share your identifier by clicking the three dot menu on the swimmer\'s card.')),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Region',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                  SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.fromLTRB(14, 6, 10, 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: _currentRegion,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: [
                          DropdownMenuItem(
                            child: Text('Alabama - Florida - Tennessee'),
                            value: 'aft',
                          ),
                          DropdownMenuItem(
                            child: Text('Alaska'),
                            value: 'ak',
                          ),
                          DropdownMenuItem(
                            child: Text('Arizona'),
                            value: 'az',
                          ),
                          DropdownMenuItem(
                            child: Text('California - Nevada'),
                            value: 'cal',
                          ),
                          DropdownMenuItem(
                            child:
                                Text('Colorado - New Mexico - Utah - Wyoming'),
                            value: 'cnw',
                          ),
                          DropdownMenuItem(
                            child: Text('Connecticut - Maine - New England'),
                            value: 'ne',
                          ),
                          DropdownMenuItem(
                            child: Text('D.C. - Maryland - Virginia'),
                            value: 'mdva',
                          ),
                          DropdownMenuItem(
                            child: Text('Delaware- New Jersey - Pennsylvania'),
                            value: 'dnp',
                          ),
                          DropdownMenuItem(
                            child: Text(
                                'Georgia - North Carolina - South Carolina'),
                            value: 'nc',
                          ),
                          DropdownMenuItem(
                            child: Text('Hawaii'),
                            value: 'hi',
                          ),
                          DropdownMenuItem(
                            child:
                                Text('Idaho - Montana - Oregon - Washington'),
                            value: 'imow',
                          ),
                          DropdownMenuItem(
                            child: Text('Illinois - Iowa'),
                            value: 'ii',
                          ),
                          DropdownMenuItem(
                            child: Text('Indiana'),
                            value: 'in',
                          ),
                          DropdownMenuItem(
                            child: Text('Kentucky - West Virginia'),
                            value: 'kywv',
                          ),
                          DropdownMenuItem(
                            child: Text('Lake Erie - Michigan - Ohio'),
                            value: 'leoh',
                          ),
                          DropdownMenuItem(
                            child: Text('Lousiana - Mississippi'),
                            value: 'lams',
                          ),
                          DropdownMenuItem(
                            child: Text(
                                'Minnesota - North Dakota - South Dakota - Wisconsin'),
                            value: 'mmw',
                          ),
                          DropdownMenuItem(
                            child: Text('New York'),
                            value: 'ny',
                          ),
                          DropdownMenuItem(
                            child: Text('Texas'),
                            value: 'tx',
                          ),
                          DropdownMenuItem(
                            child: Text(
                                'Arkansas - Kansas - Missouri - Nebraska - Oklahoma'),
                            value: 'kmno',
                          ),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            _currentRegion = newValue!;

                            if (_currentRegion == 'aft') {
                              setState(() {
                                lsc = [
                                  'Florida',
                                  'Florida Gold Coast',
                                  'Southeastern'
                                ];
                                _currentLSC = 'Florida';
                              });
                            }
                            if (_currentRegion == 'ak') {
                              setState(() {
                                lsc = ['Alaska', 'None'];
                                _currentLSC = 'Alaska';
                              });
                            }
                            if (_currentRegion == 'az') {
                              setState(() {
                                lsc = ['Arizona', 'None'];
                                _currentLSC = 'Arizona';
                              });
                            }
                            if (_currentRegion == 'cal') {
                              setState(() {
                                lsc = [
                                  'Southern California',
                                  'Pacific',
                                  'San Diego - Imperial',
                                  'Central',
                                  'Sierra Nevada'
                                ];
                                _currentLSC = 'Southern California';
                              });
                            }
                            if (_currentRegion == 'cnw') {
                              setState(() {
                                lsc = [
                                  'Colorado',
                                  'New Mexico',
                                  'Utah',
                                  'Wyoming'
                                ];
                                _currentLSC = 'Colorado';
                              });
                            }
                            if (_currentRegion == 'ne') {
                              setState(() {
                                lsc = ['Connecticut', 'Maine', 'New England'];
                                _currentLSC = 'Connecticut';
                              });
                            }
                            if (_currentRegion == 'mdva') {
                              setState(() {
                                lsc = [
                                  'Maryland',
                                  'Potomac Valley',
                                  'Virginia'
                                ];
                                _currentLSC = 'Maryland';
                              });
                            }
                            if (_currentRegion == 'dnp') {
                              setState(() {
                                lsc = [
                                  'Allegheny Mountain',
                                  'Mid Atlantic',
                                  'New Jersey'
                                ];
                                _currentLSC = 'Allegheny Mountain';
                              });
                            }
                            if (_currentRegion == 'nc') {
                              setState(() {
                                lsc = [
                                  'Georgia',
                                  'North Carolina',
                                  'South Carolina'
                                ];
                                _currentLSC = 'Georgia';
                              });
                            }
                            if (_currentRegion == 'hi') {
                              setState(() {
                                lsc = ['Hawaii', 'None'];
                                _currentLSC = 'Hawaii';
                              });
                            }
                            if (_currentRegion == 'imow') {
                              setState(() {
                                lsc = [
                                  'Inland Empire',
                                  'Montana',
                                  'Oregon',
                                  'Pacific Northwest',
                                  'Snake River'
                                ];
                                _currentLSC = 'Inland Empire';
                              });
                            }
                            if (_currentRegion == 'ii') {
                              setState(() {
                                lsc = ['Illinois', 'Iowa'];
                                _currentLSC = 'Illinois';
                              });
                            }
                            if (_currentRegion == 'in') {
                              setState(() {
                                lsc = ['Indiana', 'None'];
                                _currentLSC = 'Indiana';
                              });
                            }
                            if (_currentRegion == 'kywv') {
                              setState(() {
                                lsc = ['Kentucky', 'West Virginia'];
                                _currentLSC = 'Kentucky';
                              });
                            }
                            if (_currentRegion == 'leoh') {
                              setState(() {
                                lsc = ['Lake Erie', 'Michigan', 'Ohio'];
                                _currentLSC = 'Lake Erie';
                              });
                            }
                            if (_currentRegion == 'lams') {
                              setState(() {
                                lsc = ['Louisiana', 'Mississippi'];
                                _currentLSC = 'Louisiana';
                              });
                            }
                            if (_currentRegion == 'mmw') {
                              setState(() {
                                lsc = [
                                  'Minnesota',
                                  'North Dakota',
                                  'South Dakota',
                                  'Wisconsin'
                                ];
                                _currentLSC = 'Minnesota';
                              });
                            }
                            if (_currentRegion == 'ny') {
                              setState(() {
                                lsc = ['Adirondack', 'Metropolitan', 'Niagara'];
                                _currentLSC = 'Adirondack';
                              });
                            }
                            if (_currentRegion == 'tx') {
                              setState(() {
                                lsc = [
                                  'Border',
                                  'Gulf',
                                  'North Texas',
                                  'South Texas',
                                  'West Texas'
                                ];
                                _currentLSC = 'Border';
                              });
                            }
                            if (_currentRegion == 'kmno') {
                              setState(() {
                                lsc = [
                                  'Arkansas',
                                  'Missouri Valley',
                                  'Oklahoma',
                                  'Midwestern',
                                  'Ozark'
                                ];
                                _currentLSC = 'Arkansas';
                              });
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  // sizedBox just to add more space
                  SizedBox(height: 20),
                  Text('Local Swim Committee',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),

                  SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.fromLTRB(14, 6, 10, 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: _currentLSC,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: lsc.map((String lsc) {
                          return DropdownMenuItem(value: lsc, child: Text(lsc));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _currentLSC = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.info, color: Colors.blueAccent),
                        onPressed: () {
                          Navigator.pushNamed(context, '/privacypolicy');
                        },
                      ),
                      SizedBox(width: 10),
                      Flexible(
                          child: Text(
                              'SwimStats never stores any of your data. Click the icon to read our privacy policy.')),
                    ],
                  ),
                ],
              ),
            );
          }),
        ));
  }
}
