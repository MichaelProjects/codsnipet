class CodeSnip {
  String id;
  String title;
  String code;
  String language;
  List<String> tags;
  DateTime createAt;

  CodeSnip(
      this.id, this.title, this.code, this.language, this.tags, this.createAt);

  factory CodeSnip.fromJson(Map<String, dynamic> json) {
    return CodeSnip(
      json['_id']["\$oid"],
      json['title'],
      json['code'],
      json['language'],
      json['tags'],
      DateTime.parse(json['create_at']["\$date"]),
    );
  }
  factory CodeSnip.mockData() {
    return CodeSnip(
      "123",
      "Hello World",
      """
List<Widget> string2Chip(List<String> data) {
  List<Widget> chips = [];
  for (var i in data) {
    chips.add(Chip(
      backgroundColor: CustomColor.chipBackground,
      label: Text(i,
          style: TextStyle(
              color: CustomColor.green,
              fontSize: 12,
              fontWeight: FontWeight.bold)),
    ));
  }
  return chips;
}
    """,
      "dart",
      ["python", "flutter"],
      DateTime.now(),
    );
  }
}
