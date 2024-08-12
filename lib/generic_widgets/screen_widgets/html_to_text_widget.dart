import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;

class HtmlToTextWidget extends StatelessWidget {
  final String htmlContent;

  HtmlToTextWidget({required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    // Parse the HTML string
    final document = html_parser.parse(htmlContent);

    // Convert the document to plain text
    final String plainText = document.body?.text ?? '';

    return Text(
      plainText,
      style: TextStyle(fontSize: 16.0),
    );
  }
}
