import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zreiq/constants/validate_funcs.dart';
import 'package:zreiq/data/models/register_model.dart';
import '../../../constants/my_colors.dart';
import '../../../constants/strings.dart';
import '../../../data/apis/auth/register_api.dart';
import '../../widgets/time_picker.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController fatherNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController idNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  String birthDate = DateTime(2000).toString().split(" ")[0];

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          "إنشاء الحساب:",
                          style: TextStyle(
                              color: MyColors.myYellow,
                              fontSize: 20,
                              fontFamily: "cairo"),
                        ),
                      ),
                    ],
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
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                right: 4, bottom: 2),
                                            child: Text(
                                              "الاسم الأول",
                                              style: TextStyle(
                                                  fontFamily: "cairo"),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: firstNameController,
                                            textDirection: TextDirection.rtl,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            )),
                                            validator: emptyValidator,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                right: 4, bottom: 2),
                                            child: Text(
                                              "اسم الأب",
                                              style: TextStyle(
                                                  fontFamily: "cairo"),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: fatherNameController,
                                            textDirection: TextDirection.rtl,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            )),
                                            validator: emptyValidator,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 4, bottom: 2),
                                  child: Text(
                                    "اسم العائلة",
                                    style: TextStyle(fontFamily: "cairo"),
                                  ),
                                ),
                                TextFormField(
                                  controller: lastNameController,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                                  validator: emptyValidator,
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
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                                  validator: emailValidator,
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
                                  controller: phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                                  validator: emptyValidator,
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
                                  controller: idNumberController,
                                  keyboardType: TextInputType.number,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                                  validator: emptyValidator,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 4, bottom: 2),
                                  child: Text(
                                    "تاريخ الميلاد",
                                    style: TextStyle(fontFamily: "cairo"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: InkWell(
                                    onTap: () async {
                                      // TODO change to bloc
                                      var d = await selectDate(
                                          context: context,
                                          inital: DateTime(2000),
                                          first: DateTime(1930),
                                          last: DateTime(
                                              DateTime.now().year - 18));

                                      birthDate = d.toString().split(" ")[0];
                                      setState(() {});
                                    },
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        height: myScreenHeight * 0.05,
                                        decoration: BoxDecoration(
                                          color: MyColors.myGrey,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 14.0),
                                          child: Text(
                                            birthDate,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: MyColors.myYellow,
                                                fontSize: 16,
                                                fontFamily: "cairo"),
                                          ),
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 4, bottom: 2),
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
                                  validator: passwordValidator,
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
                                  controller: confirmPasswordController,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                                  validator: passwordValidator,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: Container(
                    decoration: BoxDecoration(
                        color: MyColors.myBlack,
                        borderRadius: BorderRadiusDirectional.circular(8)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MaterialButton(
                        color: MyColors.myBlack,
                        onPressed: () async {
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            Fluttertoast.showToast(
                                msg: "the passwords doesn't match",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else if (formKey.currentState!.validate()) {
                            RegisterModel registerData = RegisterModel(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                fatherName: fatherNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                birthDate: birthDate,
                                nationalNumber: idNumberController.text,
                                phoneNumber: phoneNumberController.text,
                                address: "damascus-altal");

                            bool registered =
                                await RegisterApi().register(registerData);
                            if (registered) {
                              Navigator.of(context)
                                  .pushReplacementNamed(homePage);
                            }
                          }
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
