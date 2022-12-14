extension Unique<T, Id> on List<T> {
  List<T> unique([Id Function(T element)? id, bool inplace = true]) {
    final ids = <dynamic>{};
    var list = inplace ? this : List<T>.from(this);
    list.retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }
}
