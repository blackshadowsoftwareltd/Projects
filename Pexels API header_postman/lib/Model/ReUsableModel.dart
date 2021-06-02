 
class  ReUsableModel {
  ReUsableModel({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
  });

  int page;
  int perPage;
  List<TrendingPhotos> photos;
  int totalResults;
  String nextPage;

  factory ReUsableModel.fromJson(Map<String, dynamic> json) => ReUsableModel(
        page: json["page"],
        perPage: json["per_page"],
        photos: List<TrendingPhotos>.from(
            json["photos"].map((x) => TrendingPhotos.fromJson(x))),
        totalResults: json["total_results"],
        nextPage: json["next_page"],
      );
}

class TrendingPhotos {
  TrendingPhotos({
    this.id,
    this.photographer,
    this.photographerUrl,
    this.src,
  });

  int id;
  String photographer;
  String photographerUrl;
  TrendingSrc src;

  factory TrendingPhotos.fromJson(Map<String, dynamic> json) => TrendingPhotos(
        id: json["id"],
        photographer: json["photographer"],
        photographerUrl: json["photographer_url"],
        src: TrendingSrc.fromJson(json["src"]),
      );
}

class TrendingSrc {
  TrendingSrc({
    this.original,
    this.small,
    this.portrait,
  });

  String original;
  String small;
  String portrait;

  factory TrendingSrc.fromJson(Map<String, dynamic> json) => TrendingSrc(
        original: json["original"],
        small: json["small"],
        portrait: json["portrait"],
      );
}
