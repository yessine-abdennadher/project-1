import 'package:application/app/shared/textfFiled.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return // // ignore_for_file: prefer_const_constructors, unnecessary_import, unused_import, use_super_parameters

Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(33.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "hello there!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Full Name",
                    style: TextStyle(
                        color: Color.fromARGB(255, 174, 173, 173),
                        fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                const MyTextField(
                  isPassword: false,
                  type: TextInputType.emailAddress,
                  hintText: "",
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 174, 173, 173),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Email Address",
                    style: TextStyle(
                      color: Color.fromARGB(255, 174, 173, 173),
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const MyTextField(
                  isPassword: false,
                  type: TextInputType.emailAddress,
                  hintText: "",
                  icon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 174, 173, 173),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Password",
                    style: TextStyle(
                        color: Color.fromARGB(255, 174, 173, 173),
                        fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                const MyTextField(
                  isPassword: true,
                  type: TextInputType.text,
                  hintText: "",
                  icon: Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 174, 173, 173),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(
                        color: Color.fromARGB(255, 174, 173, 173),
                        fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ),
                const MyTextField(
                  isPassword: true,
                  type: TextInputType.text,
                  hintText: "",
                  icon: Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 174, 173, 173),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double
                      .infinity, // Set the width to match the parent width
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(232, 17, 252, 1),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 15), // Vertical padding
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Create an account",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    height:
                        20), // Add some space between the button and the text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a member?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 174, 173, 173),
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text(
                        'Sign in !',
                        style: TextStyle(
                          color: Color.fromARGB(255, 174, 173, 173),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );



  }
}
