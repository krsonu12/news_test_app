import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../stores/news_store.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final newsStore = GetIt.I<NewsStore>();

  @override
  void initState() {
    newsStore.fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Observer(
              builder: (_) {
                if (newsStore.articles == null) {
                  return Container();
                }

                if (newsStore.isLoading) {
                  return const CircularProgressIndicator();
                } else if (newsStore.articles!.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: newsStore.articles!.length,
                      itemBuilder: (context, index) {
                        final article = newsStore.articles![index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Image.network(
                              "${article.urlToImage}",
                              width: 80,
                              height: 180,
                              fit: BoxFit.fill,
                              errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.image),
                            ),
                            title: Text("${article.title}"),
                            subtitle: Text("${article.description}"),
                            onTap: () {
                              _openUrl(context, article.url);
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Text('No news available.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openUrl(BuildContext context, String? url) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Open Article'),
        content: const Text('Do you want to open this article?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // _launchUrl(url);
            },
            child: const Text('Open'),
          ),
        ],
      ),
    );
  }
}
