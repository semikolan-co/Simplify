import 'package:awesome_dialog/awesome_dialog.dart';
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
  final disccontroller = TextEditingController();

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
                      Expanded(
                        child: prov.toDoList.length >= 1
                            ? ListView.builder(
                                // itemCount: fbdata.length,
                                itemCount: prov.toDoList.length,
                                itemBuilder: (ctx, index) => ToDoWidget(
                                      (index + 1).toString(),
                                      prov.toDoList.values.toList()[index],
                                      prov.toDoList.keys.toList()[index],
                                    ))
                            : Text('No To-Do yet'),
                        // fbdata.values.toList()[index],
                        // fbdata.keys.toList()[index])),
                      ),
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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     databaseRef
        //         .child('users')
        //         .child(FirebaseAuth.instance.currentUser!.uid)
        //         .child('todo')
        //         .push()
        //         .set({
        //       'title': 'test',
        //       'description': 'whatever',
        //       'startdatetime': DateTime.now().toString(),
        //       'enddatetime': DateTime.thursday.toString(),
        //     });
        //     taskcontroller.clear();
        //   },
        //   child: Icon(Icons.add),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                // isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'title',
                              ),
                              // maxLines: 5,
                              onChanged: (value) {
                                print(value);
                              },
                              controller: taskcontroller),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'discription',
                              ),
                              maxLines: 3,
                              // keyboardAppearance: ,
                              // keyboardType: ,
                              textInputAction: TextInputAction.done,
                              onChanged: (value) {
                                print(value);
                              },
                              controller: disccontroller),
                        ),
                        Row(
                          children: [
                            // DateTimePickerDialog(initialDate: initialDate, firstDate: firstDate, lastDate: lastDate)
                            Spacer(
                              flex: 6,
                            ),
                            TextButton(
                                onPressed: () {
                                  DatePickerDialog(
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.monthsPerYear));
                                },
                                child: Text('start-date')),
                            Spacer(
                              flex: 1,
                            ),
                            TextButton(
                                onPressed: () {
                                  DatePickerDialog(
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.monthsPerYear));
                                },
                                child: Text('end-date')),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              AwesomeDialog(
                                context: context, showCloseIcon: true,
                                dialogType: DialogType.INFO_REVERSED,
                                animType:
                                    AnimType.TOPSLIDE, //awesome_dialog: ^2.1.1
                                title: 'Are you sure want to add ?',
                                // desc: 'Dialog description here.............',
                                // btnCancelOnPress: () {},
                                btnOkText: 'ok',

                                btnCancelText: 'cancel',
                                btnOkColor: Theme.of(context).primaryColor,
                                btnOkOnPress: () {
                                  prov.addTask({
                                    'title': taskcontroller.text,
                                    'description': disccontroller.text,
                                    'startdatetime': DateTime.now().toString(),
                                    'enddatetime': DateTime.thursday.toString(),
                                  });

                                  taskcontroller.clear();
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                              ).show();
                            },
                            child: Container(
                                color: Colors.blue,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ))),
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
