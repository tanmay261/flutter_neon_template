import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neon_template/bloc/profile/profile_event.dart';
import 'package:flutter_neon_template/bloc/profile/profile_state.dart';
import 'package:flutter_neon_template/constants.dart';
import 'package:flutter_neon_template/main.dart';
import 'package:flutter_neon_template/models/user_model.dart';
import 'package:flutter_neon_template/service/user_service.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  late User userProfile; // The user profile object
  late UserProfileStatus userProfileStatus; // The status of the user profile

  UserProfileBloc() : super(UserProfileInitial()) {
    on<UserProfileEvent>(_initializeUserProfile);
  }

  Future<void> _initializeUserProfile(
    UserProfileEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(UserProfileLoading());

    try {
      // Fetch the user profile from your service
      final int userId = int.parse(
          await secureStorage.read(key: USER_SECURE_STORAGE_KEY) ?? '-1');
      if (userId == -1) {
        throw Exception('User ID not found');
      }
      userProfile = (await fetchUserProfile(userId))!;
      userProfileStatus = UserProfileStatus.loaded;

      emit(
        UserProfileSuccess(
          userProfileStatus: userProfileStatus,
          userProfile: userProfile,
        ),
      );
    } catch (error) {
      emit(UserProfileError(error: error.toString()));
    }
  }
  // Define more event handlers for updating user profile, logging out, etc.
}
