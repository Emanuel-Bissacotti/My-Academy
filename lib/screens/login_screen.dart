import 'package:flutter/material.dart';
import 'package:myacademy/components/show_snackBar.dart';
import 'package:myacademy/components/build_text_field.dart';
import 'package:myacademy/screens/create_user.dart';
import 'package:myacademy/screens/home_screen.dart';
import 'package:myacademy/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passowrdController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Image.asset(
                "images/imagesLogin.avif",
                width: double.infinity,
                height: double.infinity,
              ),
              Form(
                key: _loginForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BuildFormField(
                      controller: emailController,
                      labelText: 'E-mail:',
                    ),
                    BuildFormField(
                      controller: passowrdController,
                      labelText: 'Senha:',
                      showVisibilityIcon: true,
                      obscureText: true,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateUser(),
                            ),
                          );
                        },
                        child: const Text(
                          "Não possui cadastro? clique aqui e cadastre-se",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        )),
                    ElevatedButton(
                      onPressed: () => _validateLogin(
                        emailController.text,
                        passowrdController.text,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white70),
                      ),
                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateLogin(String email, String senha) {
    if (_loginForm.currentState!.validate()) {
      AuthService().entrarUsuario(email: email, senha: senha).then((error) {
        if (error != null) {
          ShowSnackBar(context: context, text: error);
        }
      });
    } else {}
  }

  // _createUser(String email, String senha) {
  //   if (_loginForm.currentState!.validate()) {
  //     AuthService()
  //         .cadastrarUsuario(email: email, password: senha)
  //         .then((error) {
  //       if (error != null) {
  //         ShowSnackBar(context: context, text: error, color: Colors.red);
  //       }
  //     });
  //   }
  // }
}
