import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:todo/homeScreen.dart';
import 'package:todo/login_screen.dart';
import 'package:todo/providers/ind_todo_provider.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<IndToDoProvider>(
            create: (_) => IndToDoProvider(),
          )
        ],
        child: MaterialApp(
          title: 'homepage',
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ));
  }
}
