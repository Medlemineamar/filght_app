import 'package:flight_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flight_app/config.dart';
// import 'package:flight_app/screens/forgot_password_screen.dart';
import 'package:flight_app/widget/my_button.dart';
// import 'package:flight_app/widget/my_text_filed.dart';
import 'package:get/get.dart';

import '../app_constants.dart';
import '../controllers/auth_controller.dart';
import '../services/firebase_service.dart';
import '../utils.dart';
// import 'main_screen.dart';
import 'sign_up_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  final FirebaseService _firebaseService = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: AppBar().preferredSize.height * 3),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child:AppConstants.appIcon
                ),
               SizedBox(height: fullHeight(context) * 0.04),
                const Text(
                  'Connection',
                  style: TextStyle(
                    
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                SizedBox(height: fullHeight(context) * 0.01),
                 SizedBox(height: 50.0,
                          width: 130,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: Colors.black,thickness: 4,height: 20,),
                            ],
                          ),),
                TextFormField(
                  controller: _authController.emailController,
                  decoration: InputDecoration(labelText: 'Email',labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 30,),
                    ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: fullHeight(context) * 0.02),
                TextFormField(
                  controller: _authController.passwordController,
                  decoration: InputDecoration(labelText: 'Password',labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 30,
                  )),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: fullHeight(context) * 0.01),

                SizedBox(height: fullHeight(context) * 0.12),
                Obx(() => _authController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : MyButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _authController.setIsLoading(true);
                            var loginResult = await _firebaseService.login(
                                _authController.emailController.text,
                                _authController.passwordController.text);
                            if (loginResult == true) {
                              _authController.setIsLoading(false);
                              Get.off(HomeScreen());
                            } else {
                              _authController.setIsLoading(false);
                              showSnackbarError('Login failed !');
                            }
                          }
                        },
                       
                        title: 'Log In')),
                SizedBox(height: fullHeight(context) * 0.03),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Don't have an account ? ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Create Account Here',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
