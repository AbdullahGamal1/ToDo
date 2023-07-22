import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/home_screen/tabs/list_tabs/todo_wodget.dart';
import 'package:to_do_app/model/todo_dm.dart';
import 'package:to_do_app/provider/list_provider.dart';

class ListTab extends StatefulWidget {
  // static const routeNmae = 'ListTab';

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  @override
  Widget build(BuildContext context) {
    ListProvider provider = Provider.of(context);
    if (provider.todosList.isEmpty) {
      provider.refreshTodosFromFireStore();
    }
    return ListView.builder(
      itemCount: provider.todosList.length,
      itemBuilder: (context, index) {
        return ToDo(todo: provider.todosList[index]);
      },
    );
  }
}
