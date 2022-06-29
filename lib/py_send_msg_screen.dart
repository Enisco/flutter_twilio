// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

TextEditingController messageController = TextEditingController();
TextEditingController receipientPhoneController = TextEditingController();

class TwilioSendSMSscreen extends StatefulWidget {
  const TwilioSendSMSscreen({super.key});

  @override
  State<TwilioSendSMSscreen> createState() => _TwilioSendSMSscreenState();
}

class _TwilioSendSMSscreenState extends State<TwilioSendSMSscreen> {
  var responseString = 'Send a message, SID appears here';

  void twilioSendSMS() async {
    try {
      // var response = await Dio()
      //     .get('https://twilio-flask-api.herokuapp.com/');
      var response = await Dio()
          .get('https://twilio-flask-api.herokuapp.com/smsp/${receipientPhoneController.text}~${messageController.text}');
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
          'Twilio SMS',
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
                  child: Center(
                    child: Text(
                      responseString.toString(),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                TextField(
                  controller: messageController,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    labelText: 'Message',
                    hintText: 'Enter your message here',
                  ),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: receipientPhoneController,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    labelText: '+2349012345678',
                    hintText: 'Enter Receipient\'s Phone Number here',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          print("Awaiting data");
          twilioSendSMS();
        }),
        elevation: 5,
        child: const Icon(
          Icons.send,
        ),
      ),
    );
  }
}
