@TestOn('js')
// See file LICENSE for more information.

library test.macs.poly1305_test;

import 'package:pointycastle_broadcom/export.dart';
import 'package:pointycastle_broadcom/src/platform_check/platform_check.dart';
import 'package:test/test.dart';

void main() {
  group('Poly1305 - js', () {
    test('must emit PlatformException', () {
      expect(() {
        Poly1305.withCipher(AESEngine());
      }, throwsA(TypeMatcher<PlatformException>()));

      expect(() {
        Poly1305();
      }, throwsA(TypeMatcher<PlatformException>()));
    });
  });
}
