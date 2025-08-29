class UserModel {
  final String uid;
  final String? email;
  final String? displayName;

  UserModel({
    required this.uid,
    this.email,
    this.displayName
  });
}