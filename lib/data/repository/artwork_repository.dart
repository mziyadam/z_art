import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:z_art/data/model/artwork_list.dart';

class ArtworkRepository {
  Future<ArtworkList> getArtworkList(String page) async{
    final jsonString = await http.get(Uri.parse(
        'https://api.artic.edu/api/v1/artworks?page=$page'));
    if (jsonString.statusCode==200){
      return ArtworkList.fromJson(jsonDecode(jsonString.body));
    }else{
      throw Exception("error");
    }
  }
}