import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/home/main4.jpg"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  }),
            ),
            Positioned(
              top: 20,
              right: 10,
              child: Chip(
                label: Text("Michael Jenkins"),
                elevation: 5,
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              left: 15,
              right: 15,
              bottom: 20,
              child: Container(
                height: 230,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        offset: Offset(1, 1),
                        blurRadius: 3.0,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stack(
//             children: [
//               Image.asset(
//                 "assets/images/home/main4.jpg",
//                 fit: BoxFit.fitHeight,
//               ),
//               Positioned(
//                 top: 15,
//                 left: 10,
//                 child: IconButton(
//                     icon: Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {}),
//               ),
//               Positioned(
//                 // bottom: 100,
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   color: Colors.red,
//                   width: double.infinity,
//                   height: 500,
//                 ),
//               )
//             ],
//           ),
