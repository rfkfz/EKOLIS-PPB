// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:ekolis/reusableWidgets/reuseableWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../loginScreen.dart';

class settingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.cyan,
        elevation: 10,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/logoEkolis.png',
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            settingsSub(context, "Account"),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            accountSub(context, "Privacy and Security"),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 400,
            ),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    elevation: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          // ignore: prefer_const_constructors
                          builder: (context) => loginScreen(),
                        ));
                  });
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2.2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
