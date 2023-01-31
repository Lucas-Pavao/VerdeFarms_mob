import 'package:flutter/material.dart';

class CadastroFeiraModal extends StatefulWidget {
  const CadastroFeiraModal({super.key, required this.onSaved});
  final Function(String nomeFeira) onSaved;
  @override
  State<CadastroFeiraModal> createState() => _CadastroFeiraModalState();
}

class _CadastroFeiraModalState extends State<CadastroFeiraModal> {
  double height = 50;
  TextEditingController nomeFeiraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Consumer<CadastroFeiraController>(
    //   builder: (context, cadastroFeiraController, child) =>
    return AnimatedContainer(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: verifyKeyBoard() ? height : height,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOutCubic,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cadastrar Feira',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
            ),
            Column(
              children: [
                TextFormField(
                  controller: nomeFeiraController,
                  decoration: const InputDecoration(
                    labelText: 'Nome da Feira',
                    hintText: 'Nome da Feira',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => widget.onSaved(nomeFeiraController.text),
                    child: const Text('Salvar')),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }

  bool verifyKeyBoard() {
    if (MediaQuery.of(context).viewInsets.bottom == 0) {
      setState(() {
        height = MediaQuery.of(context).size.height * 0.3;
      });
      return false;
    } else {
      setState(() {
        height = MediaQuery.of(context).size.height * 0.6;
      });
      return false;
    }
  }
}
