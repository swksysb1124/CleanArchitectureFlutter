import 'package:flutter_test/flutter_test.dart';

var names = <String>['Jason', 'Rico'];
var wordSet = <String>{'a', 'an', 'the'};
var map = <String, String>{
  "1": "Jason Su",
  "2": "Rico Su",
};

void main() {
  test("equal and hash", () {
    print('${names.join("-")}');
    var rawData = 'Jason-Rico';
    var list = rawData.split("-");
    print('$list');
    print('${wordSet.join("-")}');
    print('${map.values.join("-")}');
  });
}
