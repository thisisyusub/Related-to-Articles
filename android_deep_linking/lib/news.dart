class News {
  final String id;
  final String title;
  final String body;

  News({
    required this.id,
    required this.title,
    required this.body,
  });
}

final mockNews = [
  News(
    id: "1",
    title: 'News 1',
    body: 'News 1 body',
  ),
  News(
    id: "2",
    title: 'News 2',
    body: 'News 2 body',
  ),
  News(
    id: "3",
    title: 'News 3',
    body: 'News 3 body',
  ),
];
