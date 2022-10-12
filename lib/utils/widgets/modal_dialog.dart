import 'package:flutter/material.dart';

void imagepickerModal(BuildContext context,
    {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 220,
          child: Column(
            children: [
              GestureDetector(
                onTap: onCameraTap,
                child: Card(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Text(
                        'Camera',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: onGalleryTap,
                child: Card(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Text(
                        'Gallery',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ),
              ),
            ],
          ),
        );
      });
}
