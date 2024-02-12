// 필드명을 문자열 상수로 정의
class UserFields {
  static final String userId = 'userId';  // 사용자 id
  static final String email = 'email';
  static final String name = 'name';  // 사용자 이름
  static final String password = 'password'; // 비밀번호
  static final String affiliation = 'affiliation'; // 기관

}

class User {
  static String tableName = 'user'; // table 이름

  final String userId;
  final String name;
  final String email;
  final String password;
  final List<String>? affiliation;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    this.affiliation,
  });

  // User 객체를 Map으로 변환
  Map<String, dynamic> toJson() {
    return {
      UserFields.userId: userId,
      UserFields.name: name,
      UserFields.email: email,
      UserFields.password: password,
      UserFields.affiliation: affiliation?.join(';'),
    };
  }

  // Map을 User 객체로 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json[UserFields.userId] as String,
      name: json[UserFields.name] as String,
      email: json[UserFields.email] as String,
      password: json[UserFields.password] as String,
      affiliation: json[UserFields.affiliation] == null ? null : (json[UserFields.affiliation] as String).split(';'),
    );
  }
<<<<<<< HEAD
}
=======

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'affiliation': affiliation,
    };
  }

  // Map을 User 객체로 변환하는 메서드
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      affiliation: map['affiliation'],
    );
  }

>>>>>>> f090792f16324eb25105fc729c9a2ff0babc9825
  // 현재 User 객체를 복제하고 일부 속성을 변경 (불변 객체 활용 방식)
  /*
    User user1 = User(userId: '1', name: 'John', password: '1234', affiliation: 'Company1');
    User user2 = user1.clone(name: 'Jane');
  */
<<<<<<< HEAD
//   User clone({
//     String? userId,
//     String? name,
//     String? email,
//     String? password,
//     String? affiliation,
//   }) {
//     return User(
//       userId: userId ?? this.userId,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       password: password ?? this.password,
//       affiliation: affiliation ?? this.affiliation,
//     );
//   }
// }
=======

  User clone({
    String? userId,
    String? name,
    String? email,
    String? password,
    String? affiliation,
  }) {
    return User(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      affiliation: affiliation ?? this.affiliation,
    );
  }
}
>>>>>>> f090792f16324eb25105fc729c9a2ff0babc9825
