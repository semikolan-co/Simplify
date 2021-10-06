import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/ind_todo_provider.dart';

class ToDoWidget extends StatefulWidget {
  final String index;
  final Map data;
  final String keys;
  ToDoWidget(this.index, this.data, this.keys);

  @override
  State<ToDoWidget> createState() => _ToDoWidgetState(this.index);
}

class _ToDoWidgetState extends State<ToDoWidget> {
  DatabaseReference ref = FirebaseDatabase.instance.reference();

  final String index;

  _ToDoWidgetState(this.index);
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<IndToDoProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 3,
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        index,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      widget.data['title'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(
                      flex: 10,
                    ),
                    Text(
                      widget.data['startdatetime'].toString().substring(0, 10),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
               Divider(thickness: 1,color: Colors.blue,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    widget.data['description'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Spacer(
                        //flex: 2,
                        ),
                    IconButton(
                      onPressed: () {
                        prov.removeData(widget.keys);
                        // ref
                        //     .child('users')
                        //     .child('snjd86e46')
                        //     .child('todo')
                        //     .child(widget.keys)
                        //     .remove();
                      },
                      icon: Icon(
                        Icons.delete_forever_outlined,
                        size: 20,
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
