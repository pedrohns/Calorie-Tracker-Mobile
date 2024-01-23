import 'package:calorie_tracker/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/utils/util_custom.dart';
import 'package:calorie_tracker/authenticator/auth_manager.dart';


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
    try {
      bool isLogged = await AuthManager.isLoggedIn();
      print('AuthenticationPage checkLoginStatus isLogged : $isLogged');
      if (!isLogged) {
        // Se não estiver logado, redirecione para a página de login
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      } else {
        String? userId =  await AuthManager.getUserId();
        UtilCustom().setUserData(userId!);
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      }
    } catch (e) {
      print('AuthenticationPage checkLoginStatus -  Erro na autenticação: ${e.toString()}');
      UtilCustom().showToast('Erro na autenticação! Tente novamente mais tarde.');
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
            ),
          ],
        ),
      ),
    );
  }
}
