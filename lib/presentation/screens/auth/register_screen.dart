import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/my_colors.dart';
import '../../../constants/strings.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/4.jpg"), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xaaffffff)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(right: 4, bottom: 2),
                      child: const Text(
                        "الإسم الأول",
                        style: TextStyle(fontFamily: "cairo"),
                      ),
                    ),
                    TextFormField(
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
                      padding: EdgeInsets.only(right: 4, bottom: 2),
                      child: Text("الإسم الثاني",
                          style: TextStyle(fontFamily: "cairo")),
                    ),
                    TextFormField(
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
                      padding: EdgeInsets.only(right: 4, bottom: 2),
                      child: Text(
                        "إسم العائلة",
                        style: TextStyle(fontFamily: "cairo"),
                      ),
                    ),
                    TextFormField(
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
                      padding: EdgeInsets.only(right: 4, bottom: 2),
                      child: Text(
                        "الإيميل",
                        style: TextStyle(fontFamily: "cairo"),
                      ),
                    ),
                    TextFormField(
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
                      padding: EdgeInsets.only(right: 4, bottom: 2),
                      child: Text(
                        "رقم الموبايل",
                        style: TextStyle(fontFamily: "cairo"),
                      ),
                    ),
                    TextFormField(
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
                      padding: EdgeInsets.only(right: 4, bottom: 2),
                      child: Text(
                        "الرقم الوطني",
                        style: TextStyle(fontFamily: "cairo"),
                      ),
                    ),
                    TextFormField(
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
                      padding: EdgeInsets.only(right: 4, bottom: 2),
                      child: Text(
                        "كلمة المرور",
                        style: TextStyle(fontFamily: "cairo"),
                      ),
                    ),
                    TextFormField(
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
                      padding: EdgeInsets.only(right: 4, bottom: 2),
                      child: Text(
                        "تأكيد كلمة المرور",
                        style: TextStyle(fontFamily: "cairo"),
                      ),
                    ),
                    TextFormField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Center(
                          child: Container(
                        decoration: BoxDecoration(
                            color: MyColors.myBlack,
                            borderRadius:
                                BorderRadiusDirectional.circular(8)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(
                            color: MyColors.myBlack,
                            onPressed: () {
                              Navigator.of(context).pushNamed(homePage);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
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
