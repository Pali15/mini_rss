import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mini_rss/costum_classes/news.dart';

//reads the datas from the given link (rssLink) and makes a List<News> from the datas
class RssToNewsConverter{
  //list of the news
  late List<News> news=[];

  //link to the rss
  late String rssLink;

  //the rss feed
  RssFeed feed=new RssFeed();

  //ctor
  RssToNewsConverter(rssLink){
    this.rssLink=rssLink;
  }

  //sets the feed, and build the list
  Future<void> setFeed() async {
    await _getData().then((result) => {
        feed=result!
    });
    _buildList();
  }

  //builds a list from the rss feed
  void _buildList(){
    for(int i=0; i<feed.items!.length; i++){//iterating through the items
      final item=feed.items![i];

      //link to the indexpicture.
      //if the enclosure does not exist the link will be "none"
      String? link = item.enclosure == null ? "none" : item.enclosure!.url.toString();

      //creating the news
      News temp=News(item.pubDate.toString(), item.title.toString(),  item.description.toString(), item.link.toString(), link);

      //adding the news to the list
      news.add(temp);
    }
  }

  //returns the RssFeed if we could rea that or null if we weren't able to read the feed
  Future<RssFeed?> _getData() async {
    try{
      final client=http.Client();//creating the client
      http.Response response=await client.get(Uri.parse(rssLink));//getting the response from the page
      return RssFeed.parse(response.body);//returns the rss feed
    }catch(e){

    }

    return null;//returns null
  }
}