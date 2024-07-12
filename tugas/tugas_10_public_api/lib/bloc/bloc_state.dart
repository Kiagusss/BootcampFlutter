
import 'package:tugas_10_public_api/model/news_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsResponse news;

  NewsLoaded(this.news);
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}