class PhotosModel {
  String imgSrc;
  String PhotoName;
  PhotosModel({required this.PhotoName, required this.imgSrc});

  static PhotosModel fromAPItoApp(Map<String, dynamic> photoMap) {
    return PhotosModel(
        PhotoName: photoMap["alt"], imgSrc: (photoMap["src"])["portrait"]);
  }
}
