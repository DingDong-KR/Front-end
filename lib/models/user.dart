// 필드명을 문자열 상수로 정의
class UserFields {
  static final String userId = 'userId';  // 사용자 id
  static final String email = 'email';
  static final String name = 'name';  // 사용자 이름
  static final String password = 'password'; // 비밀번호

}

class User {
  static String tableName = 'user'; // table 이름

  final String userId;
  final String name;
  final String email;
  final String password;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
  });

  // User 객체를 Map으로 변환
  Map<String, dynamic> toJson() {
    return {
      UserFields.userId: userId,
      UserFields.name: name,
      UserFields.email: email,
      UserFields.password: password,
    };
  }

  // Map을 User 객체로 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json[UserFields.userId] as String,
      name: json[UserFields.name] as String,
      email: json[UserFields.email] as String,
      password: json[UserFields.password] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  // Map을 User 객체로 변환하는 메서드
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  User clone({
    String? userId,
    String? name,
    String? email,
    String? password,
    List<String>? affiliation, // 리스트 형태로 수정된 부분
  }) {
    return User(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

