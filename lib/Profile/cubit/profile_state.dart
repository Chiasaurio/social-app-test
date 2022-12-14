part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel profile;
  final List<PostModel> posts;

  const ProfileLoaded({required this.profile, required this.posts});

  @override
  List<Object> get props => [profile, posts];
}
