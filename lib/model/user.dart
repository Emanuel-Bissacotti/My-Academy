class Users {
  String? uid;
  String fullName;
  String email;
  String password;
  String restrictions;

  Users(
      {this.uid,
      required this.fullName,
      required this.email,
      required this.password,
      required this.restrictions});

  Users.fromMap(Map<String, dynamic> map)
      : uid = map["uid"],
        fullName = map["fullName"],
        email = map["email"],
        password = map["password"],
        restrictions = map["restrictions"];

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullName": fullName,
      "email": email,
      "password": password,
      "restrictions": restrictions,
    };
  }
}
