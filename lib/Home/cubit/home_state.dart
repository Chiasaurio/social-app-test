part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomePostLoaded extends HomeState {
  final List<PostWithUser> posts;

  HomePostLoaded({required this.posts});
  @override
  List<Object?> get props => [posts];
}
