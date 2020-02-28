import 'package:flutter/material.dart';
import 'package:validacion_form/src/utils/utils.dart' as utils;
import 'package:validacion_form/src/models/producto_model.dart';

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  ProductoModel producto = new ProductoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual, ), 
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt, ), 
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
      ),
      onSaved: (value)=>producto.titulo = value,
      validator: ( value ){
          if (value.length < 3){
            return 'Ingrese un nombre de producto valido';
          }
          else{
            return null;
          }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value){
        if (utils.isNumber(value))
          return null;
        else
          return 'Sólo números';
      },
    );
  }

  Widget _crearBoton() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.deepPurple,
        textColor: Colors.white,
        label: Text('Guardar'),
        icon: Icon(Icons.save),
        onPressed: _submit,
      ),
    );
  }

  void _submit(){
    if  (!formKey.currentState.validate() ){
      return;
    }

    formKey.currentState.save();

    print('Todo ok');
    print('Producto: ${producto.titulo}');
    print('\$ ${producto.valor}');
    print('\$ ${producto.disponible}');
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible, 
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(
        (){
          producto.disponible = value;
        }
      ),
    );
  }
}