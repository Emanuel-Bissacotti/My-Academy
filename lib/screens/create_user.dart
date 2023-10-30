import 'package:flutter/material.dart';
import 'package:myacademy/components/build_text_field.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  @override
  Widget build(BuildContext context) {
    final _createUser = GlobalKey<FormState>();

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
        key: _createUser,
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
          ],
        ),
      ),
    );
  }
}
