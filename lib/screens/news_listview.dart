import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_rss/backend/html_converter.dart';
import 'package:mini_rss/costum_classes/news.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:webfeed/webfeed.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {

  //list for the news
  List<News> news=[];

  //opens a news and deletes it
  void openNews(News n) async {
    //getting the content from the news
    HtmlConverter c=new HtmlConverter();
    //setting the content
    n.content=await c.getData(n.contentLink);

    Navigator.pushNamed(context, '/detailed', arguments: n);//open

    setState(() {//delete
      news.remove(n);
    });
  }

  @override
  Widget build(BuildContext context) {

    //get the news list
   setState(() {
     final t=ModalRoute.of(context)!.settings.arguments as List<News>;
     news=t;
   });

    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Image(
          image: AssetImage(//index logo
            'assets/index.png',
          ),
          width: 500,
          height: 150,
        ),
        backgroundColor: Colors.grey[400],
        centerTitle: true,
      ),

      //making a listview for the news
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 3.0, color: Colors.black),
              left: BorderSide(width: 3.0, color:Colors.black),
              right: BorderSide(width: 3.0, color: Colors.black),
              bottom: BorderSide(width: 3.0, color: Colors.black),
            ),
          ),
          child: ListView.builder(//listview
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(3, 0, 3, 7),
                child: GestureDetector(
                  onTap: () => {openNews(news[index])},//opens the news
                  child: Card(//every item will be a card
                    child: Row(//a card contains two row
                      children: [
                        Padding(//in the first raw will be the index picture
                          padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
                          child: news[index].getPicture(90, 60),
                        ),
                        Flexible(//flexbox for the columns so it wont overflow
                          fit:FlexFit.tight,
                          child: SizedBox(
                            height: 75,
                            child: Column(//in the second row will be tha title, summaray and publication date in 3 columns
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(//title
                                  news[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                  maxLines: 1,
                                ),
                                SizedBox(height: 5,),
                                Text(//summary
                                  news[index].summary,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  maxLines: 1,
                                ),
                                SizedBox(height: 5,),
                                Text(//pulication date
                                  news[index].getTime(),
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),

    );
  }
}