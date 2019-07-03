import 'package:flutter/material.dart';
import 'package:testing/add_todo.dart';
import 'package:testing/api_client.dart';
import 'package:testing/list_model.dart';
import 'package:testing/todomodel.dart';

class ListTest extends StatefulWidget {
  ListTest({Key key}) : super(key: key);

  _ListTestState createState() => _ListTestState();
}

ApiClient api = ApiClient();
// ListModel model;
TodoModel model;

// _fetchData() {
//   return api.getMission('https://rutum.serveo.net/posts');
// }

class _ListTestState extends State<ListTest> {
  @override
  void initState() {
    // _fetchData();
    // _getTodos();
    super.initState();
  }

  // _getTodos() async {
  //   setState(() async {
  //     model = await api.getTodo();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _buildBody(),
      routes: <String, WidgetBuilder>{
        '/home': (_) => new ListTest(),
        '/addTodo': (_) => new AddTodo(),
      },
    );
    // return Container(
    //   alignment: Alignment.center,
    //   child: _buildBody(),
    // );
  }

  _buildBody() {
    return FutureBuilder(
      future: api.getTodo(),
      builder: (BuildContext context, AsyncSnapshot<TodoModel> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              if (snapshot.data.result.count != null ) {
                return _buildList(snapshot.data.result);
              } else {
                return Center(
                  child: Text("Tidak ada data !!!"),
                );
              }
            }
            break;
          case ConnectionState.none:
            return Center(
              child: Text("Tak ada Koneksi !!!"),
            );
            break;
          default:
            return Center(
              child: Text("Tak ada KOneksi !!!"),
            );
        }
      },
    );
  }

  _buildList(ResultModel result) {
    return ListView.builder(
      itemCount: result.count,
      itemBuilder: (context, i) {
        Entries data = result.entries[i];
        return InkWell(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(child: Text(data.id)),
                Container(child: Text(data.name)),
                Container(
                  child: Text(data.description),
                ),
                Container(child: Text(data.completed)),
                // Container(child: Text(data.createdAt)),
                // Container(child: Text(data.updatedAt)),
              ],
            ),
          ),
        );
      },
    );
  }
}
