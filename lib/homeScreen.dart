import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/login_screen.dart';
import 'package:todo/providers/ind_todo_provider.dart';
import 'package:todo/todo_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final databaseRef = FirebaseDatabase.instance.reference();
  // late Map fbdata;
  final taskcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<IndToDoProvider>(context);
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              child: Chip(
                label: Text('Log Out'),
                // shadowColor: Colors.red,
                // avatar: Icon(Icons.add),
              ),
            )
          ],
          title: Text('To Do'),
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                text: 'Your To-Do',
              ),
              Tab(
                text: 'Group To-do',
              ),
            ],
          ),
        ),
        // backgroundColor: Colors.black87,
        body: TabBarView(
          children: [
            FutureBuilder(
              future: prov.fetchData(),
              // future: databaseRef.once().then((DataSnapshot snapshot) {
              //   Map data = snapshot.value['users']['snjd86e46']['todo'];
              //   print(data.length);
              //   fbdata = data;
              //   print('Data : ${snapshot.value['users']['snjd86e46']['todo']}');
              // }),
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
                            prov.addTask({
                              'title': taskcontroller.text,
                              'description': 'whatever',
                              'startdatetime': DateTime.now().toString(),
                              'enddatetime': DateTime.thursday.toString(),
                            });
                            // databaseRef
                            //     .child('users')
                            //     .child('snjd86e46')
                            //     .child('todo')
                            //     .push()
                            //     .set({
                            //   'title': taskcontroller.text,
                            //   'description': 'whatever',
                            //   'startdatetime': DateTime.now().toString(),
                            //   'enddatetime': DateTime.thursday.toString(),
                            // });
                            taskcontroller.clear();
                            setState(() {});
                          },
                          child: Text('Submit')),
                      Expanded(
                        child: prov.toDoList.length >= 1
                            ? ListView.builder(
                                // itemCount: fbdata.length,
                                itemCount: prov.toDoList.length,
                                itemBuilder: (ctx, index) => ToDoWidget(
                                      prov.toDoList.values.toList()[index],
                                      prov.toDoList.keys.toList()[index],
                                    ))
                            : Text('No To-Do yet'),
                        // fbdata.values.toList()[index],
                        // fbdata.keys.toList()[index])),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
            ListTile(
              title: Text('Group 1'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            databaseRef
                .child('users')
                .child(FirebaseAuth.instance.currentUser!.uid)
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
      ),
    );
  }
}
