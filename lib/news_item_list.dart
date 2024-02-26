import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news_detail_screen.dart';
import 'package:news_app/news_model.dart';

class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;
  const NewsItemList({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetail(newsModel: newsModel,)));
        },
        child: SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.grey.shade300,
            elevation: 0,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(newsModel.title.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: newsModel.urlToImage.toString(),
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Card(
                      color: Colors.greenAccent,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(newsModel.source!.name.toString()),
                      ),
             ),
                    Card(
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(newsModel.publishedAt.toString()),
                      ),

                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
