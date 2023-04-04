import 'package:flutter/material.dart';
class verificationcode extends StatefulWidget {

  final String verificationId;
  const verificationcode({Key? key,required this.verificationId}) : super(key: key);

  @override
  State<verificationcode> createState() => _verificationcodeState();
}

class _verificationcodeState extends State<verificationcode> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify'),
        backgroundColor: Color(0xffa28089),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
