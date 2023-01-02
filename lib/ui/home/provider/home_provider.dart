import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:z_art/data/model/artwork.dart';
import 'package:z_art/data/model/artwork_list.dart';
import 'package:z_art/data/repository/artwork_repository.dart';

import 'package:http/http.dart' as http;
class HomeProvider extends ChangeNotifier {
  final ArtworkRepository artworkRepository;

  HomeProvider({required this.artworkRepository}) {
    _getArtworkList(pageNumber.toString());
  }

  final List<Artwork> artworks = <Artwork>[];
  int pageNumber = 1;

  Future<dynamic> _getArtworkList(String page) async {
    try {
      final artworkList = await artworkRepository.getArtworkList(page);
      if(artworkList.artworks.isNotEmpty){
        artworks.addAll(artworkList.artworks);
        notifyListeners();
      }else{
        print("empty");
      }
    } catch (e) {
      notifyListeners();
      print(e);
    }
  }

  void nextPage() {
    pageNumber++;
    _getArtworkList(pageNumber.toString());
  }
}
