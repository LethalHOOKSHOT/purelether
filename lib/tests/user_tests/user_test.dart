import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

import '../../model/user.dart';

@GenerateMocks([User])
void main() {
  group("name", () {
    test("nikita", () {
      String name = "nikita";
    });
  });
}
