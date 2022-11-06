import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_it/ui/home/home_screen.dart';
import '../../theme/theme.dart';
import '../../utility/utiliy.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    // Future.delayed(const Duration(milliseconds: 10)).then((value) {
    //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //       statusBarColor: MyAppColor.primaryColor,
    //       statusBarIconBrightness: Brightness.light));
    //   checkPermission();
    // });
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: MyAppColor.primaryColor,
          toolbarHeight: 140,
          elevation: 15,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Login",
            style: TextStyle(
              color: MyAppColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          leading: const Text(""),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    color: MyAppColor.textFieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: nameController,
                    maxLength: 51,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      counterText: "",
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      filled: true,
                      hintText: "Enter Your Name",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    color: MyAppColor.textFieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    maxLength: 18,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "  +91",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          Container(
                            height: 25,
                            width: 1.5,
                            margin: const EdgeInsets.all(10),
                            color: MyAppColor.primaryColor,
                          )
                        ],
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 0, minHeight: 0),
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      filled: true,
                      hintText: "Enter Your Number",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                MaterialButton(
                  padding: const EdgeInsets.fromLTRB(60, 13, 60, 13),
                  color: MyAppColor.primaryColor,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      Utility.myToast(messages: "Enter A Name");
                    } else if (nameController.text.length < 3) {
                      Utility.myToast(
                          messages: "Name to be greater than 3 characters");
                    } else if (nameController.text.length > 50) {
                      Utility.myToast(
                          messages: "Name to be less than 50 characters");
                    } else if (numberController.text.isEmpty) {
                      Utility.myToast(messages: "Enter A Number");
                    } else if (numberController.text.length > 10) {
                      Utility.myToast(messages: "Number to be 10");
                    } else {
                      SystemChrome.setSystemUIOverlayStyle(
                        const SystemUiOverlayStyle(
                            statusBarColor: Colors.white,
                            statusBarIconBrightness: Brightness.dark,
                            statusBarBrightness: Brightness.dark),
                      );

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }

                    // setState(() {});
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: MyAppColor.textColor,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
