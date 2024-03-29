import 'package:calorie_tracker/utils/app_routes.dart';
import 'package:calorie_tracker/utils/util_custom.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/network/http.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:calorie_tracker/authenticator/auth_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String isLoginFailed = 'not logged';
  var http = Http();

  void _login() async {
    setState(() {
      isLoginFailed = 'loading';
    });
    String email = emailController.text;
    var bytes = utf8.encode(passwordController.text);
    String password = sha256.convert(bytes).toString();
    print('_login password: $password');

    try {
      var response = await http.sendRequest(
          'checkLogin', 'post', {'email': email, 'password': password});
      if (response['status'] == 'Authenticated') {
        AuthManager.login(response['id']);
        String? userId =  await AuthManager.getUserId();
        UtilCustom().setUserData(userId!);
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      } else {
        setState(() {
          isLoginFailed = 'failed';
        });
      }
    } catch (e) {
      print('_login - erro - ${e.toString()}');
    }
  }

  Widget showData() {
    // ScaffoldMessenger.of(context).showSnackBar(
    //                 SnackBar(
    //                   content: Text('Login failed. Please try again.'),
    //                 ),
    //               );
    if (isLoginFailed == 'failed') {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          'Email ou senha incorreta. Por favor tente novamente.',
          style: TextStyle(color: Colors.red, fontSize: 10.0),
        ),
      );
    } else if (isLoginFailed == 'loading') {
      return Container(width: 10, height: 10, child: CircularProgressIndicator());
    } else {
      return Text('');
    }
  }

  Widget buildTextField(TextEditingController controller, String labelText,
      String hintText, bool obscure,
      [TextInputType? keyboardType]) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextStyle titleLarge = Theme.of(context).textTheme.titleLarge!;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(top: height * 0.11),
        color: Theme.of(context).colorScheme.secondary,
        // height: double.infinity,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Calorie Tracker",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: titleLarge.color,
                  fontFamily: titleLarge.fontFamily,
                  fontWeight: titleLarge.fontWeight,
                  fontSize: 50,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Spacer(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                width: width * 0.8, // assim subtrai 20% de largura
                height: height * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      SizedBox(height: height * 0.15),
                      buildTextField(
                          emailController,
                          'Email',
                          'Digite seu email',
                          false,
                          TextInputType.emailAddress),
                      SizedBox(height: 16),
                      buildTextField(passwordController, 'Password',
                          'Digite sua senha', true),
                      SizedBox(height: 16.0),
                      SizedBox(
                        width: width * 0.8,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(79, 154, 255, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: Text('Entrar'),
                        ),
                      ),
                      showData(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
