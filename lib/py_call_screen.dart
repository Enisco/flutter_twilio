// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

TextEditingController speechTextController = TextEditingController();
TextEditingController receiverPhoneController = TextEditingController();

class TwilioMakeCallScreen extends StatefulWidget {
  const TwilioMakeCallScreen({super.key});

  @override
  State<TwilioMakeCallScreen> createState() => _TwilioMakeCallScreenState();
}

class _TwilioMakeCallScreenState extends State<TwilioMakeCallScreen> {
  var responseString = 'Make a call, SID appears here';

  void twilioMakeCall() async {
    try {
      // var response = await Dio().get('http://127.0.0.1:5000/call');
      // var response = await Dio()
      //     .get('http://127.0.0.1:5000/callp/${receiverPhoneController.text}~${speechTextController.text}');

      // var response = await Dio()
      //   .get('https://twilio-flask-api.herokuapp.com/');
      var response = await Dio().get(
          'https://twilio-flask-api.herokuapp.com/callp/${receiverPhoneController.text}~${speechTextController.text}');
      setState(() {
        responseString = response.toString();
      });
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Twilio Call',
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(size.width / 14),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(child: Text(responseString.toString())),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                TextField(
                  controller: speechTextController,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    labelText: 'What to say',
                    hintText: 'Enter your speech here',
                  ),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: receiverPhoneController,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    labelText: '+2349012345678',
                    hintText: 'Enter Receiver\'s Phone Number here',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          print("Retrieving data");
          twilioMakeCall();
        }),
        elevation: 5,
        child: const Icon(
          Icons.phone,
        ),
      ),
    );
  }
}
