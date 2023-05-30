import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:imagine_cup_software/read/pdfSelect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfView extends StatefulWidget {
  String pdfPath;
  String title;
  PdfView({required this.pdfPath, required this.title});

  @override
  State<PdfView> createState() => _PdfViewState();
}

var byt;
bool loading = true;

class _PdfViewState extends State<PdfView> {
  loadAsset(String path) async {
    setState(() {
      loading = true;
    });
    final data = await rootBundle.load(path);
    final bytdata = data.buffer.asUint8List();
    setState(() {
      byt = bytdata;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAsset(widget.pdfPath);
  }

  // Future<File> _storeFile(String url, List<int> bytes) async{
  //   final filename = basename(url)
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> PdfSelect()));
            },
          ),
          centerTitle: true,
          title: Text(widget.title),
          backgroundColor: Color(0xff19876A),
        ),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : PDFView(
                // filePath: "assets/pdf/maths.pdf",
                pdfData: byt,
                autoSpacing: false,
              ),
      ),
    );
  }
}
