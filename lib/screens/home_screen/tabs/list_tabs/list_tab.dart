import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/list_provider.dart';
import 'package:to_do_app/screens/home_screen/tabs/list_tabs/todo_wodget.dart';
import 'package:to_do_app/screens/theme/app_colors.dart';

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
    return Container(
      child: Column(
        children: [
          Container(
            color: AppColors.white,
            child: CalendarTimeline(
              initialDate: provider.selectedDate,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) {
                provider.selectedDate = date;
                provider.refreshTodosFromFireStore();
              },
              leftMargin: 20,
              showYears: true,
              monthColor: Colors.black,
              dayColor: Colors.black,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: AppColors.primaryColor,
              dotsColor: Colors.transparent,
              locale: 'en_ISO',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.todosList.length,
              itemBuilder: (context, index) {
                return ToDo(todo: provider.todosList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
