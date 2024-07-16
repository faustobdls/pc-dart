// See file LICENSE for more information.

library impl.block_cipher.modes.sic;

import 'package:pointycastle_broadcom/api.dart';
import 'package:pointycastle_broadcom/adapters/stream_cipher_as_block_cipher.dart';
import 'package:pointycastle_broadcom/stream/sic.dart';
import 'package:pointycastle_broadcom/src/registry/registry.dart';

/// See [SICStreamCipher].
class SICBlockCipher extends StreamCipherAsBlockCipher {
  /// Intended for internal use.
  static final FactoryConfig factoryConfig = DynamicFactoryConfig.suffix(
      BlockCipher,
      '/SIC',
      (_, final Match match) => () {
            var underlying = BlockCipher(match.group(1)!);
            return SICBlockCipher(
                underlying.blockSize, SICStreamCipher(underlying));
          });

  SICBlockCipher(super.blockSize, super.underlyingCipher);
}
