import 'package:flutter/material.dart';
import 'package:testing/api_client.dart';
import 'package:testing/list_test.dart';

class AddTodo extends StatefulWidget {
  AddTodo({Key key}) : super(key: key);

  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  ApiClient api = new ApiClient();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = new TextEditingController();
  TextEditingController _description = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Card(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                    maxLines: 1,
                    controller: _name,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        hintText: "Todo Name"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Name Cannot be Empty";
                      }
                    }),
              ),
              Card(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                    controller: _description,
                    maxLines: 4,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        hintText: "Description"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Descriptions Cannot be Empty";
                      }
                    }),
              ),
              MaterialButton(
                color: Colors.lightBlue,
                height: 45,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Map<String, dynamic> data = {
                      "name": _name.text,
                      "description": _description.text
                    };
                    api.addTodo(data).then((result) {
                      if (result["status" == "success"]) {
                        print("Last Result = $result");
                      } else {
                        print("status : ${result["description"]}");
                      }
                    });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ListTest()));
                    print(data);
                  }
                },
                child: Text(
                  "Save Todo".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
