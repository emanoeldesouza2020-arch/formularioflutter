import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MinhaTela(),
    ),
  );
}

class MinhaTela extends StatefulWidget {
  @override 
  State<MinhaTela> createState() => _MinhaTelaState();
}
class _MinhaTelaState extends State<MinhaTela> {
     
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = 
        TextEditingController();
  final TextEditingController emailController =
        TextEditingController();
  final TextEditingController telefoneController =
        TextEditingController();

  @override
  void dispose(){
    nomeController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    super.dispose();
    
}
    
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: Form( key: _formKey, child :Column(
            children: [
              const Text(
                "bem vindo ao formulairo",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: "nome",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "por favor digite seu nome ";
                  }
                  if (value.length < 3) {
                    return "o nome deter pelo menos 3 caractere";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "por favor digite seu email";
                  }
                  if (!value.contains("@")) {
                    return "Email invalido";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: telefoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "telefone",
                  border: OutlineInputBorder(),
                ),
                 validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "por favor digite seu telefone";
                  }
                  if (value.length < 10) {
                    return "Telefone invalido";
                  }
                  return null;
                 },
  
                ),
              
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Formulário válido"),
                      )
                    );
                    
                    print(nomeController.text);
                    print(emailController.text);
                    print(telefoneController.text);

                    nomeController.clear();
                    emailController.clear();
                    telefoneController.clear();
                  }
                },
                child: const Text("cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
