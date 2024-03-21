class BedModel{
  final String bed;
  final String name;
  final String sex;
  final int age;

  const BedModel({required this.bed, required this.name, required this.age, required this.sex});
}

class BedDetails{
  final bedData = const [
    BedModel(bed: "베드 1", name: "김강민", age: 23, sex: "남"),
    BedModel(bed: "베드 1", name: "김김김", age: 23, sex: "남"),
    BedModel(bed: "베드 1", name: "강강강", age: 23, sex: "남"),
    BedModel(bed: "베드 1", name: "민민민", age: 23, sex: "남"),
    BedModel(bed: "베드 1", name: "들들들", age: 23, sex: "남"),
  ];
}