import 'package:flutter/widgets.dart';
import 'package:flutter_neon_template/constants.dart';
import 'package:flutter_neon_template/main.dart';
import 'package:flutter_neon_template/models/user_model.dart';
import 'package:flutter_neon_template/repository/user_repository.dart';
import 'package:flutter_neon_template/utils/utils.dart';

final UserRepository userRepository = UserRepository(postgresConnectionManager);

Future<User?> fetchUserProfile(id) async {
  // Fetch the user profile from the repository
  debugPrint('Fetching user profile');
  return await userRepository.findUserById(id);
}

Future<void> updateUserProfile(User user) async {
  // Update the user profile in the repository
  await userRepository.updateUser(user.id!, user);
}

Future<void> deleteUserProfile(int id) async {
  // Delete the user profile from the repository
  await userRepository.deleteUser(id);
}

Future<User?> loginVerify(String email, String password) async {
  // Verify the user's login credentials
  final User? user = await userRepository.orm.findOneWhere(
    substitutionValues: {
      'email': email,
    },
  );

  if (user != null && user.password == password) {
    return user;
  } else {
    return null;
  }
}

Future login(User user) async {
  // Log in the user by storing the user ID in secure storage
  debugPrint('Logging in user');
  final User? createdUser = await userRepository.findUserByEmail(user.email);
  if (createdUser!.password != hashPassword(user.password!)) {
    debugPrint("Invalid password");
    throw Exception('Invalid password.Please try again');
  }
  debugPrint("createdUser.password: ${createdUser.password}");
  await secureStorage.write(
      key: USER_SECURE_STORAGE_KEY, value: user.id.toString());
  return createdUser;
}

Future<User?> registerUser(User user) async {
  // Register a new user in the repository
  debugPrint('Registering user');
  user.password = hashPassword(user.password!);
  await userRepository.orm.insert(user.toSignUpMap());
  debugPrint(user.email);
  final User? createdUser = await userRepository.findUserByEmail(user.email);
  await secureStorage.write(
      key: USER_SECURE_STORAGE_KEY, value: createdUser!.id.toString());
  debugPrint('User registered successfully');
  return createdUser;
}

Future<void> logoutUser() async {
  // Log out the user by deleting the user ID from secure storage
  await secureStorage.delete(key: USER_SECURE_STORAGE_KEY);
}
