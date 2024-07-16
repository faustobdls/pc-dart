// See file LICENSE for more information.

import 'package:pointycastle_broadcom/api.dart';
import 'package:pointycastle_broadcom/src/impl/secure_random_base.dart';
import 'package:pointycastle_broadcom/src/registry/registry.dart';
import 'package:pointycastle_broadcom/src/ufixnum.dart';

/// An implementation of [SecureRandom] that return numbers in growing sequence.
class NullSecureRandom extends SecureRandomBase {
  static final FactoryConfig factoryConfig =
      StaticFactoryConfig(SecureRandom, 'Null', () => NullSecureRandom());

  var _nextValue = 0;
  @override
  String get algorithmName => 'Null';
  @override
  void seed(CipherParameters params) {}
  @override
  int nextUint8() => clip8(_nextValue++);
}
