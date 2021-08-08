import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: MaterialButton(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Privacy Policy'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('Last updated August 05, 2021',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('Summary',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'Your user data is not collected, stored, or shared with anyone.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 10),
              child: Row(
                children: [
                  Icon(Icons.fiber_manual_record, size: 10),
                  SizedBox(width: 10),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          'No personally identifiable information is collected, stored, or shared')),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 10),
              child: Row(
                children: [
                  Icon(Icons.fiber_manual_record, size: 10),
                  SizedBox(width: 10),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          'SwimStats does not share data with any third parties')),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 10),
              child: Row(
                children: [
                  Icon(Icons.fiber_manual_record, size: 10),
                  SizedBox(width: 10),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          'SwimStats does not collect anonymous usage statistics')),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'If you have any questions or concerns with regard to your personal information, please contact swimstatshelp@gmail.com.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'This privacy policy describes how we might use your information if you:',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 10),
              child: Row(
                children: [
                  Icon(Icons.fiber_manual_record, size: 10),
                  SizedBox(width: 10),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          'Download and use our mobile application - SwimStats')),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 10),
              child: Row(
                children: [
                  Icon(Icons.fiber_manual_record, size: 10),
                  SizedBox(width: 10),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          'Download and use our mobile application - SwimStats')),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'The purpose of this notice is to explain to you in the clearest way possible what information we collect, how we use it, and what rights you have in relation to it. This privacy policy will always be made accessible directly through the app, and all users will be notified any time there is a policy change. If there are any terms in this privacy policy that you do not agree with, please cease using our services immediately.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('1. What information do we collect?',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'SwimStats does not collect, store, and log any data pertaining to the user’s personal information.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 10),
              child: Row(
                children: [
                  Icon(Icons.fiber_manual_record, size: 10),
                  SizedBox(width: 10),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          'Your user data is not collected, stored, or shared with anyone')),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 10),
              child: Row(
                children: [
                  Icon(Icons.fiber_manual_record, size: 10),
                  SizedBox(width: 10),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          'No personally identifiable information is collected, stored, or shared')),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 10),
              child: Row(
                children: [
                  Icon(Icons.fiber_manual_record, size: 10),
                  SizedBox(width: 10),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          'SwimStats does not collect anonymous usage statistics')),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 10),
              child: Row(
                children: [
                  Icon(Icons.fiber_manual_record, size: 10),
                  SizedBox(width: 10),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          'All user data is stored on a local database (non-accessible through the web)')),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('2. Will your information be shared with anyone?',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'SwimStats does not share data with any third parties, including third-party business partners and other affiliates. SwimStats does not retain user data and is never maintained in remote servers.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('3. Is your information transferred internationally?',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'SwimStats does not own any servers, and thus will never transfer, store, or process your data.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'If you are a resident of the European Economic Area (EEA) or United Kingdom(UK), then these countries may not necessarily have data protection laws or other similar laws as comprehensive as those in your country. We will however take all necessary measures to  protect your personal information in accordance with this privacy notice and applicable law.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('4. How do we keep your information safe?',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'SwimStats stores all user data locally and never transfers user information to remote databases, thus safeguarding against the insecurity of electronic transmission over the Internet. Although we do our best to protect your personal information, we cannot guarantee that unauthorized third parties will not be able to improperly collect, access, steal, or modify your information.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('5. What are your privacy rights?',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'If you are a resident in the EEA or UK and you believe we are unlawfully processing your personal information, you have the right to complain to your local data protection supervisory. You can find their contact details here:  https://ec.europa.eu/justice/data-protection/bodies/authorities/index_en.htm',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'If you are a resident in Switzerland, the contact details for the data protection authorities are available here: https://www.edoeb.admin.ch/edoeb/eb/home.html',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('6. How are you being tracked?',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('SwimStats does not track user activity patterns.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'Some mobile operating systems and mobile applications include a Do-Not-Track(‘DNT’) feature or setting that you can activate to signal your privacy preference and not have your app activities monitored and collected. At this stage, we do not currently respond to DNT or other mechanisms. If a standard for online tracking is adopted that we must follow in the future, we will inform you about that practice in a revised version of this privacy notice.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  '7. Do California residents have specific privacy rights?',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'Yes. California Civil Code Section 1798.83, also known as the “Shine The Light” law, permits our users who are California residents to request and obtain from us, once a year and free of charge, information about categories of personal information (if any) we disclose to third parties. If you are a California resident and would like to make such a request, please submit your request in writing to us using the contact information provided below.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('8. Do we make updates to this notice?',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'Yes, we will update this privacy notice from time to time in order to stay compliant with relevant laws. The updated version will be indicated by the “Revised” date as soon as it is accessible. If we make changes to this privacy notice, we will prominently notify you through the app.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('9. How can you contact us about this notice?',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                  'If you have any questions or comments about this notice, please email us at swimstatshelp@gmail.com.',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
          ],
        ),
      ),
    );
  }
}
