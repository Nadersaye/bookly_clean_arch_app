class ImageLinksModel {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinksModel({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinksModel.fromJson(Map<String, dynamic> json) {
    return ImageLinksModel(
        smallThumbnail: json['smallThumbnail'], thumbnail: json['thumbnail']);
  }
}
