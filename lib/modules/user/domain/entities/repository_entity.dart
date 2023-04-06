class RepositoryEntity {
  final String name;
  final String id;
  final String? description;
  final String url;
  final DateTime updated_at;

  RepositoryEntity(
      {required this.name,
      this.description,
      required this.url,
      required this.id,
      required this.updated_at});
}
