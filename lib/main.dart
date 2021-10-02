//https://picsum.photos/200/300   //  ⌘ ñ 
//use lint
//import '../widget/detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/homeScreen.dart';
void main() {
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
       systemNavigationBarColor: Colors.transparent,
    
  ));
runApp(MyApp());
}
   
class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
  
   @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'homepage',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}
