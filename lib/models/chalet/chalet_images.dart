
class ChaletImages {
  late int order;
  late String image;


  ChaletImages();
  ChaletImages.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    image = json['image'];
  }


}