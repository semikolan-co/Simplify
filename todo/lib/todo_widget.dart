import 'package:flutter/material.dart';

class ToDoWidget extends StatelessWidget {
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
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  // border: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.green)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  //   borderSide: BorderSide(color: Colors.amber, width: 2),
                  // ),
                  enabledBorder: InputBorder.none,
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //   borderSide: BorderSide(color: Colors.black),
                  // ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note',
                  // border: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.green)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  //   borderSide: BorderSide(color: Colors.amber, width: 2),
                  // ),
                  enabledBorder: InputBorder.none,
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //   borderSide: BorderSide(color: Colors.black),
                  // ),
                ),
                // minLines: 4,
                maxLines: 5,
                // keyboardType: TextInputType.multiline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
