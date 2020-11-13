import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _alcool = new TextEditingController();
  TextEditingController _gasolina = new TextEditingController();
  String _resultado = "";


  void calcular() {
    double alcool = double.tryParse(_alcool.text);
    double gasolina = double.tryParse(_gasolina.text);
    double calculo = alcool / gasolina;
    String _resultadoAux = "";

    if (alcool == null || _gasolina == null) {
      _resultadoAux = "Valor incorreto!";
    } else if (calculo >= 0.7) {
      _resultadoAux = "Abasteça com Gasolina";
    } else if (calculo < 0.7) {
      _resultadoAux = "Abasteça com Álcool";
    } else {
      _resultadoAux = "Ops...";
    }

    setState(() {
      _resultado=_resultadoAux;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Álcool vs Gasolina"),
          backgroundColor: Colors.blueGrey,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("images/logo.png"),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Saiba qual a melhor opção para abastecimento do seu carro",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text("Preço do Álcool, Ex: 3.00.")),
                  TextField(
                    controller: _alcool,
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text("Preço da Gasolina, Ex: 4.50.")),
                  TextField(
                    controller: _gasolina,
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30,bottom: 30),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      padding: EdgeInsets.all(15),
                      child: Text("Calcular", style: TextStyle(fontSize: 22)),
                      onPressed: calcular,
                    ),
                  ),
                  Text(_resultado,style: TextStyle(fontSize: 22,color: Colors.green),)
                ],
              ),
            )));
  }
}
