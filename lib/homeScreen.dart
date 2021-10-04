import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final databaseRef = FirebaseDatabase.instance.reference();

  late Map fbdata;

  final taskcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ToDo'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            databaseRef
                .child('users')
                .child('snjd86e46')
                .child('todo')
                .push()
                .set({
              'title': 'test',
              'description': 'whatever',
              'startdatetime': DateTime.now().toString(),
              'enddatetime': DateTime.thursday.toString(),
            });
            taskcontroller.clear();
          },
          child: Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: databaseRef.once().then((DataSnapshot snapshot) {
            Map data = snapshot.value['users']['snjd86e46']['todo'];
            print(data.length);
            fbdata = data;
            print('Data : ${snapshot.value['users']['snjd86e46']['todo']}');
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Add a new task',
                        ),
                        onChanged: (value) {
                          print(value);
                        },
                        controller: taskcontroller),
                  ),
                  TextButton(
                      onPressed: () {
                        databaseRef
                            .child('users')
                            .child('snjd86e46')
                            .child('todo')
                            .push()
                            .set({
                          'title': taskcontroller.text,
                          'description': 'whatever',
                          'startdatetime': DateTime.now().toString(),
                          'enddatetime': DateTime.thursday.toString(),
                        });
                        taskcontroller.clear();
                        setState(() {});
                      },
                      child: Text('Submit')),
                  Expanded(
                    child: ListView.builder(
                        itemCount: fbdata.length,
                        itemBuilder: (ctx, index) => ToDoWidget(
                            fbdata.values.toList()[index],
                            fbdata.keys.toList()[index])),
                  )
                ],
              );
            }
            return Container();
          },
        ));
  }
}
