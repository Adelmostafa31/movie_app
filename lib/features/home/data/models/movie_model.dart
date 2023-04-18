class movie_model {
  String? image_url;
  bool? isAuthorized;
  String? overview;
  String? title;
  String? vote_count;
  String? youtube_url;

  movie_model({
    required this.image_url,
    required this.isAuthorized,
    required this.overview,
    required this.title,
    required this.vote_count,
    required this.youtube_url,
  });

  movie_model.fromjson(Map<String, dynamic> json) {
    image_url = json['image_url'];
    isAuthorized = json['isAuthorized'];
    overview = json['overview'];
    title = json['title'];
    vote_count = json['vote_count'];
    youtube_url = json['youtube_url'];
  }

  Map<String, dynamic?>? toMap() {
    return {
      'image_url': image_url,
      'isAuthorized': isAuthorized,
      'overview': overview,
      'title': title,
      'vote_count': vote_count,
      'youtube_url': youtube_url,
    };
  }
}
