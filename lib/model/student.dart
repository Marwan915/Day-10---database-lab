class Student {
  int? id;
  String? name;
  int? age;
  double? salary;

  Student({
    this.id,
    this.age,
    this.name,
    this.salary,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      age: json["age"],
      name: json["name"],
      salary: json["salary"],
      id: json["id"],
    );
  }
}
