import 'package:flutter/material.dart';

class DynamicBox extends StatelessWidget {
  final String? customHeight;
  final String? customWidth;

  DynamicBox({this.customHeight, this.customWidth});

  parse(value) {
    return double.parse(value);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:
              MediaQuery.of(context).size.height, // Limita ao tamanho da tela
          maxWidth: MediaQuery.of(context).size.width,
          minHeight: 50, // Tamanho mínimo
          minWidth: 50,
        ),
        child: Container(
          height: parse(customHeight) ?? 100,
          width: parse(customWidth) ?? 100,
          color: Colors.blue,
          child: const Center(child: Text('Dynamic Box')),
        ),
      ),
    );
  }
}
