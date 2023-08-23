//now let's create the article model
// for that we just copy the property from the json structure
// and make it to dart object

import 'package:news_app_api/models/source_model.dart';

class Article {
  final Source source;
  String? author;
  final String title;
  final String description;
  String url;
  String urlToImage;
  String publishedAt;
  String? content;

  //Now let's create the Constructor
  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  //and now let's Create the fuction that will map to the json into list
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'],
    );
  }
}
