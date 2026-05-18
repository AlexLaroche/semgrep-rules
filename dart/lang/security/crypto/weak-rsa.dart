import 'package:pointycastle/export.dart';

class KeyFactory {
  static RSAKeyGeneratorParameters weakParams() {
    // ruleid: weak-rsa
    return RSAKeyGeneratorParameters(BigInt.from(65537), 1024, 64);
  }

  static RSAKeyGeneratorParameters tinyParams() {
    // ruleid: weak-rsa
    return RSAKeyGeneratorParameters(BigInt.from(65537), 512, 64);
  }

  static RSAKeyGeneratorParameters okParams() {
    // ok: weak-rsa
    return RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 64);
  }

  static RSAKeyGeneratorParameters strongParams() {
    // ok: weak-rsa
    return RSAKeyGeneratorParameters(BigInt.from(65537), 4096, 64);
  }
}
