import 'package:flutter/material.dart';
import 'package:myacademy/components/text_field_login.dart';
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
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passowrdController = TextEditingController();

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
                    buildTextFormField(
                      controller: _emailController,
                      labelText: 'E-mail:',
                      keyboard: TextInputType.emailAddress,
                    ),
                    buildTextFormField(
                        controller: _passowrdController,
                        labelText: 'Senha:',
                        password: true,
                        keyboard: TextInputType.visiblePassword),
                    ElevatedButton(
                      onPressed: () => _validateLogin(
                        _emailController.text,
                        _passowrdController.text,
                      ),
                      onLongPress: () => _createUser(
                        _emailController.text,
                        _passowrdController.text,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white70), // Define a cor de fundo
                      ),
                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.black, // Define a cor do texto
                          fontSize: 19, // Define o tamanho da fonte (opcional)
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
      AuthService().entrarUsuario(email: email, senha: senha);
      Navigator.pop(context);
    } else {}
  }

  _createUser(String email, String senha) {
    if (_loginForm.currentState!.validate()) {
      AuthService().cadastrarUsuario(email: email, senha: senha);
    }
  }
}
