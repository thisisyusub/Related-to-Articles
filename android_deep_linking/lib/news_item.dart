import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'news.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push('/news/${news.id}');
      },
      leading: CircleAvatar(
        child: Text(news.id.toString()),
      ),
      title: Text(news.title),
      subtitle: Text(news.body),
    );
  }
}
