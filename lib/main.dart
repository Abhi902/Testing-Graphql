import 'package:flutter/material.dart';
import 'package:testing/mutation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: LoginScreen(),
    ),
  );
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('testing'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => mutation()));
              },
              child: Icon(Icons.ac_unit_outlined)),
          Container(
            height: 600,
            child: Query(
              options: QueryOptions(
                document: gql(r"""  
           query ExampleQuery {
            histories {
                  title
                    }
                 }
            """),
              ),
              builder: (QueryResult result,
                  {VoidCallback? refetch, FetchMore? fetchMore}) {
                if (result.data == null) {
                  return Text(
                    'no data found',
                    style: TextStyle(color: Colors.black),
                  );
                }
                print(result.data);
                return Container(
                  height: 400,
                  color: Colors.black,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 20,
                          child: Text(
                              '${result.data?['histories'][index]['title']}'));
                    },
                    itemCount: result.data?['histories']?.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*


 AnimationController? controller;
  Animation? animation;

 void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    controller!.forward();
    animation = CurvedAnimation(parent: controller!, curve: Curves.bounceInOut);

    animation!.addListener(() {
      setState(() {});
    });
  }


TextEditingController username = TextEditingController();
TextEditingController fullname = TextEditingController();

Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    'Testing',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Color(0XffE05971),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    helperStyle: TextStyle(
                      color: Colors.black,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: fullname,
                  decoration: InputDecoration(
                    hintText: 'Fullname',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0XffE05971), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0XffE05971), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Color(0XffE05971),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        print(username.text);
                        print(fullname.text);
                        insert({
                          "user_name": username.text,
                          "full_name": fullname.text
                        });
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'SUBMIT',
                      ),
                    ),
                  ),
                ),
                Text('Result :${result?.data?.toString()}'),
              ],
            ),
          );*/
