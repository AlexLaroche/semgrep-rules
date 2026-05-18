import 'dart:io';

class FileServer {
  static const safeRoot = '/srv/files';

  Future<String> readUserFile(String userPath) async {
    // ruleid: path-traversal
    return File(userPath).readAsString();
  }

  Future<String> readInterpolated(String userPath) async {
    // ruleid: path-traversal
    return File('$safeRoot/$userPath').readAsString();
  }

  Future<String> readConcat(String userPath) async {
    // ruleid: path-traversal
    return File(safeRoot + '/' + userPath).readAsString();
  }

  Future<String> readIndirect(String userPath) async {
    final fullPath = '$safeRoot/$userPath';
    // ruleid: path-traversal
    return File(fullPath).readAsString();
  }

  Future<List<FileSystemEntity>> listUserDir(String userPath) async {
    // ruleid: path-traversal
    return Directory(userPath).list().toList();
  }

  Future<String> resolveLink(String userPath) async {
    // ruleid: path-traversal
    return Link(userPath).resolveSymbolicLinks();
  }

  Future<String> readFromUri(Uri userUri) async {
    // ruleid: path-traversal
    return File.fromUri(userUri).readAsString();
  }

  Future<String> readStaticFile() async {
    // ok: path-traversal
    return File('/etc/hostname').readAsString();
  }

  Future<String> readJoinedConstant() async {
    // ok: path-traversal
    return File('$safeRoot/index.html').readAsString();
  }

  Future<List<FileSystemEntity>> listStaticDir() async {
    // ok: path-traversal
    return Directory(safeRoot).list().toList();
  }
}
