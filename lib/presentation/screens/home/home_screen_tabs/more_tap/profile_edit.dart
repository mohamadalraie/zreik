import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/profile.dart';

class ProfileEdit extends StatelessWidget {
  TextEditingController firstNameCo = TextEditingController();

  TextEditingController secoundNameCo = TextEditingController();

  TextEditingController lastNameco = TextEditingController();

  TextEditingController cardNumberCo = TextEditingController();

  TextEditingController phoneNumberCo = TextEditingController();

  TextEditingController emailCo = TextEditingController();

  final String firstName;
  final String secoundName;
  final String lastName;
  final String cardNumber;
  final String phoneNumber;
  final String email;

   ProfileEdit(
      {super.key,
      required this.firstName,
      required this.secoundName,
      required this.lastName,
      required this.phoneNumber,
      required this.cardNumber,
      required this.email});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 90),
            const Padding(
              padding:  EdgeInsets.only(left: 270),
              child:  Text(
                ":الإسم الأول",
                style: TextStyle(
                    fontSize: 12, fontFamily: "cairo", color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Container(
                width: myScreenWidth * 0.95,
                decoration: BoxDecoration(
                  color: MyColors.myYellow,
                  borderRadius: BorderRadius.circular(33),
                ),
                child: TextFormField(
                  controller: firstNameCo,
                  style: TextStyle(

                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: firstName,
                    hintStyle: TextStyle(color: Colors.black12, fontSize: 20, fontFamily: "Cairo",),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding:  EdgeInsets.only(left: 270),
              child:  Text(
                ":الإسم الثاني",
                style: TextStyle(
                    fontSize: 12, fontFamily: "cairo", color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Container(
                width: myScreenWidth * 0.95,
                decoration: BoxDecoration(
                  color: MyColors.myYellow,
                  borderRadius: BorderRadius.circular(33),
                ),
                child: TextFormField(
                  controller: secoundNameCo,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: secoundName,
                    hintStyle: TextStyle(color: Colors.black12, fontSize: 20, fontFamily: "Cairo",),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding:  EdgeInsets.only(left: 270),
              child:  Text(
                ":إسم العائلة",
                style: TextStyle(
                    fontSize: 12, fontFamily: "cairo", color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Container(
                width: myScreenWidth * 0.95,
                decoration: BoxDecoration(
                  color: MyColors.myYellow,
                  borderRadius: BorderRadius.circular(33),
                ),
                child: TextFormField(
                  controller: lastNameco,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: lastName,
                    hintStyle: TextStyle(color: Colors.black12, fontSize: 20, fontFamily: "Cairo",),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding:  EdgeInsets.only(left: 270),
              child:  Text(
                ":الرقم الوطني",
                style: TextStyle(
                    fontSize: 12, fontFamily: "cairo", color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Container(
                width: myScreenWidth * 0.95,
                decoration: BoxDecoration(
                  color: MyColors.myYellow,
                  borderRadius: BorderRadius.circular(33),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: cardNumberCo,
                  style: TextStyle(

                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: cardNumber,
                    hintStyle: TextStyle(color: Colors.black12, fontSize: 20, fontFamily: "Cairo",),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding:  EdgeInsets.only(left: 270),
              child:  Text(
                ":رقم الموبايل",
                style: TextStyle(
                    fontSize: 12, fontFamily: "cairo", color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Container(
                width: myScreenWidth * 0.95,
                decoration: BoxDecoration(
                  color: MyColors.myYellow,
                  borderRadius: BorderRadius.circular(33),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phoneNumberCo,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: phoneNumber,
                    hintStyle: TextStyle(color: Colors.black12, fontSize: 20, fontFamily: "Cairo",),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding:  EdgeInsets.only(left: 290),
              child:  Text(
                ":الإيميل",
                style: TextStyle(
                    fontSize: 12, fontFamily: "cairo", color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Container(
                width: myScreenWidth * 0.95,
                decoration: BoxDecoration(
                  color: MyColors.myYellow,
                  borderRadius: BorderRadius.circular(33),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCo,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: email,
                    hintStyle: TextStyle(color: Colors.black12, fontSize: 20, fontFamily: "Cairo",),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  Profile()));
                },
                child: Container(
                  child: Center(
                      child: Text(
                        "حفظ التعديل",
                        style: TextStyle(fontFamily: "cairo", fontSize: 20),
                      )),
                  height: 50,
                  width: myScreenWidth * 0.5,
                  decoration: BoxDecoration(
                    color: MyColors.myYellow,
                    borderRadius: BorderRadius.circular(33),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
