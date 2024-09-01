import 'package:flutter/widgets.dart';
import 'package:flutter_neon_template/main.dart';
import 'package:flutter_neon_template/models/user_model.dart';
import 'package:flutter_neon_template/repository/user_repository.dart';

final UserRepository userRepository = UserRepository(postgresConnectionManager);

Future<User?> fetchUserProfile() async {
  // Fetch the user profile from the repository

  await userRepository.createTable();

  await userRepository.insertUser(User(
    id: 1,
    name: 'John Doe',
    email: "sampleemail@gmail.com",
    dob: '1990-01-01',
  ));

  debugPrint('Fetching user profile');
  return await userRepository.findUserById(1);
}
