import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:zreiq/data/apis/notification_api.dart';

import '../../../../../constants/my_colors.dart';
import '../../../../../data/models/notification.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<OldNotification> oldN = [];
  late UnReadNotification unReadN = UnReadNotification();
  bool loading = true;

  Future<void> getN() async {
    oldN = await OldNotificationApi().oldNotificationApi();
    unReadN = await UnReadNotificationApi().unReadNotificationApi();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getN();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: MyColors.myYellow,
              title: const Text(
                "التذكيرات",
                style: TextStyle(
                  fontFamily: "cairo",
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'التذكيرات الغير مقروءة:',
                    style: TextStyle(
                        fontFamily: "cairo",
                        fontSize: 14,
                        color: MyColors.myLightGrey),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, i) => unRead(unReadN.data![i]),
                    itemCount: unReadN.data!.length,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'التذكيرات السابقة',
                    style: TextStyle(
                        fontFamily: "cairo",
                        fontSize: 14,
                        color: MyColors.myLightGrey),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, i) => old(oldN[i].data![0]),
                    itemCount: oldN.length,
                  ),
                ],
              ),
            ),
          );
  }

  Widget old(String old) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.myLightGrey),
            borderRadius: BorderRadius.circular(6)),
        child: ListTile(
          title: Text(
            old,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget unRead(Data unRead) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.myYellow),
            borderRadius: BorderRadius.circular(6)),
        child: ListTile(
          title: Text(
            unRead.notification!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
