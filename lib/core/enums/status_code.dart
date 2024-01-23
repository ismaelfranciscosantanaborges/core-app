enum StatusCode {
  not_found,
  bad_request,
  server_error,
  connection_error,
  success,
  unauthorized,
  forbidden,
  conflict,
  too_many_request,
  need_change_token_WMC,
}

StatusCode getStatus(int statusCode) {
  switch (statusCode) {
    case 200:
    case 201:
    case 204:
    case 208:
      return StatusCode.success;
    case 400:
      return StatusCode.bad_request;
    case 401:
      return StatusCode.unauthorized;
    case 403:
      return StatusCode.forbidden;
    case 404:
      return StatusCode.not_found;
    case 407:
      return StatusCode.need_change_token_WMC;
    case 409:
      return StatusCode.conflict;
    case 429:
      return StatusCode.too_many_request;
    case 500:
    default:
      return StatusCode.server_error;
  }
}
