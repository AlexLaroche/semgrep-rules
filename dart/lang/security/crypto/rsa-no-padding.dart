import 'package:pointycastle/export.dart';

class RsaDemo {
  // Raw RSAEngine — no padding, malleable, deterministic.
  AsymmetricBlockCipher bareReturn() {
    // ruleid: rsa-no-padding
    return RSAEngine();
  }

  void bareLocal() {
    // ruleid: rsa-no-padding
    final cipher = RSAEngine();
    cipher.init(true, PublicKeyParameter<RSAPublicKey>(_key));
  }

  // Registry lookup with bare "RSA" — also unpadded.
  AsymmetricBlockCipher registryBare() {
    // ruleid: rsa-no-padding
    return AsymmetricBlockCipher('RSA');
  }

  // OK: OAEP wrapping (preferred).
  AsymmetricBlockCipher oaepInline() {
    // ok: rsa-no-padding
    return OAEPEncoding(RSAEngine());
  }

  // OK: PKCS1 wrapping (acceptable for legacy interop).
  AsymmetricBlockCipher pkcs1Inline() {
    // ok: rsa-no-padding
    return PKCS1Encoding(RSAEngine());
  }

  // OK: registry with OAEP suffix.
  AsymmetricBlockCipher registryOaep() {
    // ok: rsa-no-padding
    return AsymmetricBlockCipher('RSA/OAEP/SHA-256');
  }

  // OK: registry with PKCS1 suffix.
  AsymmetricBlockCipher registryPkcs1() {
    // ok: rsa-no-padding
    return AsymmetricBlockCipher('RSA/PKCS1');
  }

  late final RSAPublicKey _key;
}
