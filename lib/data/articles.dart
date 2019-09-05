import 'constants.dart';
export 'constants.dart';



enum Category {
  design,
  tech,
  people,
  places,
}

Map<Category, String> categories = {
  Category.design : 'DESIGN',
  Category.people : 'PEOPLE',
  Category.tech : 'TECH',
  Category.places : 'PLACES',
};



class Article {
  final String cover;
  final String author;
  final String authorImage;
  final String title;
  final String time;
  final String body;
  final int likes;
  final bool saved;
  final Category category;
  final List<String> gallery;
  final String url;

  Article({
    this.cover,
    this.author,
    this.authorImage,
    this.time,
    this.title,
    this.body,
    this.likes,
    this.saved,
    this.category,
    this.gallery,
    this.url
  });
}




List<Article> articles = [

  Article(
    url: 'chalewote-festival',
    author : 'Travels Ghana',
    cover : '$chalewote/2.jpg',
    title : 'The Colourful Chalewote Festival',
    authorImage : '$avatars/travels.jpg',
    time : '4 hours ago',
    category: Category.people,
    saved: true,
    body: 'The Chale Wote Street Art Festival also known as Chale Wote is an alternative platform that brings art, music, dance and performance out into the streets. The festival targets exchanges between scores of local and international artists and patrons by creating and appreciating art together.\n\nSince 2011, CHALE WOTE has included street painting, graffiti murals, photography, theater, spoken word, interactive art installations, live street performances, extreme sports, film shows, a fashion parade, a music block party, recyclable design workshops and much more. It is the first to be organized in Accra, Ghana and has inspired similar events across the country.\n\nCheck out travelsghana.com or check out @tr_vls for more interesting places in Ghana.',
    gallery: [
      '$chalewote/1.jpg',
      '$chalewote/3.jpg',
      '$chalewote/4.jpg',
      '$chalewote/5.jpg',
      '$chalewote/6.jpg'
    ]
  ),
  
  Article(
    url: 'flutter',
    author : 'Leslie Arkorful',
    cover : '$flutter/ui.jpg',
    title : 'Bringing UIs to life in Flutter.',
    authorImage : '$avatars/les.jpg',
    time : '3 hours ago',
    category: Category.tech,
    saved: true,
    body: 'So I picked this design from Dribbble and quickly brought it to life in Flutter. I loved the whole experience! and guess what? I\'ll be doing more of these as time goes on.\nLooking forward to hearing your feedback soon. Connect with me everywhere on the internet @lesliearkorful.\n\nThis UI design was made by Adrash Goldar (AdarshGo) for Fireart Studio. You may check out those pages on Dribbble.',
    gallery: [
      '$flutter/ui.jpg',
    ]
  ),

  Article(
    url: 'deon-recreational-centre',
    author : 'Travels Ghana',
    cover : '$deon/1.jpg',
    title : 'The Future of Recreation is here!',
    authorImage : '$avatars/travels.jpg',
    time : '1 hour ago',
    category: Category.places,
    saved: false,
    body: 'We had a wild adventure at Deon Recreational Centre hidden away somewhere in Lashibi betwixt Accra and Tema. It’s confusing, we know! We had a ton of fun at Deon Recreational Centre, so much so we went there two Sundays in a row! actually three. 🙂 DRC features awesome go-karts, quad bikes, dune buggys or…\n\nCheck out travelsghana.com or check out @tr_vls for more interesting places in Ghana.',
    gallery: [
      '$deon/2.jpeg',
      '$deon/3.jpg',
      '$deon/4.jpg',
      '$deon/5.jpeg',
      '$deon/6.jpg',
      '$deon/7.jpg',
    ]
  ),
  
];