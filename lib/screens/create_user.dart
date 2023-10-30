import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myacademy/components/build_text_field.dart';
import 'package:myacademy/components/show_snackBar.dart';
import 'package:myacademy/model/user.dart';
import 'package:myacademy/services/auth_service.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  @override
  final createUser = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passowrdController = TextEditingController();
    TextEditingController fullNameController = TextEditingController();
    TextEditingController restrictionsController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: const Text('Cadastro'),
      ),
      body: Form(
        key: createUser,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildFormField(
              controller: fullNameController,
              labelText: "Nome Completo",
            ),
            BuildFormField(
              controller: emailController,
              labelText: "Email",
              keyboard: TextInputType.emailAddress,
            ),
            BuildFormField(
              controller: passowrdController,
              labelText: "Senha",
              obscureText: true,
              showVisibilityIcon: true,
            ),
            BuildFormField(
              labelText: "Restrições",
              controller: restrictionsController,
            ),
            ElevatedButton(
                onPressed: () {
                  if (createUser.currentState!.validate()) {
                    Users user = Users(
                      fullName: fullNameController.text,
                      email: emailController.text,
                      password: passowrdController.text,
                      restrictions: restrictionsController.text,
                    );

                    _createUser(user);
                  }
                },
                child: Text("Criar usuario"))
          ],
        ),
      ),
    );
  }

  _createUser(Users user) {
    AuthService().cadastrarUsuario(user: user).then((error) {
      if (error != null) {
        ShowSnackBar(context: context, text: error, color: Colors.red);
      } else {
        Navigator.pop(context);
      }
    });
  }
}
