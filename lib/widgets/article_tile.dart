import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/article.dart';

class ArticleTile extends StatelessWidget {
  final Article article;

  const ArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(5),
      child: ListTile(
        leading: Image.network(article.urlToImage, width: 80, fit: BoxFit.cover),
        title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Text(article.description, maxLines: 3, overflow: TextOverflow.ellipsis),
        onTap: () async {
          final uri = Uri.parse(article.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
      ),
    );
  }
}
