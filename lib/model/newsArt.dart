class NewsArt {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

  NewsArt({

    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsCnt,
    required this.newsUrl

  });

 static NewsArt fromAPItoApp(Map<String, dynamic> article) {
    return NewsArt(imgUrl: article["urlToImage"] ??
        "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg?q=10&h=200",
        newsHead: article["title"] ?? "--",
        newsDes: article["description"] ?? "--",
        newsCnt: article["content"] ?? "------------------------",
        newsUrl: article["url"] ?? "https://www.livemint.com/news/india/explained-digital-personal-data-protection-bill-11691063664201.html");
  }
}