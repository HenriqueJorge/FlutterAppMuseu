import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int escolha = 1;
  String nome ;
  String senha;
  
  void setNome(nomeA){
    nome = nomeA;
  }

  void setSenha(senhaA){
    senha = senhaA;
  }

  void validadorUser(){
    if(nome == 'Admin' && senha == 'Admin'){
      buscando();
    }
  }

  void buscando() {
      setState(() {
        escolha = 2;
        new Future.delayed(new Duration(seconds: 3), pintura);
      });
  }

  void inicio(){
    setState(() {
      escolha = 1;
    });
  }

  void entrar(){
    setState(() {
      escolha = 4;
    });
  }

  void cadastrar(){
    setState(() {
      escolha = 5;
    });
  }

  Future pintura() async{
        setState((){
          escolha = 3;
        });
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2196F3),
      body:escolha > 1 ? escolha > 2 ? escolha > 3 ? escolha > 4 ? RegistrationScreen(inicio) : ContaEntrada(setNome,setSenha,validadorUser) :InformaPintura(inicio,buscando) :  Busca() : Center(child: Container(child : Init(buscando,entrar,cadastrar),height: 300,))   
      );      

  }
}

class Init extends StatelessWidget {
  final Function functiona;
  final Function functionb;
  final Function functionc;

  Init(this.functiona,this.functionb,this.functionc);
  @override
  Widget build(BuildContext context) {
    return Center(
        child:Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Container(child: Image(
          image: AssetImage("asserts/catavento.png"),
          width: 100,
        ),),Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(child: Botao('Visitante',functiona)),
                Container(child: Botao('Conta',functionb)),
                Container(child: Botao('Cadastro',functionc))
              ]),
        )],
      ));
  }
}

class Botao extends StatelessWidget {
  final String nome;
  final Function t;
  Botao(this.nome,this.t); //

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(
          '$nome',
          style: TextStyle(fontSize: 20.0, color: Color(0XFFFFFFFF)),
        ),
        color: Color(0XDD000000),
        splashColor: Color(0X4DFFFFFF),
        onPressed: () {
          t();
        },
      ),
      width: 300,
    );
  }
}

class Busca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2196F3),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(child :SpinKitCubeGrid(color: Color(0XDD000000), size: 150)),
            Container(child :Text("Buscando...",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),))
          ]),
        height: 300,),
      ),
    );
  }
}

class InformaPintura extends StatelessWidget {
  Function voltaInicio;
  Function buscar;

  InformaPintura(this.voltaInicio,this.buscar);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2196F3),
      body: Center(
        child: Container(
          child: ImagemPintura(),
          height: 500,
        ),
      ),
      bottomNavigationBar:
        Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FlatButton(
          child: Icon(Icons.home, color: Color(0XDD000000), size: 50.0),
          onPressed: () {voltaInicio();},
        ),
        MyButton(buscar),
        FlatButton(
          child: Icon(Icons.close, color: Color(0XDD000000), size: 50.0),
          onPressed: () {voltaInicio();},
        ),
      ]),height:100,
    ),);
  }
}

class ImagemPintura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            child: Image(
          image: AssetImage("asserts/pintura.jpg"),
          width: 400,
        ),
        ),
        Container(
          child: Text(
            'Noite Estrelada é uma pintura de Vincent van Gogh de 1889. A obra retrata a vista da janela de um quarto do hospício de Saint-Rémy-de-Provence',
            style: TextStyle(fontSize: 20),
          ),
          color: Colors.grey,
          width: 400,
        )
      ],
    ));
  }
}

class MyButton extends StatelessWidget {
  Function buscarDenovo;

  MyButton(this.buscarDenovo);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlatButton(
          color: Color(0XDD000000),
          shape: CircleBorder(),
          onPressed: () => {buscarDenovo()},
          child: Icon(Icons.search, color: Color(0XFFFFFFFF), size: 50.0),
        ),
        height: 70);
  }
}

class ContaEntrada extends StatefulWidget {

  Function nome;
  Function senha;
  Function entra;

  ContaEntrada(this.nome,this.senha,this.entra);

  @override
  _HomeState createState() => _HomeState(nome,senha,entra);
}

class _HomeState extends State<ContaEntrada> {

  final _formKey = GlobalKey<FormState>();
  Function setNomeUser;
  Function setSenhaUser;
  Function botaoConfirmar;

  final controllerNome = TextEditingController();
  final controllerSenha = TextEditingController();

  _HomeState(this.setNomeUser,this.setSenhaUser,this.botaoConfirmar);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "asserts/museu.jpg",
          fit: BoxFit.cover,
          height: 500.0,
        ),
        Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 70.0, left: 30.0, right: 30.0),
                    child: Icon(
                      Icons.toys,
                      size: 100.0,
                    ),
                  ),
                  buildTextField("Usuário",controllerNome),
                  buildTextField("Senha",controllerSenha),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          setNomeUser(controllerNome.text);
                          setSenhaUser(controllerSenha.text);
                          botaoConfirmar();},
                        child: Text(
                          "ENTRAR",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      child: Text(
                        "Não possui uma conta?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Row(
                      children: <Widget>[
                        ImageIcon(
                          AssetImage("asserts/unifacisa_logo.png"),
                          size: 50.0,
                        ),
                        ImageIcon(
                          AssetImage("asserts/lti_logo.png"),
                          size: 40.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Color(0XFF2196F3),
        ),
      ],
    );
  }
}

Widget buildTextField(String label, TextEditingController texto ){
  return Container(
    padding: EdgeInsets.only(bottom: 15.0),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
      style: TextStyle( 
        color: Colors.black,
        fontSize: 20.0,
      ),controller: texto,
    ),
  );
}

class RegistrationScreen extends StatelessWidget {
  Function init;

  RegistrationScreen(this.init); 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: 80.0, bottom: 20.0, left: 10.0, right: 10.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildTextField2("Nome"),
                  buildTextField2("Telefone"),
                  buildTextField2("CEP"),
                  buildTextField2("Endereço (Rua e Número)"),
                  buildTextField2("Bairro"),
                  buildTextField2("Complemento"),
                  buildTextField2("Usuário"),
                  buildButtonCreate("CADASTRAR"),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          init();
                        },
                        child: Text(
                          "JÁ POSSUI UMA CONTA?",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        color: Color(0XFF2196F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Color(0XFF2196F3),
        ),
      ],
    );
  }
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack();
  }
}

Widget buildButtonCreate(String label) {
  return Padding(
    padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
    child: Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    ),
  );
}

Widget buildTextField2(String label) {
  return Container(
    padding: EdgeInsets.only(bottom: 15.0),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
    ),
  );
}

