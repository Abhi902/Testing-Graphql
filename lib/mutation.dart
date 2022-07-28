import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String adduser = """
 mutation insertUser(\$name: String!, \$rocket: String!) {
        insert_users(objects: {
          name: \$name,
          rocket: \$rocket,
        }) {
          returning {
            name
            rocket
          }
        }
      }
    """;

TextEditingController rocket = new TextEditingController();
TextEditingController name = new TextEditingController();

class mutation extends StatefulWidget {
  const mutation({Key? key}) : super(key: key);

  @override
  State<mutation> createState() => _mutationState();
}

class _mutationState extends State<mutation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Mutation(
        options: MutationOptions(
            document: gql(adduser),
            fetchPolicy: FetchPolicy.noCache,
            onCompleted: (data) {
              print(data);
            }),
        builder: (RunMutation runMutation, QueryResult? result) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  controller: rocket,
                  decoration: InputDecoration(
                    hintText: 'Rocketname',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFE05971), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFE05971), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'yourname',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFE05971), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFE05971), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    runMutation({'name': name.text, 'rocket': rocket.text});
                  },
                  child: Text('SUBMIT'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
/**/
