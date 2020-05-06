class VideoModel {
  int id;
  String name;
  String url;
  String image;

  VideoModel({this.image, this.name, this.url, this.id});

  factory VideoModel.fromJson(Map json) {
    return VideoModel(
        id: json['id'],
        name: json['name'],
        url: json['url'],
        image: json['image']);
  }
}

List<VideoModel> videos = [
  VideoModel(
    name: "Triumph Daytona 675R Sports bike PowerDrift review ",
    image: "https://mcn-images.bauersecure.com/PageFiles/488517/123.jpg",
    url: "vZhNv3ThdlI",
    id: 1,
  ),
  VideoModel(
    name: "Ducati 959 Panigale",
    image: "https://i.pinimg.com/originals/42/df/f2/42dff23c7362999cc389e9dff46268bf.jpg",
    url: "edzcKRgN_sg",
    id: 2,
  ),
  VideoModel(
    name: "1299 Superleggera ",
    image: "https://i.pinimg.com/originals/aa/7f/04/aa7f04719a25863f24489207b18b29e3.jpg",
    url: "U1_S-o_-cI8",
    id: 3,
  )
];
