import 'package:first_solo_flutter_app/models/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_services.dart';
import '../helper.dart';
import '../pages/photos_route.dart';
import 'detail_screen.dart';

class EditHabitHolder extends StatelessWidget {
  final TextEditingController newController;
  final List<Widget> bodyElements;
  final double screenWidth;
  final List<TextEditingController> controllers;
  final Function callback;

  const EditHabitHolder({super.key, required this.newController, required this.bodyElements, required this.screenWidth, required this.controllers, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Helper.redColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                //on pressed clear token and navigate to log in page
                  onPressed: () {
                    int index = controllers.indexOf(newController);
                    controllers.removeAt(index);
                    bodyElements.removeAt(index);
                    callback();
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  )),
              Expanded(
                child: TextField(
                  controller: newController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Enter new habit",
                    hintStyle:
                    TextStyle(color: Colors.white54, fontSize: 20, height: 0.8),
                  ),
                  style:
                  const TextStyle(color: Colors.white, fontSize: 20, height: 0.8),
                ),)
            ]),
      ),
    );
  }
}