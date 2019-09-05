import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import '../../data/articles.dart';


class ArticlePage extends StatefulWidget {
  static final String routePrefix = '/article';
  final Article article;
  ArticlePage({ this.article });

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final ScrollController listController = ScrollController();

  bool topReached = false;
  bool isSaved = false;

  IconData saveIcon = Icons.bookmark_border;
  IconData savedIcon = Icons.bookmark;
  IconData backIcon = Icons.arrow_back_ios;


/*
  @override
  void initState() {
    
    listController.addListener(() {
      
      setState(() {
        topReached = (listController.offset > 225)
                      ? true
                      : false;
      });
    });
    super.initState();
  }


  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }
*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
              
          Container(
            height: (MediaQuery.of(context).size.height / 2) + 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.article.cover),
                fit: BoxFit.cover
              ), 
            ),
          ),


          Align(
            alignment: Alignment.topCenter,
            child: ListView(
              controller: listController,
              children: <Widget>[

                SizedBox( height: (MediaQuery.of(context).size.height/2) - 30 ),

                Container(
                  padding: EdgeInsets.fromLTRB(homePadding, 50, homePadding, 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24)
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -3),
                        color: Colors.black12,
                        blurRadius: 8
                      )
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(categories[widget.article.category],
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox( height: 15 ),

                      Text(widget.article.title,
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),

                      SizedBox( height: 15 ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(widget.article.authorImage,
                              width: 25,
                              height: 25,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('${widget.article.author}   |  ${widget.article.time}',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          )
                        ],
                      ),

                      SizedBox( height: 20 ),

                      Text(widget.article.body,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        )
                      ),
                    

                    ],
                  ),
                ),

                ...widget.article.gallery.map((image) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.white,
                    child: Image.asset(image),
                  );
                }).toList(),
              ],
            ),
          ),


          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  IconButton(
                    iconSize: 40,
                    onPressed: () => Navigator.pop(context),
                    color: topReached ? Colors.pink : Colors.white,
                    icon: Icon(CupertinoIcons.back),
                  ),
                   
                  IconButton(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(right: 20),
                    iconSize: 40,
                    icon: Icon(
                      isSaved ? saveIcon : savedIcon,
                      color: topReached ? Colors.pink : Colors.white
                    ),
                    onPressed: () => setState(() => isSaved = !isSaved),
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}