class UserModel {
  final String id;
  final String username;

  UserModel({required this.id, required this.username});

  // You may add more properties as needed for your user model

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      username: json['username'] as String,
    );
  }
}
