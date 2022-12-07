
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jop_swipper/Model/model_profile.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.profile}) : super(key: key);
  final Information profile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 200,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(5.0),
             child: Text("Description",         style: const TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w800,
                              fontSize: 21,
                            ),),
           ),
           SizedBox(height: 5,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                   
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3) ,
                        child: Text( profile.description,textAlign: TextAlign.center,),
                      ),
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10.0),
                                   
                                  )),
                  ),

          ],
        ),
      );
    });
      },
      child: Container(
        height: 500,
        width: 340,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  profile.imageAsset,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 80,
                width: 340,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        profile.name,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w800,
                          fontSize: 21,
                        ),
                      ),
                      Text(
                        profile.distance,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
