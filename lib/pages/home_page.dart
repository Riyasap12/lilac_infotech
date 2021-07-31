import 'package:lilac_infotech/pages/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lilac_infotech/pages/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final db = FirebaseFirestore.instance;
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ClipRect(child: Image.asset('lib/image/ui2.jpg')),
            ),
            Positioned(
              top: 150,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Welcome \nBack',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
            ),
            Positioned(
              top: 350,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(80), right: Radius.circular(80)),
                  color: Colors.white,
                ),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(13),
                        child: Text(
                          'SignIn',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Text(
                                  "(+91)",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
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
                            }),
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
                                'SignIn',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ),
                            onPressed: () {
                              var number =
                                  _phoneController.text.toString().trim();
                              if (number.isNotEmpty) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoPage()));
                              }
                            }),
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        alignment: Alignment.center,
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)),
                        height: 46,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ),
                            onPressed: () {
                              print('$num');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            }),
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
