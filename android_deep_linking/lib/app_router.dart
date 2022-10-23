import 'package:go_router/go_router.dart';

import 'news_list_page.dart';
import 'news_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NewsListPage(),
    ),
    GoRoute(
      path: '/news/:id',
      builder: (context, state) => NewsPage(
        id: state.params['id']!,
      ),
    ),
  ],
);
