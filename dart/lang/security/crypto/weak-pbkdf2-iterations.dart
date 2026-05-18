import 'dart:typed_data';
import 'package:pointycastle/export.dart';

class KdfFactory {
  static Pbkdf2Parameters tinyIterations(Uint8List salt) {
    // ruleid: weak-pbkdf2-iterations
    return Pbkdf2Parameters(salt, 1000, 32);
  }

  static Pbkdf2Parameters belowFloor(Uint8List salt) {
    // ruleid: weak-pbkdf2-iterations
    return Pbkdf2Parameters(salt, 10000, 32);
  }

  static Pbkdf2Parameters justBelow(Uint8List salt) {
    // ruleid: weak-pbkdf2-iterations
    return Pbkdf2Parameters(salt, 99999, 32);
  }

  static Pbkdf2Parameters minimum(Uint8List salt) {
    // ok: weak-pbkdf2-iterations
    return Pbkdf2Parameters(salt, 100000, 32);
  }

  static Pbkdf2Parameters owaspRecommended(Uint8List salt) {
    // ok: weak-pbkdf2-iterations
    return Pbkdf2Parameters(salt, 600000, 32);
  }

  static Pbkdf2Parameters strong(Uint8List salt) {
    // ok: weak-pbkdf2-iterations
    return Pbkdf2Parameters(salt, 1000000, 32);
  }
}
