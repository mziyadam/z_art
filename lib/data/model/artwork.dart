class Artwork {
  String id = "";
  String title = "";
  String artistTitle = "";
  String dateDisplay = "";
  String artistDisplay = "";
  String creditName = "";
  String artworkTypeTitle = "";
  String mediumDisplay = "";
  String imageId = "";

  Artwork(
      {required this.id,
      required this.title,
      required this.artistTitle,
      required this.dateDisplay,
      required this.artistDisplay,
      required this.creditName,
      required this.artworkTypeTitle,
      required this.mediumDisplay,
      required this.imageId});

  Artwork.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title']??"";
    artistTitle = json['artist_title']??"";
    dateDisplay = json['date_display']??"";
    artistDisplay = json['artist_display']??"";
    creditName = json['credit_name']??"";
    artworkTypeTitle = json['artwork_type_title']??"";
    mediumDisplay = json['medium_display']??"";
    imageId = json['image_id']??"";
  }
  //
  // Map<String, dynamic> toJson() {
  //   final data =<String, dynamic>{};
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['artist_title'] = artistTitle;
  //   data['date_display'] = dateDisplay;
  //   data['artist_display'] = artistDisplay;
  //   data['credit_name'] = creditName;
  //   data['artwork_type_title'] = artworkTypeTitle;
  //   data['medium_display'] = mediumDisplay;
  //   data['image_id'] = imageId;
  //   return data;
  // }
}
