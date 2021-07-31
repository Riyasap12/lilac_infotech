import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:lilac_infotech/pages/otp_page.dart';



// ignore: must_be_immutable
class Otp extends StatelessWidget {
  var num1;
  Otp(this.num1);
  final sms = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Form(
                child: TextFormField(
                  controller: sms,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
                child: Text('Smss'),
                onPressed: () async {FirebaseAuth auth = FirebaseAuth.instance;
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: num1,
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) async {
// Update the UI - wait for the user to enter the SMS code
                    String smsCode = "123456";

// Create a PhoneAuthCredential with the code
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

// Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);

                    if (smsCode=="123456"){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => OtpPage(num1))
                      );
                    }
                    else{
                      print('faileddddd');
                      }
                  },

                  codeAutoRetrievalTimeout: (String verificationId) {},
                );


                })
          ],
        ),
      ),
    );
  }
}



/*FirebaseAuth auth = FirebaseAuth.instance;
await FirebaseAuth.instance.verifyPhoneNumber(
phoneNumber: '9876543210',
verificationCompleted: (PhoneAuthCredential credential) {},
verificationFailed: (FirebaseAuthException e) {},
codeSent: (String verificationId, int? resendToken) async {
// Update the UI - wait for the user to enter the SMS code
String smsCode = 'xxxx';

// Create a PhoneAuthCredential with the code
PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

// Sign the user in (or link) with the credential
await auth.signInWithCredential(credential);
},

codeAutoRetrievalTimeout: (String verificationId) {},
);*/
