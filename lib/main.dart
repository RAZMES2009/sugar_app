import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sugar_app/ui/screens/home_screen.dart';

import './helper/json_helper.dart';
import './ui/screens/about_app_screen.dart';
import './ui/screens/user_allowance_screen.dart';
import './ui/screens/registration_screen.dart';
import 'providers/user_data_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserData(),
        ),
      ],
      child: const SugarApp(),
    ),
  );
}

class SugarApp extends StatelessWidget {
  const SugarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(242, 182, 160, 1),
          secondary: const Color.fromRGBO(41, 115, 80, 1),
        ),
        appBarTheme: const AppBarTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromRGBO(41, 115, 80, 1),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
      routes: {
        '/': (ctx) {
          return FutureBuilder(
              future: JsonHelper.storage.ready,
              builder: (ctx, snapshot) {
                if (snapshot.data == null) {
                  return const CircularProgressIndicator();
                }
                final userData = Provider.of<UserData>(context, listen: false).fetchData();
                if (userData == null) {
                  return const AboutAppScreen();
                }
                return const HomeScreen();
              });
        },
        RegistrationScreen.routeName: (ctx) => const RegistrationScreen(),
        UserAllowanceScreen.routeName: (ctx) => const UserAllowanceScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
      },
    );
  }
}
