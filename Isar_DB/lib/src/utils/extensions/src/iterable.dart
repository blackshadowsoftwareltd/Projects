extension ListUtils<T> on List<T> {
  List<List<T>> chunks(int chunkSize) {
    final chunks = <List<T>>[];
    final len = length;
    for (int i = 0; i < len; i += chunkSize) {
      final size = i + chunkSize;
      chunks.add(sublist(i, size > len ? len : size));
    }
    return chunks;
  }
}
