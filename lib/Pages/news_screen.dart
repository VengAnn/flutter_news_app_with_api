import 'package:flutter/material.dart';
import 'package:news_app_api/Componenets/custom_listtile.dart';
import 'package:news_app_api/Services/api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService client = ApiService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        centerTitle: true,
        title: const Text("News App"),
      ),
      //Now let's call the Api Service with futurebuilder widget
      body: SafeArea(
        child: FutureBuilder(
          future: client.getArticle(),
          builder: (context, snapshot) {
            //let's check if we got a response or not
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.hasError}"),
              );
            }
            if (snapshot.data!.isEmpty || snapshot.data == null) {
              return const Center(
                child: Text("No data Available"),
              );
            }
            //and all above condition not true we return data: this mean have data
            final articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) {
                return CustomListTile(articles[index], context);
              },
            );
          },
        ),
      ),
    );
  }
}
