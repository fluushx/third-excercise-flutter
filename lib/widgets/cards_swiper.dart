import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardsSwiper extends StatelessWidget {
  const CardsSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.blue,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.5,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext contex, int index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail',
                arguments: 'movie-instace'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  fadeInDuration: Duration(milliseconds: 200),
                  fit: BoxFit.cover,
                  image: NetworkImage('https://via.placeholder.com/300x400')),
            ),
          );
        },
      ),
    );
  }
}
