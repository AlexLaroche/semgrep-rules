import 'package:pointycastle/export.dart';

class CipherFactory {
  BlockCipher ecbDirect() {
    // ruleid: ecb-cipher
    return ECBBlockCipher(AESEngine());
  }

  BlockCipher ecbRegistry() {
    // ruleid: ecb-cipher
    return BlockCipher("AES/ECB");
  }

  PaddedBlockCipher ecbPadded() {
    // ruleid: ecb-cipher
    return PaddedBlockCipher("AES/ECB/PKCS7");
  }

  BlockCipher ecbLowercase() {
    // ruleid: ecb-cipher
    return BlockCipher('AES/ecb/PKCS7');
  }

  BlockCipher cbcDirect() {
    // ok: ecb-cipher
    return CBCBlockCipher(AESEngine());
  }

  BlockCipher cbcRegistry() {
    // ok: ecb-cipher
    return BlockCipher("AES/CBC/PKCS7");
  }

  BlockCipher gcmRegistry() {
    // ok: ecb-cipher
    return BlockCipher("AES/GCM/NoPadding");
  }
}
