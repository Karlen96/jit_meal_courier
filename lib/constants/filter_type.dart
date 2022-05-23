enum FilterType {
  YESTERDAY,
  TODAY,
  TOMORROW,
}

extension FilterTranslation on FilterType {
  String get title {
    switch (this) {
      case FilterType.YESTERDAY:
        return 'filterType.yesterday';
      case FilterType.TODAY:
        return 'filterType.today';
      case FilterType.TOMORROW:
        return 'filterType.tomorrow';
    }
  }
}
