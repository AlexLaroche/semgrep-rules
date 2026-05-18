import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageDemo {
  // path_provider external-storage APIs.
  Future<void> usesExternalDir() async {
    // ruleid: external-storage-write
    final dir = await getExternalStorageDirectory();
    final file = File('${dir!.path}/token.txt');
    await file.writeAsString('secret');
  }

  Future<void> usesExternalDirsTyped() async {
    // ruleid: external-storage-write
    final dirs = await getExternalStorageDirectories(
      type: StorageDirectory.documents,
    );
    print(dirs);
  }

  Future<void> usesDownloads() async {
    // ruleid: external-storage-write
    final dir = await getDownloadsDirectory();
    print(dir);
  }

  Future<void> usesExternalCache() async {
    // ruleid: external-storage-write
    final dirs = await getExternalCacheDirectories();
    print(dirs);
  }

  // Hardcoded external-storage paths.
  void hardcodedSdcard() {
    // ruleid: external-storage-write
    final file = File('/sdcard/secret.txt');
    file.writeAsStringSync('x');
  }

  void hardcodedEmulated() {
    // ruleid: external-storage-write
    final file = File('/storage/emulated/0/secret.txt');
    file.writeAsStringSync('x');
  }

  void hardcodedMntSdcard() {
    // ruleid: external-storage-write
    final file = File('/mnt/sdcard/secret.txt');
    file.writeAsStringSync('x');
  }

  void hardcodedDirectory() {
    // ruleid: external-storage-write
    final d = Directory('/sdcard/myapp');
    d.createSync();
  }

  // OK: app-private locations.
  Future<void> okAppDocs() async {
    // ok: external-storage-write
    final dir = await getApplicationDocumentsDirectory();
    print(dir);
  }

  Future<void> okSupport() async {
    // ok: external-storage-write
    final dir = await getApplicationSupportDirectory();
    print(dir);
  }

  Future<void> okTemp() async {
    // ok: external-storage-write
    final dir = await getTemporaryDirectory();
    print(dir);
  }

  void okInternalFile() {
    // ok: external-storage-write
    final file = File('/data/data/com.example/app.db');
    file.writeAsStringSync('x');
  }
}
