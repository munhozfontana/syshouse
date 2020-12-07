import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/pessoa_store.dart';

class ClienteComponentModel {
  final TextEditingController nome;
  final TextEditingController cpf;
  final TextEditingController rg;
  final TextEditingController nacionalidade;
  final TextEditingController estadoCivil;
  final TextEditingController profissao;
  final TextEditingController dataNascimento;
  final TextEditingController cnpj;
  final TextEditingController endereco;

  ClienteComponentModel({
    this.nome,
    this.cpf,
    this.rg,
    this.nacionalidade,
    this.estadoCivil,
    this.profissao,
    this.dataNascimento,
    this.cnpj,
    this.endereco,
  });

  @override
  String toString() {
    return 'ClienteComponentModel(nome: ${nome.text}, cpf: ${cpf.text}, rg: ${rg.text}, nacionalidade: ${nacionalidade.text}, estadoCivil: ${estadoCivil.text}, profissao: ${profissao.text}, dataNascimento: ${dataNascimento.text}, cnpj: ${cnpj.text}, endereco: ${endereco.text})';
  }
}

class ClienteComponent extends StatelessWidget {
  final bool isPagador;
  final PessoaStore _pessoaStore = PessoaStore();

  ClienteComponent({
    Key key,
    this.isPagador = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      curve: Curves.bounceInOut,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Observer(builder: (_) {
            return Column(
              children: [
                buildSocio(constraints),
                buildPagador(constraints),
              ],
            );
          });
        },
      ),
    );
  }

  Wrap buildSocio(BoxConstraints constraints) {
    return Wrap(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(constraints.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nome',
              ),
              controller: _pessoaStore.cliente.nome,
              onChanged: (value) => print(_pessoaStore.cliente.toString()),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(constraints.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Cpf',
              ),
              controller: _pessoaStore.cliente.cpf,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(constraints.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Rg',
              ),
              controller: _pessoaStore.cliente.rg,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(constraints.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nacionalidade',
              ),
              controller: _pessoaStore.cliente.nacionalidade,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(constraints.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Estado Cívil',
              ),
              controller: _pessoaStore.cliente.estadoCivil,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(constraints.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Profissão',
              ),
              controller: _pessoaStore.cliente.profissao,
            ),
          ),
        ),
      ],
    );
  }

  Visibility buildPagador(BoxConstraints constraints) {
    return Visibility(
      visible: isPagador,
      child: Wrap(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(
                Size(constraints.maxWidth * 0.2, 50),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Data de nascimento',
                ),
                controller: _pessoaStore.cliente.dataNascimento,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(
                Size(constraints.maxWidth * 0.2, 50),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'CNPJ',
                ),
                controller: _pessoaStore.cliente.cnpj,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(
                Size(constraints.maxWidth * 0.2, 50),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Endereço',
                ),
                controller: _pessoaStore.cliente.endereco,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
