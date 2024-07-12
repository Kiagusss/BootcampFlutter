import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_10_public_api/bloc/bloc_event.dart';
import 'package:tugas_10_public_api/bloc/bloc_news.dart';
import 'package:tugas_10_public_api/bloc/bloc_state.dart';

import 'repository/news_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => NewsBloc(NewsRepository())..add(FetchNews()),
        child: const NewsPage(),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            return const Center(child: Text('Please wait...'));
          } else if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.news.articles?.length ?? 0,
              itemBuilder: (context, index) {
                final article = state.news.articles![index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4.0,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12.0),
                    title: Text(article.title ?? 'No title'),
                    subtitle: article.description != null
                        ? Text(article.description!)
                        : null,
                    leading: article.urlToImage != null
                        ? Image.network(
                            article.urlToImage!,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          )
                        : const Icon(Icons.broken_image),
                    onTap: () {},
                  ),
                );
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
