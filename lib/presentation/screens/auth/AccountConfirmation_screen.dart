import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';
import '../../../constants/strings.dart';

class AccountConfirmationScreen extends StatelessWidget {
  AccountConfirmationScreen({super.key});

  TextEditingController confirmNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: myScreenWidth,
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
              Padding(
                padding: const EdgeInsets.only(top: 260),
                child: Container(
                  width: 380,
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xaaffffff)),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: Text(
                          ": أدخل رمز التأكيد ",
                          style: TextStyle(
                              color: MyColors.myYellow,
                              fontSize: 20,
                              fontFamily: "cairo"),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: confirmNumberController,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MaterialButton(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: MyColors.myBlack),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "تحقق",
                                    style: TextStyle(
                                      color: MyColors.myYellow,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: MyColors.myYellow,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(homePage);
                          }),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
