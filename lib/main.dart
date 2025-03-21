import 'package:flutter/material.dart';

import 'Features/Pages/Home_Page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//             toolbarHeight: 100,
//             automaticallyImplyLeading: true,
//             backgroundColor: Colors.green,
//             titleTextStyle: const TextStyle(fontSize: 30,color: Colors.black),
//             title: const Text(
//               "Your Library",
//             ),
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: InkWell(
//                     onTap: () {},
//                     child: const Icon(
//                       Icons.person,color: Colors.black,size: 35,
//                     ),),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: InkWell(
//                     onTap: () {},
//                     child: const Icon(
//                       Icons.search,color: Colors.black,size: 35,
//                     )),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: InkWell(
//                     onTap: () {},
//                     child: const Icon(
//                       Icons.add,color: Colors.black,size: 35,
//                     )),
//               ),
//             ]),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 40,
//                   child: Row(
//                     children: [
//                       Column(children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0,top: 10.0,right: 5),
//                           child: InkWell(
//                               onTap: () {},
//                               child: const Icon(
//                                 Icons.article_outlined,color: Colors.white,size: 20,
//                               )
//                           ),
//                         ),
//
//                       ]),
//                       const Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding:
//                                   EdgeInsets.only(top: 8.0, ),
//                               child: Text(
//                                 'Recents',
//                                 style: TextStyle(
//                                     fontSize: 22, color: Colors.white),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 17, right: 17, top: 0),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                backgroundImage: AssetImage("assets/images/Screenshot 2023-07-27 195038.png"),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 10.0),
//                             child: Text(
//                               '❤️Liked Songs',
//                               style:
//                                   TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.orange,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '🙏Devotional Songs🙏',
//                               style:
//                                   TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.red,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '👽MC STAN',
//                               style:
//                                   TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.purple,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '🔥VIJAY DK',
//                               style:
//                                   TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '🤙LIL BABY',
//                               style:
//                                   TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '😎LIL WYNE',
//                               style:
//                                   TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.grey,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '👽🔥MC STAN MIX',
//                               style:
//                                   TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.grey,
//                               ),
//                             ),
//
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               'THIS IS MC STAN👽',
//                               style:
//                                   TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       ),
//
//                     ],
//
//                   ),
//
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.red,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '👽MC STAN',
//                               style:
//                               TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.red,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '👽MC STAN',
//                               style:
//                               TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.red,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '👽MC STAN',
//                               style:
//                               TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.red,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '👽MC STAN',
//                               style:
//                               TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.red,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '👽MC STAN',
//                               style:
//                               TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.red,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '👽MC STAN',
//                               style:
//                               TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.red,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '👽MC STAN',
//                               style:
//                               TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: InkWell(
//                               onTap: () {},
//                               child: const CircleAvatar(
//                                 maxRadius: 27,
//                                 backgroundColor: Colors.red,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Text(
//                               '👽MC STAN',
//                               style:
//                               TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//         ),
//       ),
//     );
//   }
// }
