import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/todo_dm.dart';

class ListProvider extends ChangeNotifier {
  List<ToDoDM> todosList = [];
  DateTime selectedDate = DateTime.now();

  refreshTodosFromFireStore() {
    var todosCollection = FirebaseFirestore.instance.collection("todos");

    todosCollection.get().then((querySnapShot) {
      todosList = querySnapShot.docs.map((documentSnapShot) {
        var json = documentSnapShot.data();
        return ToDoDM(
            id: json["id"],
            title: json["title"],
            description: json["description"],
            isDone: json["isDone"],
            date: DateTime.fromMillisecondsSinceEpoch(json["datetime"]));
      }).toList();
      todosList = todosList.where((todo) {
        if (todo.date.day == selectedDate.day &&
            todo.date.month == selectedDate.month &&
            todo.date.year == selectedDate.year) {
          return true;
        } else {
          return false;
        }
      }).toList();

      notifyListeners();
    });
  }
}

// .then : wait datafrom firestore
