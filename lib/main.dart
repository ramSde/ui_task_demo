import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:ui_task_app/constants/constant.dart';
import 'package:ui_task_app/controller/tab_controller.dart';
import 'package:ui_task_app/screens/tabview.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TabProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tab App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void closeZoomDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
 final selectedTab = Provider.of<TabProvider>(context).selectedTab;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                headerImage,
                height: 200,
                fit: BoxFit.cover,
              ),
            const  SizedBox(height: 10),
              Text(
                headers[selectedTab],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
             const SizedBox(height: 20),
              Expanded(
                child: TabView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







