import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/todo_dm.dart';
import 'package:to_do_app/provider/list_provider.dart';
import 'package:to_do_app/screens/theme/app_colors.dart';

class ToDo extends StatelessWidget {
  ToDoDM todo;

  ToDo({required this.todo});

  @override
  Widget build(BuildContext context) {
    ListProvider provider = Provider.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
      // padding: EdgeInsets.symmetric(horizontal: 18, vertical: 25),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: SwipeActionCell(
        key: ObjectKey(todo),
        leadingActions: [
          SwipeAction(
              onTap: (handler) {
                var todosCollection =
                    FirebaseFirestore.instance.collection("todos");
                var doc = todosCollection.doc(todo.id);
                doc.delete().timeout(
                  Duration(milliseconds: 500),
                  onTimeout: () {
                    provider.refreshTodosFromFireStore();
                  },
                );
              },
              backgroundRadius: 25,
              content: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, color: Colors.white, size: 40),
                    Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ))
        ],
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 25),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              buildVirticalLine(),
              SizedBox(width: 8),
              buildMiddleColumn(context),
              Spacer(),
              buildIconState()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVirticalLine() {
    return Container(
      height: 60,
      width: 4,
      // todo?.isDone == true ? AppColors.green :
      color: AppColors.primaryColor,
    );
  }

  Widget buildMiddleColumn(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            todo.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            todo.description,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }

  Widget buildIconState() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Image.asset('assets/images/Group 10.png'));
  }
}
