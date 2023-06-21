import 'package:flutter/material.dart';

class LoadingScreen {
  final String? loadingText;
  final Widget? loadingImage;

  const LoadingScreen({
    this.loadingImage,
    this.loadingText = 'please wait',
  });


}