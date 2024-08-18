import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.amber,
          onPressed: () async {
            FirebaseMessaging _firebaseMessaging =
                FirebaseMessaging.instance; // Change here
            _firebaseMessaging.getToken().then((token) {
              print("token is $token");
            });
          },
        ),
      ),
    );
  }
}
