import 'package:bookly_clean_arch_app/Features/home/data/models/image_links_model.dart';

class VolumeInfoModel {
  final String? title;
  final List<String>? authors;
  final ImageLinksModel? imageLinks;

  VolumeInfoModel(
      {required this.title, required this.authors, required this.imageLinks});

  factory VolumeInfoModel.fromJson(Map<String, dynamic> json) {
    return VolumeInfoModel(
        title: json['title'] as String?,
        authors: (json['authors'] as List<dynamic>)
            .map((author) => author as String)
            .toList(),
        imageLinks: json['imageLinks'] == null
            ? null
            : ImageLinksModel.fromJson(
                json['imageLinks'] as Map<String, dynamic>));
  }
}
