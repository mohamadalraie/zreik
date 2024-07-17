import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      // backgroundColor: MyColors.myBlack,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/4.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            const Image(
              height: 250,
              image: AssetImage("assets/images/big logo.png"),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 12.0, left: 12.0, right: 12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xaaffffff)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "البريد الالكتروني او رقم الهاتف",
                        style: TextStyle(fontFamily: "cairo"),
                      ),
                      TextFormField(
                        controller: emailController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("كلمة المرور",
                          style: TextStyle(fontFamily: "cairo")),
                      TextFormField(
                        controller: passwordController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("هل نسيت كلمة المرور؟",
                            style: TextStyle(
                                fontFamily: "cairo",
                                fontSize: 12,
                                decoration: TextDecoration.underline)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(
                            child: Container(
                          decoration: BoxDecoration(
                              color: MyColors.myBlack,
                              borderRadius:
                                  BorderRadiusDirectional.circular(8)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: MaterialButton(
                              color: MyColors.myBlack,
                              onPressed: () {},
                              child: const Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        )),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text("تخطي",
                                style: TextStyle(
                                    fontFamily: "cairo",
                                    fontSize: 14,
                                    decoration: TextDecoration.underline)),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text("أتريد إنشاء حساب؟",
                                style: TextStyle(
                                    fontFamily: "cairo",
                                    fontSize: 14,
                                    decoration: TextDecoration.underline)),
                          ),
                        ],
                      )
                    ],
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
