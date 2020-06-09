import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutterapp/bloc/pdf/bloc.dart';

class PDFScreen extends StatefulWidget {
  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
      ),
      body: BlocBuilder(
          bloc: BlocProvider.of<PdfViewerBloc>(context),
          builder: (context, state) {
            if (state is PdfLoading) {
              Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PdfLoaded) {
            } else if (state is PdfLoadingFail) {
              return Text(state.reason);
            }
            return Container();
          }),
    );
  }
}

class PDFViewerScreen extends StatefulWidget {
  @override
  _PDFViewerScreenState createState() => new _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<PdfViewerBloc>(context),
        builder: (context, state) {
          if (state is PdfLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is PdfLoaded) {
            return PDFViewerScaffold(
                appBar: AppBar(
                  title: Text("PDF"),
                ),
                path: state.file.path);
          } else if (state is PdfLoadingFail) {
            return Scaffold(body: Center(child: Text(state.reason)));
          }
          return Container();
        });
  }
}
