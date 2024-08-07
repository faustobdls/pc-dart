// See file LICENSE for more information.

import 'dart:typed_data';

import 'package:pointycastle_broadcom/api.dart';

/// Base implementation of [AsymmetricBlockCipher] which provides shared methods.
abstract class BaseAsymmetricBlockCipher implements AsymmetricBlockCipher {
  @override
  Uint8List process(Uint8List data) {
    var out = Uint8List(outputBlockSize);
    var len = processBlock(data, 0, data.length, out, 0);
    return out.sublist(0, len);
  }
}
