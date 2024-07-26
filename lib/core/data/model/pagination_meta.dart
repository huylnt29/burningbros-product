class PaginationMeta {
  PaginationMeta({
    required this.total,
    required this.skip,
    required this.limit,
  });

  int total;
  int skip;
  int limit;
}
