import 'owner.dart';

class Repository {
  final int id;
  final String name;
  final Owner owner;
  final String description;
  final int stargazersCount;
  final DateTime updatedAt;

  Repository({
    required this.id,
    required this.name,
    required this.owner,
    required this.description,
    required this.stargazersCount,
    required this.updatedAt,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'],
      name: json['name'],
      owner: Owner.fromJson(json['owner']),
      description: json['description'] ?? 'No description',
      stargazersCount: json['stargazers_count'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'owner': owner.toJson(),
      'description': description,
      'stargazers_count': stargazersCount,
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}