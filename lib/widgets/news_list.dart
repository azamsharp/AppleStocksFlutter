import 'package:flutter/material.dart';
import 'package:stocks_app_flutter/view_models/home_page_view_model.dart';


class NewsList extends StatelessWidget {

  final List<NewsArticleViewModel> articles;
  
  final Function onHeaderTapped;
  final Function(DragUpdateDetails) onDragUpdate; 
  
  NewsList({this.articles, this.onHeaderTapped, this.onDragUpdate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: onHeaderTapped,
          onVerticalDragUpdate: onDragUpdate,
          child: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.grey[850]),
            padding: EdgeInsets.all(20),
            height: 800,
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Top Stories",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold)),
                  Text("From News",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  Divider(color: Colors.grey[400]),
                  Expanded(
                    child: ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.only(left: 0),
                          title: Wrap(children: <Widget>[
                            Text(articles[index].publication,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 24)),
                            Text(articles[index].title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold))
                          ]),
                          trailing: Image.network(articles[index].imageURL),
                        );
                      },
                    ),
                  )
                ])),
      ),
    );
  }
}
