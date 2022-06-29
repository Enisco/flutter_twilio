// import 'package:flutter/material.dart';
// import 'package:twilio_flutter/twilio_flutter.dart';

// TextEditingController messageController = TextEditingController();
// TextEditingController receipientPhoneController = TextEditingController();

// class SendSMSscreen extends StatefulWidget {
//   const SendSMSscreen({super.key});

//   @override
//   State<SendSMSscreen> createState() => _SendSMSscreenState();
// }

// class _SendSMSscreenState extends State<SendSMSscreen> {
//   late TwilioFlutter twilioFlutter;
//   @override
//   void initState() {
//     twilioFlutter = TwilioFlutter(
//       accountSid: "ACa04a1cf087c83f08afc6577b475144f6",
//       authToken: "40b8213df917bb608bd7c86da5362162",
//       twilioNumber: "+18573715906",
//       // twilioNumber: "TWILIO",
//     );
//     super.initState();
//   }

//   void sendSms() async {
//     twilioFlutter.sendSMS(
//       toNumber: receipientPhoneController.text,
//       messageBody: messageController.text,
//     );
//   }

//   void getSms() async {
//     var data = await twilioFlutter.getSmsList();
//     print(data);
//     await twilioFlutter.getSMS('***************************');
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Twilio SMS App',
//         ),
//       ),
//       body: Container(
//         width: size.width,
//         height: size.height,
//         padding: EdgeInsets.all(size.width / 14),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: messageController,
//               style: const TextStyle(
//                   color: Colors.black, fontWeight: FontWeight.w500),
//               decoration: const InputDecoration(
//                 labelText: 'Message',
//                 hintText: 'Enter your message here',
//               ),
//             ),
//             SizedBox(
//               height: size.height / 20,
//             ),
//             TextField(
//               controller: receipientPhoneController,
//               style: const TextStyle(
//                   color: Colors.black, fontWeight: FontWeight.w500),
//               decoration: const InputDecoration(
//                 labelText: '+2349012345678',
//                 hintText: 'Enter Receipient\'s Phone Nummber here',
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: sendSms,
//         elevation: 5,
//         child: const Icon(
//           Icons.send,
//           // size: 14,
//         ),
//       ),
//     );
//   }
// }
