import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'injection_container.dart';
import 'news.dart';
import 'news_item.dart';

class NewsListPage extends ConsumerStatefulWidget {
  const NewsListPage({super.key});

  @override
  ConsumerState<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends ConsumerState<NewsListPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(dynamicLinkNotifierProvider.notifier).getInitialLink();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(dynamicLinkNotifierProvider, (_, newPath) {
      if (newPath != null) {
        context.push(newPath);
        ref.read(dynamicLinkNotifierProvider.notifier).clear();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return NewsItem(news: mockNews[index]);
          },
          separatorBuilder: (_, __) {
            return const SizedBox(height: 8);
          },
          itemCount: mockNews.length,
        ),
      ),
    );
  }
}
