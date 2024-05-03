enum KResponseType {
  /// Transform the response data to JSON object only when the
  /// content-type of response is "application/json" .
  json,

  /// Get the response stream directly,
  /// the [Response.data] will be [ResponseBody].
  ///
  /// ```dart
  /// Response<ResponseBody> rs = await Dio().get<ResponseBody>(
  ///   url,
  ///   options: Options(responseType: ResponseType.stream),
  /// );
  stream,

  /// Transform the response data to an UTF-8 encoded [String].
  plain,

  /// Get the original bytes, the [Response.data] will be [List<int>].
  bytes,
}
