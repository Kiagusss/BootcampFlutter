import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


import '../../model/post_model.dart';
import '../../services/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;
  PostBloc(this._postRepository) : super(PostLoadingState()) {
    on<LoadPostEvent>((event, emit) async {
      emit(PostLoadingState());

      try {
        final posts = await _postRepository.fetchPosts();
        emit(PostLoadedState(posts));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    }); 
    on<LoadPostDetailEvent>((event, emit) async {
      emit(PostLoadingState());

      try {
        final post = await _postRepository.getPostDetail(event.id);
        emit(PostDetailLoadedState(post));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
  }
  



