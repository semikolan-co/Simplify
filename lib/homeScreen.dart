import 'package:flutter/material.dart';
import 'package:todo/todo_widget.dart';
////import '../widget/detailscreen.dart';
class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
    appBar: AppBar(   
      title:const Text('ToDo'),   
                  ),  
     body: 
    
         ListView.builder(
                           itemCount: 20,
                           itemBuilder: (ctx, index) =>ToDoWidget() 
                                                        ),
       
     
    //floatingActionButton: FloatingActionButton(onPressed: (){},),
    drawer: Drawer(),
      );  
    
  }
}