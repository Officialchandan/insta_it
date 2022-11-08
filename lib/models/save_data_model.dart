import 'dart:convert';

class SaveDataModel {
  SaveDataModel({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.categories,
    this.thumbnail,
    this.language,
    this.previewLink,
  });

  String? title;
  String? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  String? pageCount;
  String? categories;
  String? thumbnail;
  String? language;
  String? previewLink;

  factory SaveDataModel.fromJson(String str) =>
      SaveDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaveDataModel.fromMap(Map<String, dynamic> json) => SaveDataModel(
        title: json["title"] == null ? null : json["title"],
        authors: json["authors"] == null ? [] : json["authors"],
        publisher: json["publisher"] == null ? null : json["publisher"],
        publishedDate:
            json["publishedDate"] == null ? null : json["publishedDate"],
        description: json["description"] == null ? null : json["description"],
        pageCount: json["pageCount"] == null ? '' : json["pageCount"],
        categories: json["categories"] == null ? [] : json["categories"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        language: json["language"] == null ? null : json["language"],
        previewLink: json["previewLink"] == null ? null : json["previewLink"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "authors": authors == null ? null : authors,
        "publisher": publisher == null ? null : publisher,
        "publishedDate": publishedDate == null ? null : publishedDate,
        "description": description == null ? null : description,
        "pageCount": pageCount == null ? null : pageCount,
        "categories": categories == null ? null : categories,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "language": language == null ? null : language,
        "previewLink": previewLink == null ? null : previewLink,
      };
}
