import 'package:flutter/material.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({Key? key}) : super(key: key);

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
            title: Text('How to Use'),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Card(
                child: ListTile(
                    title: Column(
                      children: [
                        Text(
                            'Add a swimmer by clicking the menu button. Fill out your information.'),
                        SizedBox(height: 10),
                        Image(
                          image: AssetImage('./assets/tutorial1.png'),
                        ),
                        SizedBox(height: 10),
                        Image(
                          image: AssetImage('./assets/tutorial2.png'),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                    leading: Icon(Icons.looks_one)),
              ),
              Card(
                child: ListTile(
                    title: Column(
                      children: [
                        Text(
                            'Click the newly added card to access swimmer information.'),
                      ],
                    ),
                    leading: Icon(Icons.looks_two)),
              ),
              Card(
                child: ListTile(
                    title: Column(
                      children: [
                        Text(
                            'Swipe down on swimmer list to refresh information.'),
                        SizedBox(height: 10),
                        Image(
                          image: AssetImage('./assets/tutorial3.png'),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                    leading: Icon(Icons.notifications)),
              ),
              Card(
                child: ListTile(
                    title: Column(
                      children: [
                        Text(
                            'Long press on the swimmer card to remove swimmer.'),
                        SizedBox(height: 10),
                        Image(
                          image: AssetImage('./assets/tutorial4.png'),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                    leading: Icon(Icons.notifications)),
              ),
            ],
          )),
    );
  }
}
