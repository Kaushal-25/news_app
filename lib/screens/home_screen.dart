import 'package:flutter/material.dart';
import 'package:news_app/controller/fetch_news.dart';
import 'package:news_app/model/newsArt.dart';
import 'package:news_app/screens/login_screen.dart';
import 'package:news_app/view/news_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

   bool isLoading = true;

    NewsArt?  newsArt  ;


  Future<void> GetNews() async {
    newsArt = await FetchNews.fetchnews();
    print(newsArt?.newsCnt );
    setState(() {
       isLoading = false;
    });
  }
  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen(),));
          },
              child: Text("Log Out",style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.black),) )
        ],
      ),
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            GetNews();
          },
          itemBuilder: (context , index){

            return
              isLoading ? Center(child: CircularProgressIndicator(),) :
              NewsContainer(
                imgUrl: newsArt!.imgUrl,
                newsHead: newsArt!.newsHead,
                newsCnt: newsArt!.newsCnt,
                newsDes: newsArt!.newsDes,
                newsUrl: newsArt!.newsUrl);
          }),
    );
  }
}
