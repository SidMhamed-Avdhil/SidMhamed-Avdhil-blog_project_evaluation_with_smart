import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_evaluation/UI/Screens/DetielsScreen.dart';
import 'package:project_evaluation/UI/Screens/HomeScreen.dart';
import 'package:project_evaluation/UI/Screens/LoginScreen.dart';
import 'package:project_evaluation/business/authentications/authentication.dart';
import 'package:project_evaluation/business/blogManager.dart';
import 'package:project_evaluation/firebase_options.dart';
import 'package:project_evaluation/myLib/app_constants.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BlogManager>(create: (_) => BlogManager()),
        ChangeNotifierProvider<Authentication>(create: (_) => Authentication()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: AppConstants.loginScreen,
      // routes: {
      //   AppConstants.loginScreen: (context) => LoginScreen(),
      //   AppConstants.homeScreen: (context) => HomeScreen(),
      // },
      home: LoginScreen(),
    );
  }
}
