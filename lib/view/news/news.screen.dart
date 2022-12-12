import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtku/controller/news.controller.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final controller = Get.put(NewsController());

  void runningURL(url) async {
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text("Berita Hari Ini", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20,),
            GetX<NewsController>(
              builder: (controller) {
                return controller.article.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.article.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: controller.article[index].urlToImage == null
                                ? const Text("IMG Not Found")
                                : Image.network(
                                    controller.article[index].urlToImage.toString(),
                                    width: 100),
                            title: InkWell(
                                onTap: () {
                                  var uriParse = Uri.parse(
                                      controller.article[index].url.toString());

                                  runningURL(uriParse);
                                },
                                child: Text(
                                    controller.article[index].title.toString())),
                            subtitle: Text(
                                controller.article[index].description.toString()),
                          );
                        }));
              },
            ),
            const SizedBox(height: 30,),
          ],
        )),
      ),
    );
  }
}
