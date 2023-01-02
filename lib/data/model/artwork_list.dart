import 'package:z_art/data/model/artwork.dart';

class ArtworkList{
  List<Artwork> artworks=<Artwork>[];

  ArtworkList({required this.artworks});

  ArtworkList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        artworks.add(Artwork.fromJson(v));
      });
    }
  }
}