import 'package:flutter/material.dart';
import 'package:to_do_app/UI/home_screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_app/UI/theme/my_theme_data.dart';
import 'firebase_options.dart';
import 'UI/register_Screen/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      initialRoute: HomeScreen.routname,
      routes: {
        HomeScreen.routname: (context) => HomeScreen(),
        RegisterScreen.routname: (context) => RegisterScreen()
      },
    );
  }
}
