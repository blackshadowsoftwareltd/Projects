abstract class Enum<T> {
  final T _value;
  T get value => _value;

  const Enum(this._value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Enum<T> && other._value == _value;
  }

  @override
  int get hashCode => _value.hashCode;
}

@Deprecated('Dart 2.15 support getting enum key name string')
T? enumValueByString<T>(List<T>? values, String? key, {T Function()? orElse}) {
  if (values == null || key == null) {
    if (orElse != null) return orElse();
    throw EnumValueInvalidParamsException();
  }
  for (T item in values) {
    final String itemName = item.toString().replaceFirst(RegExp(r'.+(\.)'), '');
    if (itemName.toLowerCase() == key.toLowerCase()) return item;
  }
  return null;
}

/// Throws if [values] or [key] gives null
class EnumValueInvalidParamsException implements Exception {}
