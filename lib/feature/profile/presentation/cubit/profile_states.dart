class ProfileStates {}

class ProfileInitial extends ProfileSuccess {}

class ProfileSuccess extends ProfileStates {}

class ProfileLoading extends ProfileStates {}

class ProfileError extends ProfileStates {
  final String? message;

  ProfileError({this.message});
}
