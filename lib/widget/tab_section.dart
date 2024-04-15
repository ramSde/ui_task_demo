import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_task_app/constants/constant.dart';
import 'package:ui_task_app/controller/tab_controller.dart';
import 'package:ui_task_app/widget/customButton.dart';
import 'package:ui_task_app/widget/header_section.dart';
import 'package:ui_task_app/widget/zoomed_page.dart';

class TermsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedTab = Provider.of<TabProvider>(context).selectedTab;
    final String header = headers[selectedTab];
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            offset: const Offset(0, 3),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderWidget(
                header: header,
                data: loremIpsum,
                showbtn: true,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => ZoomDialog(),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    height: 40,
                    width: 50,
                    text: 'Exit',
                    color: Colors.black,
                    onPressed: () {
                      // Add functionality for exit button
                    },
                  ),
                  CustomElevatedButton(
                    height: 40,
                    width: 100,
                    text: ' | Accept',
                    color: Colors.cyan,
                    onPressed: () {
                      // Add functionality for accept button
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
