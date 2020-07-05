import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();

  final _passController = TextEditingController();

  final _adressController = TextEditingController();

  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(builder: (context,child,model){
        if(model.isLoading) return Center(child: CircularProgressIndicator(),);

        return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Nome Completo"),
                controller: _nameController,
                keyboardType: TextInputType.text,
                validator: (text){
                  if (text.isEmpty) return "Nome Invalido";
                },
              ),
              SizedBox(
                height: 16.0,
              ),TextFormField(
                decoration: InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (text){
                  if (text.isEmpty || !text.contains("@")) return "Email Invalido";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Senha"),
                obscureText: true,
                controller: _passController,
                validator: (text){
                  if(text.isEmpty || text.length <6) return "Senha Invalida";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Endereço"),
                controller: _adressController,
                validator: (text){
                  if(text.isEmpty) return "Endereço Invalida";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(height: 44.0,child: RaisedButton(
                onPressed: () {
                  if(_formKey.currentState.validate()){

                    Map<String,dynamic> userdata = {
                      "name":_nameController.text,
                      "email":_emailController.text,
                      "addres":_adressController.text,
                    };
                    model.signUp(userData: userdata, pass: _passController.text, onSuccess: _onSuccess, onFail: _onFail);
                  }
                },
                child: Text(
                  "Criar conta",
                  style: TextStyle(fontSize: 18.0),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
              ),)
            ],
          ),
        );
      })
    );
  }

  void _onSuccess(){

  }

  void _onFail(){

  }
}

