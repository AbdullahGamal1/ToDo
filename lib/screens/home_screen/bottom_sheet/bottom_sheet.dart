import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/list_provider.dart';

class AddBottomSheet extends StatefulWidget {
  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late ListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12),
          Text('Add New Task',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 12),
          Container(
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                  labelText: 'Enter your task',
                  labelStyle: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
          SizedBox(height: 12),
          TextField(
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  labelText: 'Enter your task description'),
              controller: descriptionController),
          SizedBox(height: 12),
          Text(
            textAlign: TextAlign.start,
            'Select Time',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              showMyDatePicker();
            },
            child: Text(
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          ElevatedButton(
              onPressed: () {
                onAddPressed();
              },
              child: Text("Add"))
        ],
      ),
    );
  }

  void showMyDatePicker() async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }

  void onAddPressed() {
    CollectionReference todos = FirebaseFirestore.instance.collection('todos');
    DocumentReference doc = todos.doc();
    doc.set({
      "id": doc.id,
      "title": titleController.text,
      "description": descriptionController.text,
      "isDone": false,
      "datetime": selectedDate.millisecondsSinceEpoch
    }).timeout(Duration(milliseconds: 500), onTimeout: () {
      provider.refreshTodosFromFireStore();

      Navigator.pop(context);
    });
  }
}
