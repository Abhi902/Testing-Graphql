import 'package:flutter/material.dart';
import 'package:testing/main.dart';
import 'package:testing/mutation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class controller extends StatefulWidget {
  const controller({Key? key}) : super(key: key);

  @override
  State<controller> createState() => _controllerState();
}

class _controllerState extends State<controller> {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink('https://api.spacex.land/graphql/');
    final ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink as Link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(),
      ),
    );

    return GraphQLProvider(client: client, child: LoginScreen());
  }
}
