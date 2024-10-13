// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewsStore on _NewsStore, Store {
  late final _$articlesAtom =
      Atom(name: '_NewsStore.articles', context: context);

  @override
  List<Article>? get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(List<Article>? value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_NewsStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchNewsAsyncAction =
      AsyncAction('_NewsStore.fetchNews', context: context);

  @override
  Future<List<Article>?> fetchNews() {
    return _$fetchNewsAsyncAction.run(() => super.fetchNews());
  }

  @override
  String toString() {
    return '''
articles: ${articles},
isLoading: ${isLoading}
    ''';
  }
}
