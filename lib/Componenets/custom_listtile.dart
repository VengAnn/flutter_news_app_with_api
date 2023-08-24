import 'package:flutter/material.dart';
import 'package:news_app_api/Pages/article_detail_screen.dart';
import '../models/article_model.dart';

// ignore: non_constant_identifier_names
Widget CustomListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ArticleDetailScreen(
          article: article,
        );
      }));
    },
    child: Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("${article.urlToImage}"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          //
          Container(
            color: Colors.red,
            child: Text(
              "${article.source!.name}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          //
          const SizedBox(
            height: 5.0,
          ),
          Text(
            // ignore: unnecessary_string_interpolations
            "${article.title}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
