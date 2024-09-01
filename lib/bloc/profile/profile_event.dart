abstract class UserProfileEvent {}

class UserProfileFetchEvent extends UserProfileEvent {
  final bool emitLoading;

  UserProfileFetchEvent({this.emitLoading = true});
}
