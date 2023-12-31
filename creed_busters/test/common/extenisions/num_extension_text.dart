import 'package:creed_busters/common/extensions/num__extensions.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('num extensions test', () {
    test('should convert single digit int to string with percentage appended ',
            () {
          const number = 0.8;
          final actual = number.convertToPercentageString();
          final expected = "8 %";
          expect(actual, expected);
        });

    test('should convert double digit int to string with percentage appended ',
            () {
          const number = 1.5;
          final actual = number.convertToPercentageString();
          final expected = "15 %";
          expect(actual, expected);
        });

    test('should convert 0 to 0 percentage ', () {
      const number = 0;
      final actual = number.convertToPercentageString();
      final expected = "0 %";
      expect(actual, expected);
    });

    test('should convert 10 to 100 percentage ', () {
      const number = 10;
      final actual = number.convertToPercentageString();
      final expected = "100 %";
      expect(actual, expected);
    });

    test('should convert after rounding off to percentage ', () {
      const number = 4.5555;
      final actual = number.convertToPercentageString();
      final expected = "46 %";
      expect(actual, expected);
    });
  });
}
