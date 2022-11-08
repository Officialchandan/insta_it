class DBConstant {
  static const DATA_BASE_NAME = "my_insta_db";
  static const BOOK_TABLE = "BOOK_TABLE";
  static const IDS = "IDS";
  static const BOOk_ID = "id";

  static const BOOK_TITLE = "title";
  static const BOOK_AUTHORS = "authors";
  static const BOOK_PUBLISHER = "publisher";
  static const BOOK_PUBLICATION_DATE = "publishedDate";
  static const BOOK_LANGUAGE = "language";
  static const BOOK_PAGES = "pageCount";
  static const BOOK_CATEGORIES = "categories";
  static const BOOK_DESCRIPTION = "description";
  static const BOOK_PRIVIEW_LINK = "previewLink";
  static const BOOK_IMEAGE = "thumbnail";

  static const String CREATE_BOOKS_TABLE = "CREATE TABLE " +
      BOOK_TABLE +
      "(" +
      IDS +
      " INTEGER PRIMARY KEY AUTOINCREMENT , " +
      BOOK_TITLE +
      " TEXT," +
      BOOK_AUTHORS +
      " TEXT," +
      BOOK_PUBLISHER +
      " TEXT," +
      BOOK_PUBLICATION_DATE +
      " TEXT," +
      BOOK_LANGUAGE +
      " TEXT," +
      BOOK_PAGES +
      " TEXT," +
      BOOK_CATEGORIES +
      " TEXT," +
      BOOK_DESCRIPTION +
      " TEXT," +
      BOOK_IMEAGE +
      " TEXT," +
      BOOK_PRIVIEW_LINK +
      " TEXT )";
}
