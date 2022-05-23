class DroppedFile {
  final String name, mime, url;
  final int bytes;
  DroppedFile(
      {required this.name,
      required this.mime,
      required this.bytes,
      required this.url});

  String? get size {
    final kb = bytes / 1024;
    final mb = kb / 1024;

    return mb > 1
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
  }
}
