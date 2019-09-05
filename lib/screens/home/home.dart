import 'package:flutter/material.dart';
import '../../data/articles.dart';
import '../article/article.dart';
import 'home-widgets.dart';



class BlogHome extends StatelessWidget {

  static final Map<String, Article> articleRoutes = {
    'chalewote-festival' : articles[0],
    'flutter' : articles[1],
    'deon-recreational-centre' : articles[2],
  };

  static Map<String, Widget Function(BuildContext)> buildRoutes() {
    // BUILD ROUTES FOR THE BLOG SHOWCASE
    Map<String, Widget Function(BuildContext)> blogArticleRoutes = {};
    articleRoutes.forEach((route, article) {
      Map<String, Widget Function(BuildContext)> buildMap = {
        '${ArticlePage.routePrefix}/$route' : (BuildContext context) => ArticlePage(article: article)
      };
      blogArticleRoutes.addEntries(buildMap.entries);
    });

    return blogArticleRoutes;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Header(),
          Carousel(),
          SectionHeader(
            title: 'Popular',
            secondary: 'Show all'
          ),
          
          SectionItem(
            article: articles[1],
          ),
              
          SectionItem(
            article: articles[0],
          ),

          SectionItem(
            article: articles[2],
          ),
        ],
      ),
    );
  }
}