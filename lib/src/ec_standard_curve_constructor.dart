// See file LICENSE for more information.

import 'package:pointycastle_broadcom/ecc/ecc_base.dart';
import 'package:pointycastle_broadcom/ecc/ecc_fp.dart' as fp;
import 'package:pointycastle_broadcom/src/utils.dart' as utils;

ECDomainParametersImpl constructFpStandardCurve(
    String name, Function constructor,
    {BigInt? q,
    BigInt? a,
    BigInt? b,
    BigInt? g,
    BigInt? n,
    BigInt? h,
    BigInt? seed}) {
  var curve = fp.ECCurve(q, a, b);
  var seedBytes = (seed == null) ? null : utils.encodeBigInt(seed);
  return constructor(
      name, curve, curve.decodePoint(utils.encodeBigInt(g)), n, h, seedBytes);
}
