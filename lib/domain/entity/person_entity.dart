class PersonEntity {
  PersonEntity({this.email});
  String? email;

  factory PersonEntity.fromJson(Map<String, String>? json) {
    return PersonEntity(email: json?['email'] ?? 'test@test.com');
  }

  Map<String, String> toJson() => {'email': email ?? ''};
}
