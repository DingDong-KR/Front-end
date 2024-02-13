class UserAffiliationFields {
  static final String userAffiliationsId = 'userAffiliationsId';
  static final String userId = 'userId';  // 사용자 id// 사용자 이름
  static final String affiliation = 'affiliation'; // 소속 기관(동아리)

}

class UserAffiliation {
  static String tableName = 'userAffiliation'; // table 이름

  final int? userAffiliationsId;
  final String userId;
  final String affiliation;

  UserAffiliation({
    this.userAffiliationsId,
    required this.userId,
    required this.affiliation,
  });

  // User 객체를 Map으로 변환
  Map<String, dynamic> toJson() {
    return {
      UserAffiliationFields.userAffiliationsId: userAffiliationsId,
      UserAffiliationFields.userId: userId,
      UserAffiliationFields.affiliation: affiliation,
    };
  }

  // Map을 User 객체로 변환
  factory UserAffiliation.fromJson(Map<String, dynamic> json) {
    return UserAffiliation(
      userAffiliationsId: json[UserAffiliationFields.userAffiliationsId] as int,
      userId: json[UserAffiliationFields.userId] as String,
      affiliation: json[UserAffiliationFields.affiliation] as String,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userAffiliationsId': userAffiliationsId,
      'userId': userId,
      'password': affiliation,
    };
  }

  // Map을 User 객체로 변환하는 메서드
  factory UserAffiliation.fromMap(Map<String, dynamic> map) {
    return UserAffiliation(
      userAffiliationsId: map['userAffiliationsId'],
      userId: map['userId'],
      affiliation: map['affiliation'],
    );
  }
}