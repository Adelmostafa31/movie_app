class profile_model {
  String? name;
  String? email;
  String? uid;
  String? image;

  profile_model({
    required this.email,
    required this.name,
    required this.uid,
    required this.image
  });

  profile_model.fromjson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    uid = json['uid'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'email': email,
      'uid': uid,
      'image':image
    };
  }
}