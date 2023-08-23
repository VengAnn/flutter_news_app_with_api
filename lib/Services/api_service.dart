import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app_api/models/article_model.dart';

class ApiService {
  //link get news on webiste : https://newsapi.org/docs/endpoints
  final apiUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=7137086ca4214e6bac3b590aa8034bc3';

  //Now let's Create the http request function
  Future<List<Article>> getArticle() async {
    final response = await get(Uri.parse(apiUrl));

    //First of all let's check that we got a 200 status code: this mean that the request was succes
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body); //jsonDecode Convert to dart type;
      List<dynamic> body = json['articles'];
      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception('Failed to get data');
    }
  }
}
