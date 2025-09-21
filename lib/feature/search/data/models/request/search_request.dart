class SearchRequest {
  final String name;

  SearchRequest({required this.name});

  Map<String, dynamic> toJson() {
    return {"name": name};
  }
}
