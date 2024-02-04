import 'package:flutter_andomie/core.dart';

import '../../core/configs.dart';
import '../../core/typedefs.dart';
import '../../utils/response.dart';
import '../sources/local_data_source.dart';
import '../sources/remote_data_source.dart';
import 'data_repository.dart';

/// # Won't Use Directly
/// You can use:
/// * <b>[RemoteDataRepositoryImpl]</b> : Use for all remote database related data.
///
abstract class RemoteDataRepository<T extends Entity>
    extends DataRepository<T> {
  final bool isCacheMode;
  final RemoteDataSource<T> source;
  final LocalDataSource<T>? backup;

  RemoteDataRepository({
    super.connectivity,
    required this.source,
    this.backup,
    this.isCacheMode = false,
  });

  bool get isLocal => backup != null;

  /// Use for fetch data by query
  Future<DataResponse<T>> query<R>({
    OnDataSourceBuilder<R>? builder,
    List<Query> queries = const [],
    List<Sorting> sorts = const [],
    PagingOptions options = const PagingOptionsImpl(),
  });
}
