class PersonDTO {
  PersonDTO({this.email});
  String? email;

  factory PersonDTO.fromJson(Map<String, String>? json) {
    return PersonDTO(email: json?['email'] ?? 'test@test.com');
  }

  Map<String, String> toJson() => {'email': email ?? ''};
}
