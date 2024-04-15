import 'package:flutter/material.dart';
import 'package:ui_task_app/constants/constant.dart';
import 'package:ui_task_app/main.dart';
import 'package:ui_task_app/widget/header_section.dart';

class ZoomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap:(){
        Navigator.of(context).pop();
      },
      child: Stack(
        children: [
          // Gray background
          Container(
            width: screenWidth,
            height: screenHeight,
            color: const Color.fromRGBO(219, 219, 219, 1), // Semi-transparent gray
          ),
          // ZoomDialog content
          Center(
            child: Container(
              width: screenWidth * 0.9, // 90% of screen width
              height: screenHeight * 0.9, // 90% of screen height
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < headers.length; i++)
                      HeaderWidget(
                        iconColor: i==0? Colors.cyan: null,
                        header: headers[i],
                        data: loremIpsum,
                        showbtn: i ==0,
                        icon: i==0 ? Icons.close : null,
                        onPressed: () {
                          // Close the ZoomDialog
                          Navigator.pop(context);
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
