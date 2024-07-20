import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/my_colors.dart';
import '../../../constants/strings.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  TextEditingController firstnameController = TextEditingController();
  TextEditingController secoundnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController idnumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: myScreenHeight,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [MyColors.myBlack, Color(0xff222222)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: const EdgeInsets.only(top: 8,left: 250),
                  child: Text(
                    ": إنشاء الحساب",
                    style: TextStyle(color: MyColors.myYellow, fontSize: 20,fontFamily:"cairo" ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                  child: Center(
                    child: Container(
                      width: myScreenWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xaaffffff)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              height: myScreenHeight * 0.79,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding:  EdgeInsets.only(
                                        right: 4, bottom: 2),
                                    child: const Text(
                                      "الإسم الأول",
                                      style: TextStyle(fontFamily: "cairo"),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: firstnameController,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Padding(
                                    padding:  EdgeInsets.only(
                                        right: 4, bottom: 2),
                                    child:  Text(
                                      "الإسم الثاني",
                                      style: TextStyle(fontFamily: "cairo"),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: secoundnameController,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 4, bottom: 2),
                                    child: Text(
                                      "إسم العائلة",
                                      style: TextStyle(fontFamily: "cairo"),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: lastnameController,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 4, bottom: 2),
                                    child: Text(
                                      "الإيميل",
                                      style: TextStyle(fontFamily: "cairo"),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 4, bottom: 2),
                                    child: Text(
                                      "رقم الموبايل",
                                      style: TextStyle(fontFamily: "cairo"),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: phonenumberController,
                                    keyboardType: TextInputType.number,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 4, bottom: 2),
                                    child: Text(
                                      "الرقم الوطني",
                                      style: TextStyle(fontFamily: "cairo"),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: idnumberController,
                                    keyboardType: TextInputType.number,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 4, bottom: 2),
                                    child: Text(
                                      "كلمة المرور",
                                      style: TextStyle(fontFamily: "cairo"),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 4, bottom: 2),
                                    child: Text(
                                      "تأكيد كلمة المرور",
                                      style: TextStyle(fontFamily: "cairo"),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: confirmpasswordController,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: MyColors.myBlack,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(8)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: MaterialButton(
                                  color: MyColors.myBlack,
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(accountConfirmScreen);
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      "تسجيل الحساب",
                                      style: TextStyle(
                                          fontFamily: "cairo",
                                          color: MyColors.myYellow,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
