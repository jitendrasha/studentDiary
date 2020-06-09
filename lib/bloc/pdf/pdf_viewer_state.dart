import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class PdfViewerState extends Equatable {
  const PdfViewerState();
}

class InitialPdfViewerState extends PdfViewerState {
  @override
  List<Object> get props => [];
}

class PdfLoading extends PdfViewerState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PdfLoaded extends PdfViewerState {
  final File file;

  PdfLoaded(this.file);
  @override
  // TODO: implement props
  List<Object> get props => [file];
}

class PdfLoadingFail extends PdfViewerState {
  final String reason;

  PdfLoadingFail(this.reason);

  @override
  // TODO: implement props
  List<Object> get props => [reason];
}
