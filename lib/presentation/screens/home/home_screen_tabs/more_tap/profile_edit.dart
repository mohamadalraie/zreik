import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/presentation/screens/auth/login_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/profile.dart';
import 'package:zreiq/presentation/widgets/toast.dart';

import '../../../../../data/apis/update_profile.dart';
import '../../../../../data/models/register_model.dart';
import '../../../../../data/models/update_profile.dart';

class ProfileEdit extends StatefulWidget {
  final String? firstName;
  final String? secoundName;
  final String? lastName;
  final String? cardNumber;
  final String? phoneNumber;
  final String? email;
  final String? birthdate;

  ProfileEdit(
      {Key? key,
      this.firstName,
      this.secoundName,
      this.lastName,
      this.phoneNumber,
      this.cardNumber,
      this.email,
      this.birthdate})
      : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  late TextEditingController firstNameCo;
  late TextEditingController secoundNameCo;
  late TextEditingController lastNameco;
  late TextEditingController cardNumberCo;
  late TextEditingController phoneNumberCo;
  late TextEditingController emailco;
  late TextEditingController birthdateco;

  @override
  void initState() {
    super.initState();
    firstNameCo = TextEditingController(text: widget.firstName ?? "");
    secoundNameCo = TextEditingController(text: widget.secoundName ?? "");
    lastNameco = TextEditingController(text: widget.lastName ?? "");
    cardNumberCo = TextEditingController(text: widget.cardNumber ?? "");
    phoneNumberCo = TextEditingController(text: widget.phoneNumber ?? "");
    emailco = TextEditingController(text: widget.email ?? "");
    birthdateco = TextEditingController(text: widget.birthdate ?? "");
  }

  @override
  void dispose() {
    firstNameCo.dispose();
    secoundNameCo.dispose();
    lastNameco.dispose();
    cardNumberCo.dispose();
    phoneNumberCo.dispose();
    emailco.dispose();
    birthdateco.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 90),
            const Padding(
              padding: EdgeInsets.only(left: 270),
              child: Text(
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
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 270),
              child: Text(
                ":الإسم الثاني",
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
                  controller: secoundNameCo,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'أدخل الإسم الثاني',
                    hintStyle: const TextStyle(
                      color: Colors.black12,
                      fontSize: 20,
                      fontFamily: "Cairo",
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 270),
              child: Text(
                ":إسم العائلة",
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
                  controller: lastNameco,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'أدخل إسم العائلة',
                    hintStyle: const TextStyle(
                      color: Colors.black12,
                      fontSize: 20,
                      fontFamily: "Cairo",
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 270),
              child: Text(
                ":الرقم الوطني",
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
                  keyboardType: TextInputType.number,
                  controller: cardNumberCo,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'أدخل الرقم الوطني',
                    hintStyle: const TextStyle(
                      color: Colors.black12,
                      fontSize: 20,
                      fontFamily: "Cairo",
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 270),
              child: Text(
                ":رقم الموبايل",
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
                  keyboardType: TextInputType.number,
                  controller: phoneNumberCo,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'أدخل رقم الموبايل',
                    hintStyle: const TextStyle(
                      color: Colors.black12,
                      fontSize: 20,
                      fontFamily: "Cairo",
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: InkWell(
                onTap: () async {
                  UpdateProfileModel updateProfileModel = UpdateProfileModel(
                    data: Data(
                        fname: firstNameCo.text,
                        mname: secoundNameCo.text,
                        lname: lastNameco.text,
                        phoneNumber: phoneNumberCo.text,
                        nationalNumber: int.tryParse(cardNumberCo.text),
                        email: emailco.text,
                        birthday: birthdateco.text),
                  );
                  bool success = await UpdateProfileApi()
                      .updateProfileApi(updateProfileModel);

                  if (success) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                    print("hiiiiiiiiiiiiiii");
                  } else {
                    flutterToast(msg: "nothing");
                  }
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
            ),
            const SizedBox(height: 12),
            const Text(
              "عندما تقوم بالضغط على زر حفظ التعديل",
              style: TextStyle(
                  fontSize: 12, fontFamily: "cairo", color: Colors.white),
            ),
            const SizedBox(height: 2),
           const Text(
              "سيتطلب منك اعادة تسجيل الدخول",
              style: TextStyle(
                  fontSize: 12, fontFamily: "cairo", color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
