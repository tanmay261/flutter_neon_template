import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neon_template/bloc/profile/profile_event.dart';
import 'package:flutter_neon_template/bloc/profile/profile_state.dart';
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
      userProfile = (await fetchUserProfile())!;
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
