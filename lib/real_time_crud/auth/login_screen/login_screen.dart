import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../signup_screen/singup_screen.dart';



class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Login Form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 80),
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.passwordController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30.0),
                Obx(() => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : MaterialButton(
                  color: Colors.blue,
                  onPressed: controller.login,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, letterSpacing: 3),
                  ),
                )),
                SizedBox(
                  height: 50,
                  child: Container(

                    child: TextButton(
                      onPressed: () {
                        Get.to(() => SignupScreen());
                      },
                      child: Text('Create an Account'),
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
