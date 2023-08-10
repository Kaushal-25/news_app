//https://newsapi.org/v2/top-headlines/sources?apiKey=2098b41e3f984edcac87a16254e37b96

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news_app/model/newsArt.dart';

class FetchNews {
 static List sourcesId = [
    "abc-news",

    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",

    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",

    "national-geographic",

    "news24",
    "new-scientist",

    "new-york-magazine",
    "next-big-future",

    "techcrunch",
    "techradar",

    "the-hindu",
  ];
  static Future<NewsArt> fetchnews()  async {
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    print(sourceID);

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=037e15ee90834a3c80fe8b512c89f06e"
    ),);
    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
    // print(articles);
    print("****************");

    final _Newrandom = new Random();
    var myArticle = articles[_Newrandom.nextInt(articles.length)];
    print(myArticle);
    print("****************");

   return NewsArt.fromAPItoApp(myArticle);
  }
}