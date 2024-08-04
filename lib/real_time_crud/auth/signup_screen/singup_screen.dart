import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../flutterTestOne/splashScreen/emailAuth/loginScreen.dart';
import '../../controller/auth_controller.dart';
import '../login_screen/login_screen.dart';


class SignupScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Sign up Form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: controller.firstnameController,
                  decoration: const InputDecoration(
                    labelText: 'First name',
                    suffixIcon: Icon(Icons.people),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.lastnameController,
                  decoration: const InputDecoration(
                    labelText: 'Last name',
                    suffixIcon: Icon(Icons.people),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
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
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                Obx(() => Row(
                  children: [
                    Checkbox(
                      value: controller.isChecked.value,
                      onChanged: (bool? value) {
                        controller.isChecked.value = value!;
                      },
                    ),
                    Text('I agree to terms and conditions'),
                  ],
                )),
                const SizedBox(height: 10.0),
                Obx(() => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : MaterialButton(
                  color: Colors.blue,
                  onPressed: controller.signup,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, letterSpacing: 3),
                  ),
                )),
                SizedBox(
                  height: 50,
                  child: Container(
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text('Already have an Account'),
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
