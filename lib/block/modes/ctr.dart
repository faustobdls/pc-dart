// See file LICENSE for more information.

library impl.block_cipher.modes.ctr;

import 'package:pointycastle_broadcom/api.dart';
import 'package:pointycastle_broadcom/adapters/stream_cipher_as_block_cipher.dart';
import 'package:pointycastle_broadcom/stream/ctr.dart';
import 'package:pointycastle_broadcom/src/registry/registry.dart';

class CTRBlockCipher extends StreamCipherAsBlockCipher {
  /// Intended for internal use.
  static final FactoryConfig factoryConfig = DynamicFactoryConfig.suffix(
      BlockCipher,
      '/CTR',
      (_, final Match match) => () {
            var underlying = BlockCipher(match.group(1)!);
            return CTRBlockCipher(
                underlying.blockSize, CTRStreamCipher(underlying));
          });

  CTRBlockCipher(super.blockSize, super.underlyingCipher);
}
