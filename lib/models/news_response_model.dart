import 'package:freezed_annotation/freezed_annotation.dart';
import 'article_model.dart';

part 'news_response_model.freezed.dart';
part 'news_response_model.g.dart';

@freezed
class NewsResponse with _$NewsResponse {
  const factory NewsResponse({
    List<Article>? articles, // List of articles fetched from the API
  }) = _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}
