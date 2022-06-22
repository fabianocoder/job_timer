import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;

  const ProjectRegisterPage({super.key, required this.controller});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEc = TextEditingController();
  final _estimateEc = TextEditingController();
  @override
  void dispose() {
    _nameEc.dispose();
    _estimateEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          " Criar novo projeto",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextFormField(
              controller: _nameEc,
              decoration: const InputDecoration(label: Text("Nome do projeto")),
              validator: Validatorless.required("Nome obrigatorio"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _estimateEc,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Estimativa de horas"),
              ),
              validator: Validatorless.multiple([
                Validatorless.required("Estimativa obrigatoria"),
                Validatorless.number("Permitido somente numeros")
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocSelector<ProjectRegisterController, ProjectRegisterStatus,
                bool>(
              selector: (state) {
                return state == ProjectRegisterStatus.loading;
              },
              builder: (context, showLoading) {
                return Visibility(
                  visible: showLoading,
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              },
              bloc: widget.controller,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 49,
              child: ElevatedButton(
                onPressed: () async {
                  final formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    final name = _nameEc.text;
                    final estimate = int.parse(_estimateEc.text);
                    await widget.controller.register(name, estimate);
                  }
                },
                child: const Text("Salvar"),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
