
import 'package:record_result/record_result.dart';

import 'package:core_app/core/models/response.dart';
import 'package:core_app/core/models/response_pagination_model.dart';
typedef DataMap = Map<String, dynamic>;
typedef ResultPagination<T> = FutureResult<Response<Pagination<T>>>;
typedef FutureResponse<T> = FutureResult<Response<T>>;
