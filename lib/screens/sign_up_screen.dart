import 'package:flight_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flight_app/config.dart';
import 'package:flight_app/widget/my_button.dart';
import 'package:get/get.dart';

import '../app_constants.dart';
import '../controllers/auth_controller.dart';
import '../services/firebase_service.dart';
import '../utils.dart';
import 'login_screen.dart';
// import 'main_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController _authController = Get.put(AuthController());
  final FirebaseService _firebaseService = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                SizedBox(height: fullHeight(context) * 0.06),
                const Text(
                  'registration',
                  style: TextStyle(
                    color: Colors.black,
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
                          )),
                // SizedBox(height: fullHeight(context) * 0.04),
                // MyTextFiled(hint: 'Full name'),
                SizedBox(height: fullHeight(context) * 0.02),
                TextFormField(
                  
                  decoration: InputDecoration(labelText: 'Name',labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 30,),
                    ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: fullHeight(context) * 0.02),
                TextFormField(
                  controller: _authController.emailController,
                  decoration: InputDecoration(labelText: 'Email',labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 30,
                  )),
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
                
                
                SizedBox(height: fullHeight(context) * 0.04),
                Obx(
                  () => _authController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : MyButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _authController.setIsLoading(true);
                              var loginResult = await _firebaseService.signUp(
                                  _authController.emailController.text,
                                  _authController.passwordController.text);
                              _authController.setIsLoading(false);
                              if (loginResult == true) {
                                Get.off(HomeScreen());
                              } else {
                                showSnackbarError('Login failed !');
                              }
                            }
                          },
                          title: 'Create Account'),
                ),
                SizedBox(height: fullHeight(context) * 0.03),
                Center(
                  child: GestureDetector(
                    onTap: () => Get.to(LoginScreen()),
                    child: RichText(
                      text: const TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Login Here',
                              style: TextStyle(
                                  color: AppConstants.secondColor,
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
