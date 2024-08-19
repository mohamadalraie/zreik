import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/constants/strings.dart';

import '../../constants/shared_preferences.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController baseUrlController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.myYellow,
      body: Column(
        children: [
          Stack(children: [
            Container(
              width: myScreenWidth,
              height: myScreenHeight / 2,
              decoration: const BoxDecoration(
                color: MyColors.myBlack,
                borderRadius: BorderRadiusDirectional.vertical(
                    bottom: Radius.circular(80)),
              ),
            ),
            const Image(image: AssetImage("assets/images/big logo.png")),
          ]),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              textAlign: TextAlign.left,
              "للنقل والتسويق السياحي",
              style: TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          TextFormField(
            controller: baseUrlController,
            decoration: const InputDecoration(hintText: 'baseUrl'),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              textAlign: TextAlign.left,
              "تطبيق لإدارة حجوزاتك الإلكترونية",
              style: TextStyle(
                color: Color(0xff303030),
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
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
                        "إبدأ",
                        style: TextStyle(
                          color: MyColors.myYellow,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
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
              onPressed: () async {
                await Prefs.setFirstTime(true);
                if (!baseUrlController.text.isEmpty) {
                  await Prefs.setBaseUrl(baseUrlController.text);
                  baseUrl = await Prefs.getBaseUrl()!;
                }
                Navigator.of(context).pushReplacementNamed(
                    (Prefs.getToken() == null || Prefs.getToken() == '')
                        ? (Prefs.getFirstTime() == true
                            ? loginScreen
                            : onBoardScreen)
                        : homePage);
              }),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
