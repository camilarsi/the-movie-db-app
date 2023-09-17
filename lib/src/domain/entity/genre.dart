class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  factory Genre.mockGenre() {
    return Genre(
      id: 28,
      name: 'Action',
    );
  }

  static List<Genre> fromJsonList(List<dynamic> jsonArray) {
    return jsonArray.map((genre) => Genre.fromJson(genre)).toList();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Genre &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
