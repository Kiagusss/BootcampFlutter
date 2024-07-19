
class Article {
  final String? author;
  final String? title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}



class NewsResponse {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    var articlesJson = json['articles'] as List;
    List<Article> articlesList =
        articlesJson.map((articleJson) => Article.fromJson(articleJson)).toList();

    return NewsResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articlesList,
    );
  }
}