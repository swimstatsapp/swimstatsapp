// import 'package:flutter/material.dart';

// class CreateUrl extends StatefulWidget {
//   const CreateUrl({Key? key}) : super(key: key);

//   @override
//   _CreateUrlState createState() => _CreateUrlState();
// }

// class _CreateUrlState extends State<CreateUrl> {
//   Map swimmerData = {};

//   @override
//   Widget build(BuildContext context) {
//     swimmerData = ModalRoute.of(context)!.settings.arguments as Map;

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Confirm Information'),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(30),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     'Name: ',
//                     style: TextStyle(
//                       color: Colors.blueAccent,
//                       fontSize: 20,
//                     ),
//                   ),
//                   Text('$firstName $lastName'),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text('Current LSC: ',
//                       style: TextStyle(
//                         color: Colors.blueAccent,
//                         fontSize: 20,
//                       )),
//                   Text('$_currentLSC'),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text('Birthday: ',
//                       style: TextStyle(
//                         color: Colors.blueAccent,
//                         fontSize: 20,
//                       )),
//                   Text('$birthdayMonth / $birthdayDay / $birthdayYear'),
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                   child: Text('Submit'),
//                   onPressed: () {
//                     Navigator.of(context).pushNamedAndRemoveUntil(
//                         '/newhome', (Route<dynamic> route) => false,
//                         arguments: {
//                           'fullUrl': fullUrl,
//                           'firstName': firstName,
//                           'lastName': lastName,
//                         });
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
