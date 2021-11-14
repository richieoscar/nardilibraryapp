import 'package:nardilibraryapp/util/validate_util.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test("Password valid", () {
    bool ans = true;

    bool result = Validate.passwordMatch("oscarred", "oscarred");

    expect(ans, result);
  });
}
