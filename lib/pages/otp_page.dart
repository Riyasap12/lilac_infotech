
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OtpPage extends StatelessWidget {

var user;
OtpPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("You are Logged in succesfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            SizedBox(height: 16,),
            Text("$user", style: TextStyle(color: Colors.grey, ),),
          ],
        ),
      ),
    );
  }
}