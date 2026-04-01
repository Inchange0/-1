void main() {
  group('deserialize example JSON responses from wikipedia API', () {
    test('deserialize Dart Programming Language page summary example data from '
        'json file into a Summary object', () async {
      final String pageSummaryInput =
          await File(dartLangSummaryJson).readAsString();
      final Map<String, Object?> pageSummaryMap =
          jsonDecode(pageSummaryInput) as Map<String, Object?>;
      final Summary summary = Summary.fromJson(pageSummaryMap);
      expect(summary.titles.canonical, 'Dart_(programming_language)');
    });
  });
}