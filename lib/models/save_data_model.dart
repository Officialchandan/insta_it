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
    this.imageLinks,
    this.language,
    this.previewLink,
  });

  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  List<String>? categories;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;

  factory SaveDataModel.fromJson(String str) =>
      SaveDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaveDataModel.fromMap(Map<String, dynamic> json) => SaveDataModel(
        title: json["title"] == null ? null : json["title"],
        authors: json["authors"] == null
            ? null
            : List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"] == null ? null : json["publisher"],
        publishedDate:
            json["publishedDate"] == null ? null : json["publishedDate"],
        description: json["description"] == null ? null : json["description"],
        pageCount: json["pageCount"] == null ? null : json["pageCount"],
        categories: json["categories"] == null
            ? null
            : List<String>.from(json["categories"].map((x) => x)),
        imageLinks: json["imageLinks"] == null
            ? null
            : ImageLinks.fromMap(json["imageLinks"]),
        language: json["language"] == null ? null : json["language"],
        previewLink: json["previewLink"] == null ? null : json["previewLink"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "authors":
            authors == null ? null : List<dynamic>.from(authors!.map((x) => x)),
        "publisher": publisher == null ? null : publisher,
        "publishedDate": publishedDate == null ? null : publishedDate,
        "description": description == null ? null : description,
        "pageCount": pageCount == null ? null : pageCount,
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x)),
        "imageLinks": imageLinks == null ? null : imageLinks!.toMap(),
        "language": language == null ? null : language,
        "previewLink": previewLink == null ? null : previewLink,
      };
}

class ImageLinksOnSave {
  ImageLinksOnSave({
    this.smallThumbnail,
    this.thumbnail,
  });

  String? smallThumbnail;
  String? thumbnail;

  factory ImageLinksOnSave.fromJson(String str) =>
      ImageLinksOnSave.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageLinksOnSave.fromMap(Map<String, dynamic> json) =>
      ImageLinksOnSave(
        smallThumbnail:
            json["smallThumbnail"] == null ? null : json["smallThumbnail"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
      );
  Map<String, dynamic> toMap() => {
        "smallThumbnail": smallThumbnail == null ? null : smallThumbnail,
        "thumbnail": thumbnail == null ? null : thumbnail,
      };
}
