class DBConstant {
  static const DATA_BASE_NAME = "my_insta_db";
  static const BOOK_TABLE = "BOOK_TABLE";
  static const IDS = "IDS";
  static const BOOk_ID = "id";

  static const BOOK_TITLE = "BOOK_TITLE";
  static const BOOK_AUTHORS = "BOOK_AUTHORS";
  static const BOOK_PUBLISHER = "BOOK_PUBLISHER";
  static const BOOK_PUBLICATION_DATE = "BOOK_PUBLICATION_DATE";
  static const BOOK_LANGUAGE_AND_PAGES = "BOOK_LANGUAGE_AND_PAGES";
  static const BOOK_CATEGORIES = "BOOK_CATEGORIES";
  static const BOOK_ISBN = "BOOK_ISBN";
  static const BOOK_DESCRIPTION = "BOOK_DESCRIPTION";
  static const BOOK_PRIVIEW_LINK = "BOOK_PRIVIEW_LINK";
  static const BOOK_IMEAGE_BIG = "BOOK_IMEAGE_BIG";
  static const BOOK_IMEAGE_SMOLL = "BOOK_IMEAGE_SMOLL";

  static const String CREATE_BOOKS_TABLE = "CREATE TABLE " +
      BOOK_TABLE +
      "(" +
      IDS +
      " INTEGER PRIMARY KEY AUTOINCREMENT , " +
      BOOk_ID +
      " TEXT," +
      BOOK_TITLE +
      " TEXT," +
      BOOK_AUTHORS +
      " TEXT," +
      BOOK_PUBLISHER +
      " TEXT," +
      BOOK_PUBLICATION_DATE +
      " TEXT," +
      BOOK_LANGUAGE_AND_PAGES +
      " TEXT," +
      BOOK_CATEGORIES +
      " TEXT," +
      BOOK_ISBN +
      " TEXT," +
      BOOK_DESCRIPTION +
      " TEXT," +
      BOOK_PRIVIEW_LINK +
      " TEXT," +
      BOOK_IMEAGE_BIG +
      " TEXT," +
      BOOK_IMEAGE_SMOLL +
      " TEXT )";
}
