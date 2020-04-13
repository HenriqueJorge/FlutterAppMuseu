import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int escolha = 1;
  
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

  Future pintura() async{
        setState((){
          escolha = 3;
        });
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2196F3),
      body:escolha > 1 ? escolha > 2 ? InformaPintura(inicio,buscando) :  Busca() : Center(child: Container(child : Init(buscando,buscando),height: 300,))   
      );      

  }
}

class Init extends StatelessWidget {
  final Function functiona;
  final Function functionb;

  Init(this.functiona,this.functionb);
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
                Container(child: Botao('Cadastro',functionb))
              ]),
          height: 120,
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