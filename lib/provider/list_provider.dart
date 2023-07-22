import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/todo_dm.dart';

class ListProvider extends ChangeNotifier {
  List<ToDoDM> todosList = [];
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
      notifyListeners();
    });
  }
}
