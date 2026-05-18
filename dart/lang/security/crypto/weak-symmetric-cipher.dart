import 'package:pointycastle/export.dart';

class WeakCipherDemo {
  // Direct engine classes — broken by key/block size or biases.
  BlockCipher des() {
    // ruleid: weak-symmetric-cipher
    return DESEngine();
  }

  BlockCipher tripleDes() {
    // ruleid: weak-symmetric-cipher
    return DESedeEngine();
  }

  BlockCipher rc2() {
    // ruleid: weak-symmetric-cipher
    return RC2Engine();
  }

  StreamCipher rc4() {
    // ruleid: weak-symmetric-cipher
    return RC4Engine();
  }

  BlockCipher blowfish() {
    // ruleid: weak-symmetric-cipher
    return BlowfishEngine();
  }

  // Registry-string lookups — algorithm name only.
  BlockCipher desRegistry() {
    // ruleid: weak-symmetric-cipher
    return BlockCipher('DES');
  }

  StreamCipher rc4Registry() {
    // ruleid: weak-symmetric-cipher
    return StreamCipher('RC4');
  }

  // Registry-string lookups — algorithm with mode/padding suffix.
  BlockCipher desCbcRegistry() {
    // ruleid: weak-symmetric-cipher
    return BlockCipher('DES/CBC/PKCS7');
  }

  BlockCipher tripleDesRegistry() {
    // ruleid: weak-symmetric-cipher
    return BlockCipher('DESede/CBC/PKCS7');
  }

  PaddedBlockCipher blowfishRegistry() {
    // ruleid: weak-symmetric-cipher
    return PaddedBlockCipher('Blowfish/CBC/PKCS7');
  }

  PaddedBlockCipherImpl rc2Padded() {
    return PaddedBlockCipherImpl(
      PKCS7Padding(),
      // ruleid: weak-symmetric-cipher
      BlockCipher('RC2/CBC'),
    );
  }

  // OK cases — modern authenticated encryption.
  BlockCipher aesEngineOk() {
    // ok: weak-symmetric-cipher
    return AESEngine();
  }

  BlockCipher aesGcmOk() {
    // ok: weak-symmetric-cipher
    return BlockCipher('AES/GCM/NoPadding');
  }

  BlockCipher aesCbcOk() {
    // ok: weak-symmetric-cipher
    return PaddedBlockCipher('AES/CBC/PKCS7');
  }

  StreamCipher chacha20Ok() {
    // ok: weak-symmetric-cipher
    return StreamCipher('ChaCha20/20');
  }
}
