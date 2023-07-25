import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_screen/bottom_sheet/bottom_sheet.dart';
import 'package:to_do_app/screens/home_screen/tabs/list_tabs/list_tab.dart';
import 'package:to_do_app/screens/home_screen/tabs/settings/setting_tab.dart';
import 'package:to_do_app/screens/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routname = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        toolbarHeight: MediaQuery.of(context).size.height * .1,
      ),
      body: currentTab == 0 ? ListTab() : SettingTab(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sohwAddBottomSheet();
        },
        child: Icon(Icons.add, color: AppColors.white),
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.hardEdge, //

        child: BottomNavigationBar(
          onTap: (index) {
            currentTab = index;
            setState(() {});
          },
          currentIndex: currentTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lisat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'settings'),
          ],
        ),
      ),
    );
  }

  void sohwAddBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) => AddBottomSheet(),
    );
  }
}
