enum ApiResponseStatus { success, error }

class ApiResponse<T> {
  final T? data;
  final List<String> messages;
  final Pagination? pagination;
  final ApiResponseStatus status;

  ApiResponse({
    this.data,
    this.messages = const [],
    this.pagination,
    this.status = ApiResponseStatus.success,
  });

  factory ApiResponse.success({
    required T data,
    Pagination? pagination,
    List<String>? messages,
  }) {
    return ApiResponse(
      data: data,
      messages: [],
      status: ApiResponseStatus.success,
      pagination: pagination,
    );
  }

  factory ApiResponse.error({required List<String> messages}) {
    return ApiResponse(messages: messages, status: ApiResponseStatus.error);
  }

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    final data = json['data'] != null ? fromJsonT(json['data']) : null;

    final messagesRaw = json['messages'];
    List<String> messages = [];
    if (messagesRaw != null) {
      if (messagesRaw is List) {
        messages = messagesRaw.map((e) => e.toString()).toList();
      } else if (messagesRaw is String) {
        messages = [messagesRaw];
      }
    }

    final paginationRaw = json['pagination'];
    Pagination? pagination;
    if (paginationRaw != null) {
      pagination = Pagination.fromJson(paginationRaw);
    }

    return ApiResponse(
      data: data,
      messages: messages,
      pagination: pagination,
      status:
          json['status'] == 'error'
              ? ApiResponseStatus.error
              : ApiResponseStatus.success,
    );
  }
}

class Pagination {
  final int currentPage;
  final int totalPages;
  final int pageSize;
  final int totalCount;

  Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
    required this.totalCount,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'] ?? 1,
      totalPages: json['total_pages'] ?? 1,
      pageSize: json['page_size'] ?? 10,
      totalCount: json['total_count'] ?? 0,
    );
  }
}
