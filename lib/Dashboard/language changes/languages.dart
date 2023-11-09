class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;
  final String languageContry;

  Language(
      this.id, this.flag, this.name, this.languageCode, this.languageContry);

  static List<Language> languageList() {
    return <Language>[
      // Language(1, "🇦🇫", "فارسی", "fa"),
      Language(1, "🇺🇸", "English", "en", "US"),
      Language(2, "🇮🇳", "हिंदी", "hi", "IN"),
    ];
  }
}

class Currency {
  final int id;
  final String flag;
  final String name;
  final String languageCode;
  final String languageContry;

  Currency(
      this.id, this.flag, this.name, this.languageCode, this.languageContry);

  static List<Currency> currencyList() {
    String doller = "\$";
    return <Currency>[
      Currency(1, "🇺🇸", "US Doller ( \$ )", "en", "US"),
      Currency(2, "🇮🇳", "Ruppees ( ₹ )", "hi", "IN"),
    ];
  }
}
