import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/home_screen/home_screen.dart';
import 'package:to_do_app/screens/login/login.dart';
import 'package:to_do_app/screens/theme/my_theme_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'provider/list_provider.dart';
import 'screens/register_Screen/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context) => ListProvider(), child: MyApp()));
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
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routname: (context) => HomeScreen(),
        RegisterScreen.routname: (context) => RegisterScreen()
      },
    );
  }
}
