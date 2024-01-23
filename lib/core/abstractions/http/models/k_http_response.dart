
import 'package:core_app/core/enums/status_code.dart';

class KHttpResponse<T> {
  KHttpResponse({
    required this.isRedirect,
    required this.extra,
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  /// The content could have been transformed by the [Transformer]
  /// before it can use eventually.
  T? data;

  /// The [RequestOptions] used for the corresponding request.
  //* RequestOptions requestOptions;

  /// The HTTP status code for the response.
  ///
  /// This can be null if the response was constructed manually.
  int? statusCode;

  StatusCode? get statusCodeEnum => getStatus(statusCode ?? 500);

  /// Returns the reason phrase associated with the status code.
  String? statusMessage;

  /// Headers for the response.
  //* Headers headers;

  /// Whether the response has been redirected.
  ///
  /// The field rely on the implementation of the adapter.
  bool isRedirect;

  /// All redirections happened before the response respond.
  ///
  /// The field rely on the implementation of the adapter.
  //* List<RedirectRecord> redirects;

  /// Return the final real request URI (may be redirected).
  ///
  /// Note: Whether the field is available depends on whether the adapter
  /// supports or not.
  //* Uri get realUri =>
  //     redirects.isNotEmpty ? redirects.last.location : requestOptions.uri;

  /// An extra map that you can save your custom information in.
  ///
  /// The field is designed to be non-identical with
  /// [Options.extra] and [RequestOptions.extra].
  Map<String, dynamic> extra;
}