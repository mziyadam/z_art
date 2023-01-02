import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:z_art/data/model/artwork.dart';

class CardArtwork extends StatelessWidget {
  final Artwork artwork;

  CardArtwork({required this.artwork});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://www.artic.edu/iiif/2/${artwork.imageId}/full/843,/0/default.jpg",
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${artwork.title} (${artwork.dateDisplay})",
              style: Theme.of(context).textTheme.headline6,
              overflow: TextOverflow.visible,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,12.0),
            child: Text(
              "by ${artwork.artistDisplay}",
              style: Theme.of(context).textTheme.caption,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
