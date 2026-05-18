import 'dart:typed_data';
import 'dart:math';
import 'package:pointycastle/export.dart';

class CipherInit {
  CBCBlockCipher zeroIv(Uint8List key) {
    final cipher = CBCBlockCipher(AESEngine());
    // ruleid: hardcoded-iv
    cipher.init(true, ParametersWithIV(KeyParameter(key), Uint8List(16)));
    return cipher;
  }

  CBCBlockCipher constantIv(Uint8List key) {
    final cipher = CBCBlockCipher(AESEngine());
    // ruleid: hardcoded-iv
    cipher.init(true, ParametersWithIV(KeyParameter(key), Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16])));
    return cipher;
  }

  CTRStreamCipher ctrZeroIv(Uint8List key) {
    final cipher = CTRStreamCipher(AESEngine());
    // ruleid: hardcoded-iv
    cipher.init(true, ParametersWithIV(KeyParameter(key), Uint8List(16)));
    return cipher;
  }

  CBCBlockCipher randomIv(Uint8List key) {
    final cipher = CBCBlockCipher(AESEngine());
    final secure = Random.secure();
    final iv = Uint8List.fromList(
      List<int>.generate(16, (_) => secure.nextInt(256)),
    );
    // ok: hardcoded-iv
    cipher.init(true, ParametersWithIV(KeyParameter(key), iv));
    return cipher;
  }

  CBCBlockCipher fortunaIv(Uint8List key, FortunaRandom rng) {
    final cipher = CBCBlockCipher(AESEngine());
    // ok: hardcoded-iv
    cipher.init(true, ParametersWithIV(KeyParameter(key), rng.nextBytes(16)));
    return cipher;
  }
}
