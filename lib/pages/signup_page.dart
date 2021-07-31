import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lilac_infotech/pages/video_player.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  CollectionReference users =
      FirebaseFirestore.instance.collection('User details');

  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(border: Border(), color: Colors.white),
              child: Form(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Mobile Number',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 13),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Text(
                              "(+91)",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (_val) {
                          if (_val!.isEmpty) {
                            return "Can't be Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'User Name',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 13),
                      child: TextFormField(
                        controller: _nameController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (_val) {
                          if (_val!.isEmpty) {
                            return "Can't be Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 13),
                      child: TextFormField(
                        controller: _emailController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (_val) {
                          if (_val!.isEmpty) {
                            return "Can't be Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 13),
                      child: TextFormField(
                        controller: _passController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (_val) {
                          if (_val!.isEmpty) {
                            return "Can't be Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      height: 65,
                      padding: EdgeInsets.only(top: 22),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'SignUp',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                          ),
                          onPressed: () {
                            var numb = _phoneController.text.toString().trim();
                            var name = _nameController.text.toString().trim();
                            var email = _emailController.text.toString().trim();
                            var pass = _passController.text.toString().trim();

                            if (numb.isNotEmpty ||
                                name.isNotEmpty ||
                                email.isNotEmpty ||
                                pass.isNotEmpty) {
                              users.doc().set({
                                'Number': '$numb',
                                'Name': '$name',
                                'Email': '$email',
                                'Password': '$pass'
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoPage()));
                            }
                          }),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*Future<bool> loginuser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential credential)async{
          var result = await _auth.signInWithCredential(credential);
          User? user= result.user;
          if(user!= null){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()))
          }
        },
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }*/

class ImagePicker extends StatefulWidget {
  const ImagePicker({Key? key}) : super(key: key);

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  late File image;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
