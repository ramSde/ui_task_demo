import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_task_app/constants/constant.dart';
import 'package:ui_task_app/controller/tab_controller.dart';
import 'package:ui_task_app/widget/tab_section.dart';

class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            tabs: [
              for (int i = 0; i < headers.length; i++)
                Consumer<TabProvider>(
                  builder: (context, tabProvider, _) => Tab(
                    child: Text(
                      headers[i],
                      style: TextStyle(
                        color: tabProvider.selectedTab == i
                            ? Colors.cyan // Change text color when selected
                            : Colors.black, // Use default text color
                      ),
                    ),
                  ),
                ),
            ],
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3,
                color: Colors.cyan, // Color of the underline
              ),
            ),
            onTap: (index) {
              Provider.of<TabProvider>(context, listen: false)
                  .setSelectedTab(index);
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: TermsSection(),
            ),
          ),
        ],
      ),
    );
  }
}

