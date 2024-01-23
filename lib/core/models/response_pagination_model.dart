typedef _Func<T> = T Function(dynamic map);

class Pagination<T> {
  Pagination({
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.totalRecords,
    required this.data,
  });

  // ignore: library_private_types_in_public_api
  factory Pagination.fromMap(Map<String, dynamic> map, _Func<T> data) {
    return Pagination<T>(
      pageNumber: map['pageNumber'] as int,
      pageSize: map['pageSize'] as int,
      totalPages: map['totalPages'] as int,
      totalRecords: map['totalRecords'] as int,
      data: data(map['data']),
    );
  }

  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final int totalRecords;
  final T data;
}
