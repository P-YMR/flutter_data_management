part of 'handlers.dart';

abstract class DataHandler<T extends Entity> {
  Future<Response<T>> isAvailable<R>(
    String id, {
    OnDataSourceBuilder<R>? builder,
  });

  Future<Response<T>> insert<R>(
    T data, {
    OnDataSourceBuilder<R>? builder,
  });

  Future<Response<T>> inserts<R>(
    List<T> data, {
    OnDataSourceBuilder<R>? builder,
  });

  Future<Response<T>> update<R>(
    String id,
    Map<String, dynamic> data, {
    OnDataSourceBuilder<R>? builder,
  });

  Future<Response<T>> delete<R>(
    String id, {
    OnDataSourceBuilder<R>? builder,
  });

  Future<Response<T>> clear<R>({
    OnDataSourceBuilder<R>? builder,
  });

  Future<Response<T>> get<R>(
    String id, {
    OnDataSourceBuilder<R>? builder,
  });

  Future<Response<T>> gets<R>({
    OnDataSourceBuilder<R>? builder,
  });

  Future<Response<T>> getUpdates<R>({
    OnDataSourceBuilder<R>? builder,
  });

  Stream<Response<T>> live<R>(
    String id, {
    OnDataSourceBuilder<R>? builder,
  });

  Stream<Response<T>> lives<R>({
    OnDataSourceBuilder<R>? builder,
  });
}
