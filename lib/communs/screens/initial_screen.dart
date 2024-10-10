import 'package:dynamic_image/communs/componets/dynamic_box.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key, required this.title});

  final String title;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  // Chave global para o formulário
  final _formKey = GlobalKey<FormState>();

  // Controladores para os TextFormFields
  final TextEditingController _customWidthController = TextEditingController();
  final TextEditingController _customHeigthController = TextEditingController();

  double customHeight = 0;
  double customWidth = 0;

  @override
  void dispose() {
    // Libera os recursos usados pelos controllers
    _customWidthController.dispose();
    _customHeigthController.dispose();
    super.dispose();
  }

  void _updateDimensions() {
    // Atualiza a largura e a altura a partir dos controladores
    setState(() {
      // Tenta converter os textos para double
      if (_customHeigthController.text.isNotEmpty) {
        customHeight = double.tryParse(_customHeigthController.text) ?? 0;
      }
      if (_customWidthController.text.isNotEmpty) {
        customWidth = double.tryParse(_customWidthController.text) ?? 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Insira um valor', style: TextStyle(fontSize: 24),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _customHeigthController,
                    onChanged: (value) =>
                        _updateDimensions(), // Atualiza ao digitar
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This value is invalid';
                      }
                      return null; // Retorna null se a validação for bem-sucedida
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Height'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _customWidthController,
                    onChanged: (value) =>
                        _updateDimensions(), // Atualiza ao digitar
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This value is invalid';
                      }
                      return null; // Retorna null se a validação for bem-sucedida
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Width'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                // Exibe o DynamicBox ao vivo
                SizedBox(
                  height: customHeight > 0
                      ? customHeight
                      : 100, // Altura padrão se não tiver valor
                  width: customWidth > 0
                      ? customWidth
                      : 100, // Largura padrão se não tiver valor
                  child: DynamicBox(
                    customHeight: customHeight,
                    customWidth: customWidth,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
