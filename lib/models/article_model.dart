import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    String? title, // Nullable title
    String? description, // Nullable description
    String? url, // Nullable URL
    String? urlToImage, // Nullable image URL
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
