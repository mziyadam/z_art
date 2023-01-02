import 'package:flutter/material.dart';
import 'package:z_art/data/model/artwork.dart';
import 'package:provider/provider.dart';
import 'package:z_art/data/repository/artwork_repository.dart';
import 'package:z_art/ui/home/provider/home_provider.dart';
import 'package:z_art/ui/widget/card_artwork.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  List<Artwork> _artworks = [];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(artworkRepository: ArtworkRepository()),
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the HomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Consumer<HomeProvider>(
                builder: (context, HomeProvider data, widget) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.artworks.length,
                  itemBuilder: (context, index) {
                    return CardArtwork(artwork: data.artworks[index]);
                  },
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  data.nextPage();
                },
                child: Text("Load More",
                  overflow:TextOverflow.visible,style: Theme.of(context).textTheme.button,
                ),
              )
            ],
          );
        })), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
