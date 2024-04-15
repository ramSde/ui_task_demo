import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class HeaderWidget extends StatelessWidget {
  final String header;
  final String data;
  final bool showbtn;
  final Function()? onPressed;
  final IconData? icon;
  final Color? iconColor;

  const HeaderWidget({
    required this.header,
    required this.data,
    required this.showbtn,
    this.onPressed,
    this.iconColor,
    this.icon,
  });

  Future<void> saveFile(String filename, BuildContext context) async {
    try {
      
     
      final dir = await getTemporaryDirectory();
      var filename = "${dir.path}/filename.pdf";

      final file = File(filename);
     
       final ByteData data = await rootBundle.load('assets/pdfs/privacy.pdf');
            final bytes = data.buffer.asUint8List();
            await file.writeAsBytes(bytes);
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final filepath = await FlutterFileDialog.saveFile(params: params);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File downloaded successfully.'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error downloading file: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              header,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            showbtn
                ? Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.download_rounded,
                          color: iconColor ?? Colors.black,
                        ),
                        onPressed: () {
                          saveFile("privacy.pdf",
                              context);
                        },
                      ),
                      IconButton(
                        icon: icon == null
                            ? Icon(Icons.zoom_in_map_outlined)
                            : Icon(icon),
                        onPressed: onPressed,
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          data,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
