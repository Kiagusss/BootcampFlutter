import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pengayaan_17_api_public/bloc/bloc_event.dart';
import 'package:pengayaan_17_api_public/bloc/bloc_state.dart';
import 'package:pengayaan_17_api_public/repository/news_repository.dart';

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
