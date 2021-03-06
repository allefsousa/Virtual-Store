import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:lojavirtual/screen/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();


  final _passController = TextEditingController();

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignUpScreen())
              );
            },
            child: Text(
              "Cria conta",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            textColor: Colors.white,
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(builder: (context,child,model){
        if(model.isLoading) return Center(child: CircularProgressIndicator(),);

        return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: (text){
                  if (text.isEmpty || !text.contains("@")) return "Email Invalido";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _passController,
                decoration: InputDecoration(hintText: "Senha"),
                obscureText: true,
                validator: (text){
                  if(text.isEmpty || text.length <6) return "Senha Invalida";
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    if(_emailController.text.isEmpty){
                      _onEmailReset();
                    }else{
                      model.recoverPass(_emailController.text);
                      _onEmailSende();
                    }

                  },
                  child: Text(
                    "Esqueci minha senha",
                    textAlign: TextAlign.right,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(height: 44.0,child: RaisedButton(
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    model.signIn(email: _emailController.text, pass: _passController.text, onSuccess: _onSuccess, onFail: _onFail);
                  }
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18.0),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
              ),)
            ],
          ),
        );
      }),
    );
  }

  void _onSuccess(){
      Navigator.of(context).pop();
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao entrar."),backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),)
    );
  }

  void _onEmailReset(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Insira seu email para recuperacao"),backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),)
    );
  }

  void _onEmailSende(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Confira seu email"),backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),)
    );
  }
}
