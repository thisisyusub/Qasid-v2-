base class BaseException<T> implements Exception {
  const BaseException([this.error]);

  final T? error;
}

final class CacheException<T> extends BaseException<T> {
  const CacheException([T? error]) : super(error);
}
