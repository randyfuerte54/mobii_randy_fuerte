extension JsonExtensions on Map<String, dynamic> {
  String toNonNullableString(
    String key, {
    String defaultValue = '',
  }) {
    final value = this[key];
    return value as String? ?? defaultValue;
  }

  List<T> toNonNullableList<T>(String key, {List<T> defaultValue = const []}) {
    final value = this[key];
    return (value as List?)?.cast<T>() ?? defaultValue;
  }
}
