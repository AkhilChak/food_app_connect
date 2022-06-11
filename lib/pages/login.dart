import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/pages/otp_screen.dart';
import 'package:project/services.dart';
import 'package:project/utils.dart';

import 'home.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var isLoggedIn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoggedIn = false;
  }
  @override
  Widget build(BuildContext context) {
    final phoneNumber = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          elevation: 1,
          title: Text(
              "Login to FoodConnect",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: ColorManager.appBarColor
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Get started with Food Connect",
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                "Enter your phone number get started with your foodgasm",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            TextField(
              controller: phoneNumber,

              maxLength: 10,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a phone number',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () async{
                    print(phoneNumber);
                    SizeConfig().init(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text(
                                    "OTP Verification",
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                backgroundColor: ColorManager.appBarColor,
                              ),
                              body: OtpScreen(phoneNumber: phoneNumber.text),
                            );
                          })
                    );
                  },
                  child: const Text("Get OTP"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}