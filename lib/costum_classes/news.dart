import 'package:intl/intl.dart';

//represents a news
class News{
  late DateTime publicationTime;//time of the publication
  late String title;//title of the news
  late String summary;//summary of the news
  late String content;//content off the news
  late String indexPicture;//URL for the index picture

  News(String publication, String title, String summary, String content, String indexpicture){
    this.title=title;
    this.summary=summary;
    this.content=content;
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
}