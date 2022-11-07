import 'package:meta/meta.dart';
import 'dart:convert';

class BooksData {
  BooksData({
    this.kind,
    this.totalItems,
    this.items,
  });

  String? kind;
  int? totalItems;
  List<Item>? items;

  factory BooksData.fromJson(String str) => BooksData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BooksData.fromMap(Map<String, dynamic> json) => BooksData(
        kind: json["kind"] == null ? null : json["kind"],
        totalItems: json["totalItems"] == null ? null : json["totalItems"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind == null ? null : kind,
        "totalItems": totalItems == null ? null : totalItems,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Item {
  Item({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        kind: json["kind"] == null ? null : json["kind"],
        id: json["id"] == null ? null : json["id"],
        etag: json["etag"] == null ? null : json["etag"],
        selfLink: json["selfLink"] == null ? null : json["selfLink"],
        volumeInfo: json["volumeInfo"] == null
            ? null
            : VolumeInfo.fromMap(json["volumeInfo"]),
        saleInfo: json["saleInfo"] == null
            ? null
            : SaleInfo.fromMap(json["saleInfo"]),
        accessInfo: json["accessInfo"] == null
            ? null
            : AccessInfo.fromMap(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null
            ? null
            : SearchInfo.fromMap(json["searchInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind == null ? null : kind,
        "id": id == null ? null : id,
        "etag": etag == null ? null : etag,
        "selfLink": selfLink == null ? null : selfLink,
        "volumeInfo": volumeInfo == null ? null : volumeInfo!.toMap(),
        "saleInfo": saleInfo == null ? null : saleInfo!.toMap(),
        "accessInfo": accessInfo == null ? null : accessInfo!.toMap(),
        "searchInfo": searchInfo == null ? null : searchInfo!.toMap(),
      };
}

class AccessInfo {
  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Epub? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  factory AccessInfo.fromJson(String str) =>
      AccessInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccessInfo.fromMap(Map<String, dynamic> json) => AccessInfo(
        country: json["country"] == null ? null : json["country"],
        viewability: json["viewability"] == null ? null : json["viewability"],
        embeddable: json["embeddable"] == null ? null : json["embeddable"],
        publicDomain:
            json["publicDomain"] == null ? null : json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"] == null
            ? null
            : json["textToSpeechPermission"],
        epub: json["epub"] == null ? null : Epub.fromMap(json["epub"]),
        pdf: json["pdf"] == null ? null : Epub.fromMap(json["pdf"]),
        webReaderLink:
            json["webReaderLink"] == null ? null : json["webReaderLink"],
        accessViewStatus:
            json["accessViewStatus"] == null ? null : json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"] == null
            ? null
            : json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toMap() => {
        "country": country == null ? null : country,
        "viewability": viewability == null ? null : viewability,
        "embeddable": embeddable == null ? null : embeddable,
        "publicDomain": publicDomain == null ? null : publicDomain,
        "textToSpeechPermission":
            textToSpeechPermission == null ? null : textToSpeechPermission,
        "epub": epub == null ? null : epub!.toMap(),
        "pdf": pdf == null ? null : pdf!.toMap(),
        "webReaderLink": webReaderLink == null ? null : webReaderLink,
        "accessViewStatus": accessViewStatus == null ? null : accessViewStatus,
        "quoteSharingAllowed":
            quoteSharingAllowed == null ? null : quoteSharingAllowed,
      };
}

class Epub {
  Epub({
    this.isAvailable,
    this.acsTokenLink,
  });

  bool? isAvailable;
  String? acsTokenLink;

  factory Epub.fromJson(String str) => Epub.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Epub.fromMap(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"] == null ? null : json["isAvailable"],
        acsTokenLink:
            json["acsTokenLink"] == null ? null : json["acsTokenLink"],
      );

  Map<String, dynamic> toMap() => {
        "isAvailable": isAvailable == null ? null : isAvailable,
        "acsTokenLink": acsTokenLink == null ? null : acsTokenLink,
      };
}

class SaleInfo {
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  String? country;
  String? saleability;
  bool? isEbook;
  SaleInfoListPrice? listPrice;
  SaleInfoListPrice? retailPrice;
  String? buyLink;
  List<Offer>? offers;

  factory SaleInfo.fromJson(String str) => SaleInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaleInfo.fromMap(Map<String, dynamic> json) => SaleInfo(
        country: json["country"] == null ? null : json["country"],
        saleability: json["saleability"] == null ? null : json["saleability"],
        isEbook: json["isEbook"] == null ? null : json["isEbook"],
        listPrice: json["listPrice"] == null
            ? null
            : SaleInfoListPrice.fromMap(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : SaleInfoListPrice.fromMap(json["retailPrice"]),
        buyLink: json["buyLink"] == null ? null : json["buyLink"],
        offers: json["offers"] == null
            ? null
            : List<Offer>.from(json["offers"].map((x) => Offer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "country": country == null ? null : country,
        "saleability": saleability == null ? null : saleability,
        "isEbook": isEbook == null ? null : isEbook,
        "listPrice": listPrice == null ? null : listPrice!.toMap(),
        "retailPrice": retailPrice == null ? null : retailPrice!.toMap(),
        "buyLink": buyLink == null ? null : buyLink,
        "offers": offers == null
            ? null
            : List<dynamic>.from(offers!.map((x) => x.toMap())),
      };
}

class SaleInfoListPrice {
  SaleInfoListPrice({
    this.amount,
    this.currencyCode,
  });

  double? amount;
  String? currencyCode;

  factory SaleInfoListPrice.fromJson(String str) =>
      SaleInfoListPrice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaleInfoListPrice.fromMap(Map<String, dynamic> json) =>
      SaleInfoListPrice(
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        currencyCode:
            json["currencyCode"] == null ? null : json["currencyCode"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount == null ? null : amount,
        "currencyCode": currencyCode == null ? null : currencyCode,
      };
}

class Offer {
  Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
  });

  int? finskyOfferType;
  OfferListPrice? listPrice;
  OfferListPrice? retailPrice;

  factory Offer.fromJson(String str) => Offer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Offer.fromMap(Map<String, dynamic> json) => Offer(
        finskyOfferType:
            json["finskyOfferType"] == null ? null : json["finskyOfferType"],
        listPrice: json["listPrice"] == null
            ? null
            : OfferListPrice.fromMap(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : OfferListPrice.fromMap(json["retailPrice"]),
      );

  Map<String, dynamic> toMap() => {
        "finskyOfferType": finskyOfferType == null ? null : finskyOfferType,
        "listPrice": listPrice == null ? null : listPrice!.toMap(),
        "retailPrice": retailPrice == null ? null : retailPrice!.toMap(),
      };
}

class OfferListPrice {
  OfferListPrice({
    this.amountInMicros,
    this.currencyCode,
  });

  int? amountInMicros;
  String? currencyCode;

  factory OfferListPrice.fromJson(String str) =>
      OfferListPrice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OfferListPrice.fromMap(Map<String, dynamic> json) => OfferListPrice(
        amountInMicros:
            json["amountInMicros"] == null ? null : json["amountInMicros"],
        currencyCode:
            json["currencyCode"] == null ? null : json["currencyCode"],
      );

  Map<String, dynamic> toMap() => {
        "amountInMicros": amountInMicros == null ? null : amountInMicros,
        "currencyCode": currencyCode == null ? null : currencyCode,
      };
}

class SearchInfo {
  SearchInfo({
    this.textSnippet,
  });

  String? textSnippet;

  factory SearchInfo.fromJson(String str) =>
      SearchInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchInfo.fromMap(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"] == null ? null : json["textSnippet"],
      );

  Map<String, dynamic> toMap() => {
        "textSnippet": textSnippet == null ? null : textSnippet,
      };
}

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifier>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  double? averageRating;
  int? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  factory VolumeInfo.fromJson(String str) =>
      VolumeInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VolumeInfo.fromMap(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"] == null ? null : json["title"],
        authors: json["authors"] == null
            ? null
            : List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"] == null ? null : json["publisher"],
        publishedDate:
            json["publishedDate"] == null ? null : json["publishedDate"],
        description: json["description"] == null ? null : json["description"],
        industryIdentifiers: json["industryIdentifiers"] == null
            ? null
            : List<IndustryIdentifier>.from(json["industryIdentifiers"]
                .map((x) => IndustryIdentifier.fromMap(x))),
        readingModes: json["readingModes"] == null
            ? null
            : ReadingModes.fromMap(json["readingModes"]),
        pageCount: json["pageCount"] == null ? null : json["pageCount"],
        printType: json["printType"] == null ? null : json["printType"],
        categories: json["categories"] == null
            ? null
            : List<String>.from(json["categories"].map((x) => x)),
        averageRating: json["averageRating"] == null
            ? 0.0
            : json["averageRating"].toDouble(),
        ratingsCount:
            json["ratingsCount"] == null ? null : json["ratingsCount"],
        maturityRating:
            json["maturityRating"] == null ? null : json["maturityRating"],
        allowAnonLogging:
            json["allowAnonLogging"] == null ? null : json["allowAnonLogging"],
        contentVersion:
            json["contentVersion"] == null ? null : json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null
            ? null
            : PanelizationSummary.fromMap(json["panelizationSummary"]),
        imageLinks: json["imageLinks"] == null
            ? null
            : ImageLinks.fromMap(json["imageLinks"]),
        language: json["language"] == null ? null : json["language"],
        previewLink: json["previewLink"] == null ? null : json["previewLink"],
        infoLink: json["infoLink"] == null ? null : json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"] == null
            ? null
            : json["canonicalVolumeLink"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "authors":
            authors == null ? null : List<dynamic>.from(authors!.map((x) => x)),
        "publisher": publisher == null ? null : publisher,
        "publishedDate": publishedDate == null ? null : publishedDate,
        "description": description == null ? null : description,
        "industryIdentifiers": industryIdentifiers == null
            ? null
            : List<dynamic>.from(industryIdentifiers!.map((x) => x.toMap())),
        "readingModes": readingModes == null ? null : readingModes!.toMap(),
        "pageCount": pageCount == null ? null : pageCount,
        "printType": printType == null ? null : printType,
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x)),
        "averageRating": averageRating == null ? null : averageRating,
        "ratingsCount": ratingsCount == null ? null : ratingsCount,
        "maturityRating": maturityRating == null ? null : maturityRating,
        "allowAnonLogging": allowAnonLogging == null ? null : allowAnonLogging,
        "contentVersion": contentVersion == null ? null : contentVersion,
        "panelizationSummary":
            panelizationSummary == null ? null : panelizationSummary!.toMap(),
        "imageLinks": imageLinks == null ? null : imageLinks!.toMap(),
        "language": language == null ? null : language,
        "previewLink": previewLink == null ? null : previewLink,
        "infoLink": infoLink == null ? null : infoLink,
        "canonicalVolumeLink":
            canonicalVolumeLink == null ? null : canonicalVolumeLink,
      };
}

class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  String? smallThumbnail;
  String? thumbnail;

  factory ImageLinks.fromJson(String str) =>
      ImageLinks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageLinks.fromMap(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail:
            json["smallThumbnail"] == null ? null : json["smallThumbnail"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "smallThumbnail": smallThumbnail == null ? null : smallThumbnail,
        "thumbnail": thumbnail == null ? null : thumbnail,
      };
}

class IndustryIdentifier {
  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  String? type;
  String? identifier;

  factory IndustryIdentifier.fromJson(String str) =>
      IndustryIdentifier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IndustryIdentifier.fromMap(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: json["type"] == null ? null : json["type"],
        identifier: json["identifier"] == null ? null : json["identifier"],
      );

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : type,
        "identifier": identifier == null ? null : identifier,
      };
}

class PanelizationSummary {
  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  factory PanelizationSummary.fromJson(String str) =>
      PanelizationSummary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PanelizationSummary.fromMap(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"] == null
            ? null
            : json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"] == null
            ? null
            : json["containsImageBubbles"],
      );

  Map<String, dynamic> toMap() => {
        "containsEpubBubbles":
            containsEpubBubbles == null ? null : containsEpubBubbles,
        "containsImageBubbles":
            containsImageBubbles == null ? null : containsImageBubbles,
      };
}

class ReadingModes {
  ReadingModes({
    this.text,
    this.image,
  });

  bool? text;
  bool? image;

  factory ReadingModes.fromJson(String str) =>
      ReadingModes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReadingModes.fromMap(Map<String, dynamic> json) => ReadingModes(
        text: json["text"] == null ? null : json["text"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toMap() => {
        "text": text == null ? null : text,
        "image": image == null ? null : image,
      };
}
