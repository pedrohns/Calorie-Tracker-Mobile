import 'package:calorie_tracker/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/utils/util_custom.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    bool isLogged = UtilCustom().userIsLogged();
    print('AuthenticationPage checkLoginStatus isLogged : $isLogged');
    if (!isLogged) {
      // Se não estiver logado, redirecione para a página de login
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        color: Color.fromRGBO(18, 19, 29, 0.859),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}