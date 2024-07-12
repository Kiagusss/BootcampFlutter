import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_10_public_api/bloc/bloc_event.dart';
import 'package:tugas_10_public_api/bloc/bloc_state.dart';
import 'package:tugas_10_public_api/repository/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<FetchNews>((event, emit) async {
      emit(NewsLoading());
      try {
        final news = await newsRepository.fetchNews();
        emit(NewsLoaded(news));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });
  }
}
