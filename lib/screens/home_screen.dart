import 'package:flutter/material.dart';
import 'package:third_project_moves/widgets/cards_swiper.dart';
import 'package:third_project_moves/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search_off_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //listado cardSwiper
              //tarjetas principales
              CardsSwiper(),
              //slider peliculas
              MovieSlider(),
            ],
          ),
        ));
  }
}
