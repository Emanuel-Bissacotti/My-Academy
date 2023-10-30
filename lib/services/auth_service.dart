import 'package:firebase_auth/firebase_auth.dart';
import 'package:myacademy/model/user.dart';
import 'package:myacademy/services/user_service.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> entrarUsuario(
      {required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          return "O e-mail não está cadastrado.";
        case "wrong-password":
          return "Senha incorreta.";
        case "INVALID_LOGIN_CREDENTIALS":
          return "Email ou senha incorretas";
      }
      return e.code;
    }

    return null;
  }

  Future<String?> cadastrarUsuario({required Users user}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      String uid = userCredential.user!.uid;

      await UserService().saveUser(uid, user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return "O e-mail já está em uso.";
        case "invalid-email":
          return "email inválido";
      }
      return e.code;
    }

    return null;
  }
}
