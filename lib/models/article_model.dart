//now let's create the article model
// for that we just copy the property from the json structure
// and make it to dart object

import 'package:news_app_api/models/source_model.dart';

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  //Now let's create the Constructor
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  //and now let's Create the fuction that will map to the json into list
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json['soucre'],
      author: json['author'] as String,
      title: json['title'],
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}
