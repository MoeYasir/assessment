import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    TextEditingController countryCode = TextEditingController();
    countryCode.text = "+249";
    var phone = '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              phone = value;
            },
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            child: Container(
              width: 200,
              height: 150,
              color: Colors.green,
              child: Text('Click me!'),
            ),
            onTap: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: '${countryCode.text + phone}',
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException e) {},
                codeSent: (String verificationId, int? resendToken) {},
                codeAutoRetrievalTimeout: (String verificationId) {},
              );
            },
          )
        ],
      ),
    );
  }

  void signInWithPhoneNumber(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            print(verificationId);
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) =>
          //               OtpScreen(verificationId: verificationId)));
          // },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
    }
  }
}
