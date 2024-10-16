import 'package:get_it/get_it.dart';
import 'stores/news_store.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<NewsStore>(NewsStore());
}
