import 'package:flutter/material.dart';
import 'package:news_app/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

  NewsContainer( {super.key ,
  required this.imgUrl,
  required this.newsHead,
  required this.newsDes,
    required this.newsCnt,
  required this.newsUrl
});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
        //   FadeInImage.assetNetwork(
        //   height: 300,
        //     width: MediaQuery.of(context).size.width,
        //     fit: BoxFit.cover,
        //   placeholder: ,
        //   image: imgUrl,
        // ),
          Image.network( height: 300, width: MediaQuery.of(context).size.width, fit : BoxFit.cover,
              imgUrl),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text(newsHead, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text(
                    newsCnt.length >100 ? newsCnt.substring(0,100) :
                    "${newsCnt.toString().substring(0, newsCnt.length-15)}...",
                    style: TextStyle(fontSize: 12, color: Colors.green),),
                  SizedBox(height: 10,),
                  Text(newsDes,style: TextStyle(fontSize: 16),)
                ],
              ),
            ),
          ),
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailViewScreen(newsUrl: newsUrl),));
                },
                    child: Text("Read More") ),
              ),
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
