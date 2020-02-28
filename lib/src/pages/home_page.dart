import 'package:flutter/material.dart';
import 'package:validacion_form/src/blocs/provider2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Se añade para escuchar el estado de los inputs
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Container(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {

    return FloatingActionButton(
      child: Icon( Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto'),

    );
  }
}