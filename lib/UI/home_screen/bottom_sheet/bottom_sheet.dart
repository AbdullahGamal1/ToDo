import 'package:flutter/material.dart';

class AddBottomSheet extends StatefulWidget {
  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                  labelText: 'Enter your task',
                  labelStyle: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                labelText: 'Enter yourtask description'),
          ),
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
          ElevatedButton(onPressed: () {}, child: Text("Add"))
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
}
