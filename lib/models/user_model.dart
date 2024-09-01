class User {
  int? id;
  String? name;
  String email;
  DateTime? dob;
  String? password;

  User({
    this.id,
    this.name,
    required this.email,
    this.dob,
    this.password,
  });

  // Factory method to create a User from a map (fromMap).
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      dob: map['dob'] as DateTime,
    );
  }

  // Factory method to create a User from a map (fromMap).
  factory User.fromSignInMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  factory User.fromSignUpMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  factory User.fromUpdateMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      dob: map['dob'] as DateTime,
    );
  }

  // Method to convert a User to a map (toMap).
  Map<String, dynamic> toMap() {
    if (id != null) {
      return {
        'id': id,
        'name': name,
        'email': email,
        'dob': dob!.toIso8601String(),
      };
    }
    return {
      'name': name,
      'email': email,
      'dob': dob!.toIso8601String(),
    };
  }

  // Method to create a user while authentication.
  Map<String, dynamic> toSignInMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  // Method to create a user while registration.
  Map<String, dynamic> toSignUpMap() {
    return {
      'name': name,
      'email': email,
      'dob': dob!.toIso8601String(),
      'password': password,
    };
  }
}

enum UserProfileStatus {
  initial, // Initial state
  loading, // Loading state
  loaded, // Successfully loaded state
  error // Error state
}
