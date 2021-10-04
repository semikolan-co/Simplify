import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ToDoWidget extends StatefulWidget {
  final Map data;
  final String keys;
  ToDoWidget(this.data, this.keys);

  @override
  State<ToDoWidget> createState() => _ToDoWidgetState();
}

class _ToDoWidgetState extends State<ToDoWidget> {
  DatabaseReference ref = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.data['title'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.data['description'],
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: () {
                  ref
                      .child('users')
                      .child('snjd86e46')
                      .child('todo')
                      .child(widget.keys)
                      .remove();
                  setState(() {});
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
