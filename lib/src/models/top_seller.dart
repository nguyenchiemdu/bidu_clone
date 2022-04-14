List<TopSeller> listTopSellerFromMap(List<dynamic> json) {
  return List<TopSeller>.from(json.map((item) => TopSeller.fromMap(item)));
}

class TopSeller {
  TopSeller(
      {required this.id,
      required this.userName,
      required this.changeType,
      required this.changeValue,
      required this.ranking,
      required this.avatar,
      required this.avarageRating,
      required this.followCount});

  String id;
  String userName;
  String changeType;
  num changeValue;
  int ranking;
  String avatar;
  num? avarageRating;
  num followCount;

  factory TopSeller.fromMap(Map<String, dynamic> json) => TopSeller(
      id: json['_id'],
      userName: json['shop']['user']['userName'],
      changeType: json['change']['type'],
      changeValue: json['change']['value'],
      ranking: json['shop']['ranking_today'],
      avatar: json['shop']['user']['avatar'],
      avarageRating: json['shop']['avg_rating'],
      followCount: json['shop']['user']['follow_count']);
}
