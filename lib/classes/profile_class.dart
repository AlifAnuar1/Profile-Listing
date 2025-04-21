class Profile {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePicUrl;
  bool isFavourite;

  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePicUrl,
    required this.isFavourite,
  });

  Profile copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? profilePicUrl,
    bool? isFavourite,
  }) {
    return Profile(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id ?? '',
      'firstName': firstName ?? '',
      'lastName': lastName ?? '',
      'email': email ?? '',
      'profilePicUrl': profilePicUrl ?? '',
      'isFavourite': isFavourite,
    };
  }

  factory Profile.fromMap(Map<dynamic, dynamic> map, String id) {
    return Profile(
      id: id,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      profilePicUrl: map['profilePicUrl'] ?? '',
      isFavourite: map['isFavourite'] ?? false,
    );
  }

  @override
  String toString() {
    return 'Profile(id: $id, firstName: $firstName, lastName: $lastName, email: $email, profilePicUrl: $profilePicUrl, isFavourite: $isFavourite)';
  }
}
