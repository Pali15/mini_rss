import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//represents a news
class News{
  late DateTime publicationTime;//time of the publication
  late String title;//title of the news
  late String summary;//summary of the news
  late String content;//content off the news
  late String indexPicture;//URL for the index picture
  late String newsPicture;
  late String contentLink;


  News(String publication, String title, String summary, String contentLink, String indexpicture){
    this.title=title;
    this.summary=summary;
    this.contentLink=contentLink;
    this.indexPicture=indexpicture;
    publicationTime=DateTime.parse(publication);
  }

  String getTime(){
    String month=publicationTime.month<10?'0${publicationTime.month}':publicationTime.month.toString();
    String day=publicationTime.day<10?'0${publicationTime.day}':publicationTime.day.toString();
    String hour=publicationTime.hour<10?'0${publicationTime.hour}':publicationTime.hour.toString();
    String minute=publicationTime.minute<10?'0${publicationTime.minute}':publicationTime.minute.toString();
    String second=publicationTime.second<10?'0${publicationTime.second}':publicationTime.second.toString();

    return '${publicationTime.year}-$month-$day $hour:$minute:$second';
  }


  /*
  returns the indexpicture
  double width_-width of the picture
  double height_-height of the picture
   */
  Widget getPicture(double width_, double height_){
    if(indexPicture=="none"){//if it doesnt have a link it will return an empty container
      return Container();
    }
    return Image.network(//if it has a link it will return a network image
      indexPicture,
      width: width_,
      height: height_,
      fit: BoxFit.fill,
    );
  }
}