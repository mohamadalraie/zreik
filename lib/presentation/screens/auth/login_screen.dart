import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/constants/validate_funcs.dart';

import '../../../data/apis/login_api.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.myBlack,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [MyColors.myBlack, Color(0xff222222)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Image(
                height: 300,
                image: AssetImage("assets/images/big logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 12.0, left: 12.0, right: 12.0, top: 12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xaaffffff)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
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
                          validator: emailValidator,
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
                            validator: passwordValidator),
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
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    bool isLogged = await LoginAPI().login(
                                        emailController.text,
                                        passwordController.text);
                                    if (isLogged) {
                                      Navigator.of(context)
                                          .pushReplacementNamed(homePage);
                                    }
                                  }
                                },
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "تسجيل الدخول",
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
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(homePage);
                    },
                    child: const Text("تخطي",
                        style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 14,
                          color: MyColors.myYellow,
                          decorationColor: MyColors.myYellow,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(registerScreen);
                    },
                    child: const Text("أتريد إنشاء حساب؟",
                        style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 14,
                          color: MyColors.myYellow,
                          decorationColor: MyColors.myYellow,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
