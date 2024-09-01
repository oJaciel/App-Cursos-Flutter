class CourseEntity {
  String? id;
  String? name;
  String? description;
  String? startAt;

  CourseEntity({
    this.id,
    this.name,
    this.description,
    this.startAt,
  });

  static CourseEntity fromJson(Map<String, dynamic> map) {
    return CourseEntity(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        startAt: map['startAt']);
  }

  static Map<String, dynamic> toJson(CourseEntity courseEntity) {
    Map<String, dynamic> json = {
      'name': courseEntity.name,
      'description': courseEntity.description,
      'start_at': courseEntity.startAt,
    };
    return json;
  }
}
