// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DynamicBox extends StatefulWidget {
  final double? customHeight;
  final double? customWidth;
  const DynamicBox({
    Key? key,
    this.customHeight,
    this.customWidth,
  }) : super(key: key);

  @override
  State<DynamicBox> createState() => _DynamicBoxState();
}

//Transforma Strings em doubles de forma menos verbosa

class _DynamicBoxState extends State<DynamicBox> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Verifica se os valores personalizados são maiores que o tamanho da tela
        double boxHeight = (widget.customHeight ?? constraints.maxHeight * 0.5)
            .clamp(0.0, constraints.maxHeight);
        double boxWidth = (widget.customWidth ?? constraints.maxWidth * 0.5)
            .clamp(0.0, constraints.maxWidth);

        return Center(
          child: Container(
            height: boxHeight,
            width: boxWidth,
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
