class Waifu {
  final String id;
  final String url;
  final String description;
  const Waifu({
    required this.id,
    required this.url,
    required this.description,
  });

  Waifu.fromJson(Map<String, dynamic> json)
      : this(
          id: json['image_id'].toString(),
          url: json['url'],
          description: json['tags'][0]['description'],
        );
  Waifu.fromMap(Map<String, dynamic> map)
      : this(
          id: map['id'],
          url: map['url'],
          description: map['description'],
        );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'description': description,
    };
  }
}
