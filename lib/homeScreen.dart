import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo_widget.dart';

import 'package:google_sign_in/google_sign_in.dart';




class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo'),
      ),
      body: ListView.builder(
          itemCount: 20, itemBuilder: (ctx, index) => ToDoWidget()),

      //floatingActionButton: FloatingActionButton(onPressed: (){},),
      drawer: Drawer(),
    );
  }
}
