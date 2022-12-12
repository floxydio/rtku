import 'package:get/get.dart';
import 'package:rtku/model/news.model.dart';
import 'package:rtku/repository/news.repository.dart';

class NewsController extends GetxController {
  var article = <Articles>[].obs;

  @override
  void onInit() {
    articleList();
    super.onInit();
  }

  void articleList() async {
    var fetchNewsArticle = await NewsRepository.articleList();
    article.addAll(fetchNewsArticle);
  }
}
