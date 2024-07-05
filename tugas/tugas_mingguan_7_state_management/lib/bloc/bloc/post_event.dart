part of 'post_bloc.dart';


abstract class PostEvent extends Equatable {
  const PostEvent();
}

class LoadPostEvent extends PostEvent {
  @override
  List<Object> get props => [];
}

class LoadPostDetailEvent extends PostEvent {
  final int id;

  LoadPostDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}

