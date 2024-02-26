import 'package:flutter/material.dart';
import 'package:news_app/all_news.dart';
import 'package:news_app/breaking_news.dart';

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Presentations"),
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: "Breaking News"),
              Tab(text: "All News"),
      
            ],),
        ),

        body: TabBarView(
          children: [
            BreakingNews(),
            AllNews(),
          ],

        ),
      ),
    );
  }
}
