part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<Post> posts;

  const PostLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostErrorState extends PostState {
  final String error;

  const PostErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class PostDetailLoadingState extends PostState {}

class PostDetailLoadedState extends PostState {
  final Post post;

  PostDetailLoadedState(this.post);

  @override
  List<Object> get props => [post];
}

class PostDetailErrorState extends PostState {
  final String error;

  PostDetailErrorState(this.error);

  @override
  List<Object> get props => [error];
}
