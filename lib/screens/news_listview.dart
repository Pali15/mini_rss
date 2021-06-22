import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_rss/costum_classes/news.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {


  List<News> news = [
    News("2021-05-14 17:00:34", "Cím 1", "Összegzés 1", "Content 1",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:30", "Cím 2", "Összegzés 2", "Content 2",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:40", "Cím 3", "Összegzés 3", "Content 3",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:37", "Cím 4", "Összegzés 4", "Content 4",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:31", "Cím 5", "Összegzés 5", "Content 5",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:34", "Cím 6", "Összegzés 6", "Content 6",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:34", "Cím 1", "Összegzés 1", "Content 1",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:30", "Cím 2", "Összegzés 2", "Content 2",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:40", "Cím 3", "Összegzés 3", "Content 3",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:37", "Cím 4", "Összegzés 4", "Content 4",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:31", "Cím 5", "Összegzés 5", "Content 5",
        'https://picsum.photos/250?image=9'),
    News("2021-05-14 17:00:34", "Cím 6", "Összegzés 6", "Content 6",
        'https://picsum.photos/250?image=9')
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news.sort((a, b) => a.publicationTime.compareTo(b.publicationTime));
  }

  void openNews(News n){
    Navigator.pushNamed(context, '/detailed', arguments: n);
    setState(() {
      news.remove(n);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(3, 0, 3, 7),
                child: GestureDetector(
                  onTap: () => {openNews(news[index])},
                  child: Card(//every item will be a card

                    child: Row(//a card contains two row
                      children: [
                        Padding(//in the first raw will be the index picture
                          padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                          child: Image.network(
                            news[index].indexPicture,
                            width: 70,
                            height: 70,
                          ),
                        ),
                        Column(//in the second row will be tha title, summaray and publication date in 3 columns
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news[index].title,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              news[index].summary,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              news[index].getTime(),
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            )
                          ],
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