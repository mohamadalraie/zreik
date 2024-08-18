import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/data/models/profile_model.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/profile_edit.dart';
import '../../../../../constants/strings.dart';
import '../../../../../data/apis/show_profile_api.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileModel p1 = ProfileModel();
  bool loading = true;

  Future<void> gettrip() async {
    p1 = await ShowProfileApi().showProfileApi();

    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettrip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: 70),
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
                    child: Text(
                      p1.data?.fname.toString()??"",
                      style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 20,
                          color: MyColors.myBlack),
                    ),
                    height: 60,
                    alignment: Alignment.centerRight * 0.86,
                    width: myScreenWidth * 0.95,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.5), // لون الظل مع شفافية
                          spreadRadius: 2,
                          blurRadius: 7, // انتشار الظل
                        )
                      ],
                      color: MyColors.myYellow,
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(left: 270),
                  child: Text(
                    ":الإسم الثاني",
                    style: TextStyle(
                        fontSize: 12, fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Container(
                    child: Text(
                      p1.data?.mname.toString()??"",
                      style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 20,
                          color: MyColors.myBlack),
                    ),
                    height: 60,
                    alignment: Alignment.centerRight * 0.86,
                    width: myScreenWidth * 0.95,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.5), // لون الظل مع شفافية
                          spreadRadius: 2,
                          blurRadius: 7, // انتشار الظل
                        )
                      ],
                      color: MyColors.myYellow,
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: const EdgeInsets.only(left: 270),
                  child: const Text(
                    ":اسم العائلة",
                    style: TextStyle(
                        fontSize: 12, fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Container(
                    child: Text(
                      p1.data?.lname.toString()??"",
                      style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 20,
                          color: MyColors.myBlack),
                    ),
                    height: 60,
                    alignment: Alignment.centerRight * 0.86,
                    width: myScreenWidth * 0.95,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.5), // لون الظل مع شفافية
                          spreadRadius: 2,
                          blurRadius: 7, // انتشار الظل
                        )
                      ],
                      color: MyColors.myYellow,
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: const EdgeInsets.only(left: 270),
                  child: const Text(
                    ":الرقم الوطني",
                    style: TextStyle(
                        fontSize: 12, fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Container(
                    child: Text(
                      p1.data?.nationalNumber.toString()??"",
                      style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 20,
                          color: MyColors.myBlack),
                    ),
                    height: 60,
                    alignment: Alignment.centerRight * 0.86,
                    width: myScreenWidth * 0.95,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.5), // لون الظل مع شفافية
                          spreadRadius: 2,
                          blurRadius: 7, // انتشار الظل
                        )
                      ],
                      color: MyColors.myYellow,
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: const EdgeInsets.only(left: 270),
                  child: const Text(
                    ":رقم الموبايل",
                    style: TextStyle(
                        fontSize: 12, fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Container(
                    child: Text(
                      p1.data?.phoneNumber.toString()??"",
                      style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 20,
                          color: MyColors.myBlack),
                    ),
                    height: 60,
                    alignment: Alignment.centerRight * 0.86,
                    width: myScreenWidth * 0.95,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.5), // لون الظل مع شفافية
                          spreadRadius: 2,
                          blurRadius: 7, // انتشار الظل
                        )
                      ],
                      color: MyColors.myYellow,
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(left: 295),
                  child: Text(
                    ":الإيميل",
                    style: TextStyle(
                        fontSize: 12, fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Container(
                    child: Text(
                      p1.data!.email.toString(),
                      style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 20,
                          color: MyColors.myBlack),
                    ),
                    height: 60,
                    alignment: Alignment.centerRight * 0.86,
                    width: myScreenWidth * 0.95,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.5), // لون الظل مع شفافية
                          spreadRadius: 2,
                          blurRadius: 7, // انتشار الظل
                        )
                      ],
                      color: MyColors.myYellow,
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: const EdgeInsets.only(left: 295),
                  child: const Text(
                    ":التاريخ",
                    style: TextStyle(
                        fontSize: 12, fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Container(
                    child: Text(
                      p1.data?.birthday.toString()??"",
                      style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 20,
                          color: MyColors.myBlack),
                    ),
                    height: 60,
                    alignment: Alignment.centerRight * 0.86,
                    width: myScreenWidth * 0.95,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.5), // لون الظل مع شفافية
                          spreadRadius: 2,
                          blurRadius: 7, // انتشار الظل
                        )
                      ],
                      color: MyColors.myYellow,
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileEdit(
                                    firstName: p1.data!.fname.toString(),
                                    secoundName: p1.data!.mname.toString(),
                                    lastName: p1.data!.lname.toString(),
                                    cardNumber:
                                        p1.data!.nationalNumber.toString(),
                                    phoneNumber:
                                        p1.data!.phoneNumber.toString(),
                                    email: p1.data!.email.toString(),
                                    birthdate: p1.data!.birthday.toString(),
                                  )));
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        "تعديل المعلومات",
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
    );
  }
}
