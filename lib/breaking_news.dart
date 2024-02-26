import 'package:flutter/material.dart';
import 'package:news_app/api_serviec.dart';
import 'package:news_app/news_item_list.dart';
import 'package:news_app/news_model.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
          future: apiService.getBreakingNews(),
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
