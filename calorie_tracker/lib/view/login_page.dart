import 'package:calorie_tracker/utils/app_routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoginFailed = false;

  void _login() {
    String email = emailController.text;
    String password = passwordController.text;
    // Aqui você deve realizar a autenticação real, por exemplo, com Firebase, API, etc.
    if (email == 'user@example.com' && password == 'password') {
      // Navegar para a próxima tela (página inicial, por exemplo)
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else {
      // Exibir mensagem de erro se a autenticação falhar
      setState(() {
        isLoginFailed = true;
      });
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
      body: Container(
        padding: EdgeInsets.only(top: height * 0.15),
        color: Theme.of(context).colorScheme.secondary,
        // height: double.infinity,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Calorie Tracker",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: titleLarge.color,
                fontFamily: titleLarge.fontFamily,
                fontWeight: titleLarge.fontWeight,
                fontSize: 50,
              ),
            ),
            SizedBox(height: 20),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      if (isLoginFailed)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Email ou senha incorreta. Por favor tente novamente.',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
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
