import 'package:application/app/modules/home/views/home_view.dart';
import 'package:application/app/modules/register/views/register_view.dart';
import 'package:application/app/shared/textfFiled.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(33.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 70,
              ),
              child: Text(
                "Welcome back!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 174, 173, 173),
                            fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    MyTextField(
                      isPassword: false,
                      type: TextInputType.emailAddress,
                      hintText: '',
                      icon: Icon(
                        Icons.person,
                        color: const Color.fromARGB(255, 174, 173, 173),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 174, 173, 173),
                            fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    MyTextField(
                      isPassword: true,
                      type: TextInputType.text,
                      hintText: "",
                      icon: Icon(
                        Icons.lock,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: ElevatedButton(
                          onPressed: () {
                             Get.to(HomeView());
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(232, 17, 252, 1),
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 15),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New to the app?",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 174, 173, 173),
                              fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(RegisterView());
                          },
                          child: Text(
                            'Create an account!',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 174, 173, 173),
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
