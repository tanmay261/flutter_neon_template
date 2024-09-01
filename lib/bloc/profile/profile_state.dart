import 'package:flutter_neon_template/models/user_model.dart';

abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileSuccess extends UserProfileState {
  UserProfileStatus userProfileStatus;
  User userProfile;

  UserProfileSuccess(
      {required this.userProfileStatus, required this.userProfile});
}

class UserProfileError extends UserProfileState {
  final String error;

  UserProfileError({required this.error});
}
