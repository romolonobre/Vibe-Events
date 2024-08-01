abstract class EntityAdaptor<T> {
  T fromJson(dynamic json);

  List<T> fromJsonToList(dynamic json);
}
