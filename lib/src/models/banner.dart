List<Banner> listBannerFromMap(List<dynamic> json) {
  return List<Banner>.from(json.map((item) => Banner.fromMap(item)));
}

class Banner {
  Banner({
    required this.id,
    required this.name,
    required this.isActive,
    required this.images,
  });

  String id;
  String name;
  bool isActive;
  List<ImageBanner>? images;

  factory Banner.fromMap(Map<String, dynamic> json) => Banner(
        id: json['_id'],
        name: json['name'],
        isActive: json['is_active'],
        images: List<ImageBanner>.from(
            json["images"].map((image) => ImageBanner.fromMap(image))),
      );
}

class ImageBanner {
  ImageBanner({
    required this.top,
    required this.middle,
    required this.detail,
    required this.lang,
  });
  String? top;
  String? middle;
  String? detail;
  String? lang;
  factory ImageBanner.fromMap(Map<String, dynamic> json) => ImageBanner(
        top: json["top"],
        middle: json["middle"],
        detail: json["detail"],
        lang: json["lang"],
      );
}
