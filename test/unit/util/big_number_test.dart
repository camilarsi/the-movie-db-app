import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/core/util/big_number.dart';

void main() {
  int million = 1000000;
  int thousand = 1000;
  BigNumber bigNumberMillion = BigNumber(million);
  BigNumber bigNumberThousand = BigNumber(thousand);

  group(
    'should fix a number bigger than 999 to a double fixed to 1 decimal top'
    'and transform it to a string followed by the first character of'
    ' the unit of measurement name of the large number',
    () {
      test(
        'should fix a number bigger than 999999 to a double fixed'
        ' to 1 decimal top and transform it to a string followed by M',
        () {
          String result = bigNumberMillion.getShortString();
          expect(result, '1.0M');
        },
      );
      test(
        'should fix a number bigger than 999 to a double fixed'
        ' to 1 decimal top and transform it to a string followed by K',
        () {
          String result = bigNumberThousand.getShortString();
          expect(result, '1.0K');
        },
      );
    },
  );
}
