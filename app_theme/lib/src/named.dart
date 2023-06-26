/// This class associated a [name] to a given [value].
class Named<T> {
  const Named(this.name, this.value);

  final String name;
  final T value;

  @override
  int get hashCode => Object.hashAll([name, value]);

  @override
  bool operator ==(Object other) {
    return other is Named<T> && other.name == name && other.value == value;
  }

  @override
  String toString() => '<$name>($value)';
}

extension NamedExtension<T> on T {
  Named<T> named(String name) => Named<T>(name, this);
}
