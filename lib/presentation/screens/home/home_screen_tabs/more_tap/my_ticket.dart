import 'package:flutter/material.dart';
import 'package:zreiq/data/apis/show_my_ticket.dart';

import '../../../../../constants/my_colors.dart';
import '../../../../../data/models/show_tickets.dart';
import '../../../../widgets/ticket.dart';

class MyTicket extends StatefulWidget {
  const MyTicket({super.key,required this.bookid});
final int? bookid;
  @override
  State<MyTicket> createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {
  ShowTicket trip1 = ShowTicket();
  bool loading = true;

  Future<void> getticket() async {
    trip1 = await ShowMyTicketApi().showMyTicketApi(bookId: widget.bookid! );
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getticket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.myBlack,
        body: loading
            ? Center(child: CircularProgressIndicator())
            : trip1.data == null || trip1.data!.isEmpty
                ? Center(
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: MyColors.myYellow),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 40, top: 10),
                        child: Text(
                          'لا يوجد لديك تذاكر على هذا الحساب    ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "cairo"),
                        ),
                      ),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: getticket,
                    child: ListView.builder(
                        itemCount: trip1.data?.length,
                        itemBuilder: (context, i) {
                          return ticket(trip: trip1.data![i], context: context);
                        }),
                  ));
  }
}
