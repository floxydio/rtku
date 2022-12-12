import 'package:dio/dio.dart';
import 'package:rtku/constant/api.constant.dart';
import 'package:rtku/model/news.model.dart';

class NewsRepository {
  static Future<List<Articles>> articleList() async {
    var response = await Dio().get("https://newsapi.org/v2/top-headlines?country=id&apiKey=${ApiService.apiKey}");
    List responseList = response.data["articles"];
    return responseList.map((e) => Articles.fromJson(e)).toList();
  }
}
