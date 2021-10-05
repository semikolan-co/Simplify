import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class IndToDoProvider with ChangeNotifier {
  Map _toDoList = {};
  final databaseRef = FirebaseDatabase.instance.reference();

  Map get toDoList {
    return {..._toDoList};
  }

  Future<void> fetchData() async {
    await databaseRef.once().then((DataSnapshot snapshot) {
      try {
        Map data = snapshot.value['users']
                    [FirebaseAuth.instance.currentUser!.uid]['todo'] !=
                null
            ? snapshot.value['users'][FirebaseAuth.instance.currentUser!.uid]
                ['todo']
            : {};
        print(data.length);
        _toDoList = data;
      } catch (e) {
        print(e);
        _toDoList = {};
      }
      // notifyListeners();
      // print(
          // 'Data : ${snapshot.value['users'][FirebaseAuth.instance.currentUser!.uid]['todo']}');
    });
    // notifyListeners();
  }

  Future<void> addTask(Map task) async {
    await databaseRef
        .child('users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('todo')
        .push()
        .set(task);
    notifyListeners();
    // await fetchData();
  }

  Future<void> removeData(String key) async {
    await databaseRef
        .child('users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('todo')
        .child(key)
        .remove();
    // await fetchData();
    notifyListeners();
  }
}
