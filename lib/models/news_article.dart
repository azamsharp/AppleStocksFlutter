
class NewsArticle {

    final String title; 
    final String publication; 
    final String imageURL; 

    NewsArticle({this.title, this.publication, this.imageURL});

    factory NewsArticle.fromJson(Map<String, dynamic> json) {
      return NewsArticle(
        title: json["title"], 
        publication: json["publication"], 
        imageURL: json["imageURL"]
      );
    }

}