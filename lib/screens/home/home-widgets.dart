import 'package:flutter/material.dart';
import '../../data/articles.dart';
import '../../screens/article/article.dart';



class Header extends StatelessWidget {
  static final DateTime today = DateTime.now();
  final String time = '${months[today.month]} ${today.day}'.toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(homePadding, 30, homePadding, 30 ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(time,
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 16,
                )
              ),

              SizedBox( height: 5 ),

              Text('Today',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
              )
            ],
          ),

          Expanded(
            child: Container(),
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset('$avatars/les.jpg', width: 50 ),
          ),
        ],
      )
    );
  }
}



class Carousel extends StatelessWidget {
  final pageController = PageController(
    viewportFraction: 0.9,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          Article data = articles[index];

          return Card(article: data);
        },
      ),
    );
  }
}




class Card extends StatelessWidget {
  final Article article;

  Card({
    @required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '${ArticlePage.routePrefix}/${article.url}');
      },
      child: Container(
        margin: EdgeInsets.all(6),
        width: MediaQuery.of(context).size.width ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(article.cover),
            fit: BoxFit.cover
          ),
        ),
        child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
            fit: StackFit.loose,
            children: <Widget>[

              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 250,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black45
                      ]
                    )
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text('${article.title}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),

                        SizedBox( height: 15 ),

                        Row(
                          children: <Widget>[

                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset('${article.authorImage}',
                                width: 44,
                                height: 44,
                              )
                            ),

                            SizedBox( width: 12 ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text('${article.author}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.4,
                                  ),
                                ),

                                SizedBox( height: 5),

                                Text('${article.time}',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.85),
                                    fontSize: 14
                                  )
                                )
                              ]
                            )
                          ]
                        )
                      ]
                    )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}




class SectionHeader extends StatelessWidget {
  final String title;
  final String secondary;

  SectionHeader({
    @required this.title,
    @required this.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(homePadding, 30, homePadding, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          Text('$title',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500
            ),
          ),

          Text('$secondary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.pink
            ),
          ),
        ],
      ),
    );
  }
}


class SectionItem extends StatelessWidget {
  final Article article;

  SectionItem({
    @required this.article,
  });

  @override
  Widget build(BuildContext context) {

    return FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, '${ArticlePage.routePrefix}/${article.url}');
      },
      splashColor: Colors.pink.withOpacity(0.15),
      highlightColor: Colors.pink.withOpacity(0.08),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 15, homePadding, 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(article.cover,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              )
            ),

            SizedBox( width: 15 ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: <Widget>[

                  Text('${categories[article.category]}',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 14,
                    ),
                  ),

                  SizedBox( height : 5 ),
                  
                  Text('${article.title}',
                  softWrap: true,
                    style: TextStyle(
                      fontSize: 18
                    )
                  ),
                ]
              )
            ),
          ]
        ),
      )
    );
  }
}