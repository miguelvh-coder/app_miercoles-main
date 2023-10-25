import 'package:app_oper/ui/pages/content/user_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup.dart';
import 'package:loggy/loggy.dart';
import '../../controllers/authentication_controller.dart';
// Asegúrate de importar UserListPage correctamente

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: 'a@a.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '123456');

  AuthenticationController authenticationController = Get.find();

  _login(theEmail, thePassword) async {
    logInfo('_login $theEmail $thePassword');
    try {
      await authenticationController.login(theEmail, thePassword);
    } catch (err) {
      Get.snackbar(
        "Login",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login with email",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(labelText: "Email address"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter email";
                      } else if (!value.contains('@')) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter password";
                      } else if (value.length < 6) {
                        return "Password should have at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //Get.to(() => const UserListPage());
                        _login(_emailController.text, _passwordController.text);
                      }
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => SignUp());
              },
              child: Text("Create account"),
            )
          ],
        ),
      ),
    );
  }
}
