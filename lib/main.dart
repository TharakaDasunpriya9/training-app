import 'package:training_app/ui/HomePage/home_page.dart';
import 'package:training_app/ui/HomePage/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(MyApp());
/////////////////////////////////////////////
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home:MyApp(),));
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
// //////////////////////////////////////////////
//
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePageProvider()
    );
  }
}

////////////////////////////////
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(HomePageProvider());
// }
