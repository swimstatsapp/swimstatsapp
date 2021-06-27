import 'package:flutter/material.dart';

class CreateUrl extends StatefulWidget {
  const CreateUrl({Key? key}) : super(key: key);

  @override
  _CreateUrlState createState() => _CreateUrlState();
}

class _CreateUrlState extends State<CreateUrl> {

  Map swimmerData = {};

  @override
  Widget build(BuildContext context) {

    swimmerData = ModalRoute.of(context)!.settings.arguments as Map;

    String firstName = swimmerData['firstName'];
    String lastName = swimmerData['lastName'];
    String currentRegion = swimmerData['currentRegion'];
    String currentLSC = swimmerData['currentLSC'];
    String currentLSCidentifier = '';
    int birthdayMonth = int.parse(swimmerData['birthdayMonth']);
    int birthdayDay = int.parse(swimmerData['birthdayDay']);
    String birthdayYear = swimmerData['birthdayYear'];
    int birthdayYearFirst = int.parse(birthdayYear.substring(2,3));
    int birthdayYearSecond = int.parse(birthdayYear.substring(3,4));

    //creating usable LSC output
    if(currentLSC == 'Florida') {
      currentLSCidentifier = 'fl';
    }
    if(currentLSC == 'Florida Gold Coast') {
      currentLSCidentifier = 'fg';
    }
    if(currentLSC == 'Southeastern') {
      currentLSCidentifier = 'se';
    }
    if(currentLSC == 'Alaska') {
      currentLSCidentifier = 'ak';
    }
    if(currentLSC == 'Arizona') {
      currentLSCidentifier = 'az';
    }
    if(currentLSC == 'Southern California') {
      currentLSCidentifier = 'scs';
    }
    if(currentLSC == 'Pacific') {
      currentLSCidentifier = 'pc';
    }
    if(currentLSC == 'San Diego - Imperial') {
      currentLSCidentifier = 'si';
    }
    if(currentLSC == 'Central') {
      currentLSCidentifier = 'cc';
    }
    if(currentLSC == 'Sierra Nevada') {
      currentLSCidentifier = 'sn';
    }
    if(currentLSC == 'Colorado') {
      currentLSCidentifier = 'co';
    }
    if(currentLSC == 'New Mexico') {
      currentLSCidentifier = 'nm';
    }
    if(currentLSC == 'Utah') {
      currentLSCidentifier = 'ut';
    }
    if(currentLSC == 'Wyoming') {
      currentLSCidentifier = 'wy';
    }
    if(currentLSC == 'Connecticut') {
      currentLSCidentifier = 'ct';
    }
    if(currentLSC == 'Maine') {
      currentLSCidentifier = 'me';
    }
    if(currentLSC == 'New England') {
      currentLSCidentifier = 'ne';
    }
    if(currentLSC == 'Maryland') {
      currentLSCidentifier = 'md';
    }
    if(currentLSC == 'Potomac Valley') {
      currentLSCidentifier = 'pv';
    }
    if(currentLSC == 'Virginia') {
      currentLSCidentifier = 'va';
    }
    if(currentLSC == 'Allegheny Mountain') {
      currentLSCidentifier = 'am';
    }
    if(currentLSC == 'Mid Atlantic') {
      currentLSCidentifier = 'ma';
    }
    if(currentLSC == 'New Jersey') {
      currentLSCidentifier = 'nj';
    }
    if(currentLSC == 'Georgia') {
      currentLSCidentifier = 'ga';
    }
    if(currentLSC == 'North Carolina') {
      currentLSCidentifier = 'nc';
    }
    if(currentLSC == 'South Carolina') {
      currentLSCidentifier = 'fl';
    }
    if(currentLSC == 'Hawaii') {
      currentLSCidentifier = 'hi';
    }
    if(currentLSC == 'Inland Empire') {
      currentLSCidentifier = 'ie';
    }
    if(currentLSC == 'Montana') {
      currentLSCidentifier = 'mt';
    }
    if(currentLSC == 'Oregon') {
      currentLSCidentifier = 'or';
    }
    if(currentLSC == 'Pacific Northwest') {
      currentLSCidentifier = 'pn';
    }
    if(currentLSC == 'Snake River') {
      currentLSCidentifier = 'sr';
    }
    if(currentLSC == 'Illinois') {
      currentLSCidentifier = 'il';
    }
    if(currentLSC == 'Iowa') {
      currentLSCidentifier = 'ia';
    }
    if(currentLSC == 'Indiana') {
      currentLSCidentifier = 'in';
    }
    if(currentLSC == 'Kentucky') {
      currentLSCidentifier = 'ky';
    }
    if(currentLSC == 'West Virginia') {
      currentLSCidentifier = 'wv';
    }
    if(currentLSC == 'Lake Erie') {
      currentLSCidentifier = 'fl';
    }
    if(currentLSC == 'Michigan') {
      currentLSCidentifier = 'mi';
    }
    if(currentLSC == 'Ohio') {
      currentLSCidentifier = 'oh';
    }
    if(currentLSC == 'Louisiana') {
      currentLSCidentifier = 'la';
    }
    if(currentLSC == 'Mississippi') {
      currentLSCidentifier = 'ms';
    }
    if(currentLSC == 'Minnesota') {
      currentLSCidentifier = 'mn';
    }
    if(currentLSC == 'North Dakota') {
      currentLSCidentifier = 'nd';
    }
    if(currentLSC == 'South Dakota') {
      currentLSCidentifier = 'sd';
    }
    if(currentLSC == 'Wisconsin') {
      currentLSCidentifier = 'wi';
    }
    if(currentLSC == 'Adirondack') {
      currentLSCidentifier = 'ad';
    }
    if(currentLSC == 'Metropolitan') {
      currentLSCidentifier = 'mr';
    }
    if(currentLSC == 'Niagara') {
      currentLSCidentifier = 'ni';
    }
    if(currentLSC == 'Border') {
      currentLSCidentifier = 'bd';
    }
    if(currentLSC == 'Gulf') {
      currentLSCidentifier = 'gu';
    }
    if(currentLSC == 'North Texas') {
      currentLSCidentifier = 'nt';
    }
    if(currentLSC == 'South Texas') {
      currentLSCidentifier = 'st';
    }
    if(currentLSC == 'West Texas') {
      currentLSCidentifier = 'wt';
    }
    if(currentLSC == 'Arkansas') {
      currentLSCidentifier = 'ar';
    }
    if(currentLSC == 'Missouri Valley') {
      currentLSCidentifier = 'mv';
    }
    if(currentLSC == 'Oklahoma') {
      currentLSCidentifier = 'ok';
    }
    if(currentLSC == 'Midwestern') {
      currentLSCidentifier = 'mw';
    }
    if(currentLSC == 'Ozark') {
      currentLSCidentifier = 'oz';
    }

    //using index of array to correspond to value
    List letter = ['A','B','C','D','E','F','G','H','I','J','K','L','M','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5'];

    String firstLetter = firstName.substring(0,1).toUpperCase();
    print(firstLetter);

    String secondLetter = letter[birthdayMonth];
    print(secondLetter);

    String thirdLetter = firstName.substring(1,2).toUpperCase();
    print(thirdLetter);

    String fourthLetter = letter[birthdayDay];
    print(fourthLetter);

    String fifthLetter = firstName.substring(2,3).toUpperCase();
    print(fifthLetter);

    String sixthLetter = letter[birthdayYearFirst];
    print(sixthLetter);

    String seventhLetter = lastName.substring(0,1).toUpperCase();
    print(seventhLetter);

    String eigthLetter = letter[birthdayYearSecond];
    print(eigthLetter);

    String ninthLetter = lastName.substring(1,2).toUpperCase();
    print(ninthLetter);

    String swimmerIdentifier = firstLetter + secondLetter + thirdLetter + fourthLetter + fifthLetter + sixthLetter + seventhLetter + eigthLetter + ninthLetter;

    String fullUrl = "https://www.swimmingrank.com/" + currentRegion + "/strokes/strokes_"+ currentLSCidentifier + "/" + swimmerIdentifier + "_meets.html";
    print(fullUrl);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Swimmer URL'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Text(fullUrl),
          ],
        )
      ),
    );
  }
}
