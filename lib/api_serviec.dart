import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/news_model.dart';

class ApiService{

  final String allNewsApi = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=e917cad7d3514ddd8e499156c4ee95f8";
  final String breakingNews = "https://newsapi.org/v2/top-headlines?country=us&apiKey=e917cad7d3514ddd8e499156c4ee95f8";



  Future<List<NewsModel>> getAllNews() async {

    try{
      Response response = await http.get(Uri.parse(allNewsApi));
      if(response.statusCode == 200){
        Map<String,dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];
        List<NewsModel> articalsList = body.map((item) => NewsModel.fromJson(item)).toList();
        return articalsList;
      }else{
        return [];
      }
    }
    catch(e){
      return [];

    }
  }
  Future<List<NewsModel>> getBreakingNews() async {

    try{
      Response response = await http.get(Uri.parse(breakingNews));
      if(response.statusCode == 200){
        Map<String,dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];
        List<NewsModel> articalsList = body.map((item) => NewsModel.fromJson(item)).toList();
        return articalsList;
      }else{
        return [];
      }
    }
    catch(e){
      return [];

    }
  }

}