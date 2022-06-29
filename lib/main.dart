import 'package:flutter/material.dart';
import 'package:flutter_twilio/constants.dart';
import 'package:flutter_twilio/py_call_screen.dart';
import 'package:flutter_twilio/py_send_msg_screen.dart';

int _selectedIndex = 0;
const List<Widget> appPages = <Widget>[
  TwilioMakeCallScreen(),
  TwilioSendSMSscreen(),
];

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        inputDecorationTheme: textFeildInputDecoration,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: appPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(
              fontSize: size.width / 25,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w800),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          iconSize: size.width / 15,
          selectedFontSize: 18,
          unselectedFontSize: 18,
          unselectedItemColor: Colors.black26,
          unselectedLabelStyle:
              TextStyle(fontSize: size.width / 25, color: Colors.black26),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                size: size.width / 12,
              ),
              label: 'Call',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                size: size.width / 12,
              ),
              label: 'SMS',
            ),
          ],
        ));
  }
}

// Hello, from Twilio in Flutter. I'm testing my Flask API app deployed on Heroku. Thank you for listening.
// +2349032242379
// +2348051039931
// 987654321
