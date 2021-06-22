import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_rss/costum_classes/news.dart';
import 'package:mini_rss/backend/html_to_content.dart';

class NewsDetails extends StatelessWidget {
  late News news;

  @override
  Widget build(BuildContext context) {

    news = ModalRoute.of(context)!.settings.arguments as News;//getting the news to show

    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage(
            'assets/index.png',
          ),
          width: 500,
          height: 150,
        ),
        backgroundColor: Colors.grey[400],
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 3.0, color: Colors.black),
              left: BorderSide(width: 3.0, color:Colors.black),
              right: BorderSide(width: 3.0, color: Colors.black),
              bottom: BorderSide(width: 3.0, color: Colors.black),
            ),

          ),
          child: Expanded(
            child: Column(
              children: [
                HtmlToContent()
              ],
            ),
          )
        ),/*Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: news.getPicture(500, 200),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Text(
                    news.getTime(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Text(
                    news.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: /*HtmlToContent()*/Text("asd")
                ),
              )
            ],
          ),
        ),
      ),*/
      )
    );
  }
}



