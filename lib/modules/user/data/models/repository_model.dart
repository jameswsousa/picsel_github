import 'package:picsel_github/core/data_parser.dart';
import 'package:picsel_github/modules/user/domain/entities/repository_entity.dart';

class RepositoryModel extends RepositoryEntity {
  RepositoryModel(
      {required super.name,
      super.description,
      required super.url,
      required super.id,
      required super.updated_at});

  factory RepositoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return RepositoryModel(
      name: json['name'],
      id: json['id'].toString(),
      description: json['description'],
      updated_at: DateParser.getDateTime(json['updated_at']),
      url: json['html_url'],
    );
  }
}
