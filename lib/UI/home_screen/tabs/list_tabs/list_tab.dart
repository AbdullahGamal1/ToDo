import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/UI/home_screen/tabs/list_tabs/todo_wodget.dart';
import 'package:to_do_app/model/todo_dm.dart';

class ListTab extends StatefulWidget {
  // static const routeNmae = 'ListTab';

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  List<ToDoDM> todosList = [];

  @override
  Widget build(BuildContext context) {
    if (todosList.isEmpty) refreshTodosFromFireStore();
    return ListView.builder(
      itemCount: todosList.length,
      itemBuilder: (context, index) {
        return ToDo(todo: todosList[index]);
      },
    );
  }

  refreshTodosFromFireStore() {
    var todosCollection = FirebaseFirestore.instance.collection("todos");
    // .then : wait datafrom firestore
    todosCollection.get().then((querySnapShot) {
      todosList = querySnapShot.docs.map((documentSnapShot) {
        var json = documentSnapShot.data();
        return ToDoDM(
            id: json["id"],
            title: json["title"],
            description: json["description"],
            isDone: json["isDone"],
            date: DateTime.fromMicrosecondsSinceEpoch(json["datetime"]));
      }).toList();
      setState(() {});
    });
  }
}
