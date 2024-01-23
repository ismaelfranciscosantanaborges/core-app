


import 'package:core_app/core/models/response.dart';
import 'package:core_app/core/models/response_pagination_model.dart';

import '../../record_result/lib/record_result.dart';
typedef DataMap = Map<String, dynamic>;
typedef ResultPagination<T> = FutureRecordResult<Response<Pagination<T>>>;
typedef Result<T> = FutureRecordResult<Response<T>>;
typedef FutureResponse<T> = FutureRecordResult<Response<T>>;
