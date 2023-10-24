import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myacademy/model/user.dart';

class UserService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveUser(String uid, Users user) async {
    try {
      firestore.collection('users').doc(uid).set(user.toMap());
    } catch (e) {
      // Trate erros aqui
      print(e.toString());
    }
  }
}
