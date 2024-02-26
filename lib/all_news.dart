import 'package:flutter/material.dart';
import 'package:news_app/api_serviec.dart';
import 'package:news_app/news_item_list.dart';
import 'package:news_app/news_model.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
          future: apiService.getAllNews(),
          builder: (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot) {
            if(snapshot.hasData){
              List<NewsModel> articleList = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: articleList.length,
                  itemBuilder: (context,index){
                    return NewsItemList(newsModel: articleList[index],);

                  });
            }
            return const Center(child: CircularProgressIndicator(),);
          },
      ),
    );
  }
}
