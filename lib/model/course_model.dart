class courseEntity {
  String? id;
  String? name;
  String? description;
  String? startAt;

  courseEntity({
    this.id,
    this.name,
    this.description,
    this.startAt,
  });

  static courseEntity fromJson(Map<String, dynamic> map) {
    return courseEntity(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      startAt: map['startAt']
    );
  }
}
