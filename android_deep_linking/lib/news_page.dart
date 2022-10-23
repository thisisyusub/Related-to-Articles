import 'package:android_deep_linking/news.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _fetchNews(),
            builder: (context, snapshot) {
              if (!snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.title),
                    Text(snapshot.data!.body),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Future<News> _fetchNews() async {
    await Future.delayed(const Duration(seconds: 1));
    return mockNews.firstWhere((news) => news.id == id);
  }
}
