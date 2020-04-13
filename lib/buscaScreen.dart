import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformaPintura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
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
        ),
        MyButton(),
        FlatButton(
          child: Icon(Icons.close, color: Color(0XDD000000), size: 50.0),
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
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlatButton(
          color: Color(0XDD000000),
          shape: CircleBorder(),
          onPressed: () => {},
          child: Icon(Icons.search, color: Color(0XFFFFFFFF), size: 50.0),
        ),
        height: 70);
  }
}
