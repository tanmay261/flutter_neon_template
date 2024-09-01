class User {
  final int id;
  final String name;
  final String email;
  final String dob;
  final String? password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.dob,
    this.password,
  });

  // Factory method to create a User from a map (fromMap).
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      dob: map['dob'] as String,
    );
  }

  // Method to convert a User to a map (toMap).
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'dob': dob,
    };
  }
}

enum UserProfileStatus {
  initial, // Initial state
  loading, // Loading state
  loaded, // Successfully loaded state
  error // Error state
}
