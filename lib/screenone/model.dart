

class PhotoList {
  List<Photo> photos;

  PhotoList({this.photos});

  factory PhotoList.fromjson(List<dynamic> json) {

    List<Photo> photos = new List<Photo>();
    photos = json.map((i)=>Photo.fromJson(i)).toList();

    return PhotoList(
      photos: photos
    );
  }
}

class Photo{
  String color;
  String likes;
  User user;
  String alt_description;
  Url url;

  Photo({
    this.likes,
    this.user,
    this.color,
    this.alt_description,
    this.url,
  }) ;

  factory Photo.fromJson(Map<String, dynamic> json){
    return new Photo(
      color: json['color'].toString(),
      alt_description: json['alt_description'],
      url: Url.fromjson(json['urls']),
      user: User.fromjson(json['user']),
      likes: json['likes'].toString(),

    );
  }

}

class Url {
  String regular;

  Url({this.regular});

  factory Url.fromjson(Map<String, dynamic> json) {
    return Url(
        regular: json['regular']
    );
  }
}

class User {
  String username;

  User({this.username});

  factory User.fromjson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
    );
  }
}