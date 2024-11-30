import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/phone_service.dart';
import 'screens/home_screen.dart';
import 'screens/phone_list_screen.dart';
import 'screens/remove_phone_screen.dart';
import 'screens/add_phone_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhoneService()),
      ],
      child: PhoneKeeperApp(),
    ),
  );
}

class PhoneKeeperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhoneKeeper',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
      routes: {
        '/phoneList': (context) => PhoneListScreen(),
        '/addPhone': (context) => AddPhoneScreen(),
        '/removePhone': (context) => RemovePhoneScreen(),
      },
    );
  }
}
