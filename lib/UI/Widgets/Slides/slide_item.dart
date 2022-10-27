import 'package:flutter/material.dart';
import 'package:jop_swipper/Model/model_slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  final double height;
  final double width;
  SlideItem(this.index, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            // shape: BoxShape.rectangle,
            image: DecorationImage(
                image: AssetImage(slideList[index].imageUrl),
                fit: BoxFit.cover),
          ),
        ),
        // SizedBox(
        //   height: 40.0,
        // ),
        // Text(
        //   slideList[index].title,
        //   style:
        //       TextStyle(fontSize: 22.0, color: Theme.of(context).primaryColor),
        // ),
        // SizedBox(
        //   height: 10.0,
        // ),
        // Text(
        //   slideList[index].description,
        //   textAlign: TextAlign.center,
        //   style: TextStyle(color: Colors.black54),
        // )
      ],
    );
  }
}
