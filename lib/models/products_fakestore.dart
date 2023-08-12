class FakeStoreProducts {
  int? id;
  String? title;
  String? image;

  FakeStoreProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }
}
