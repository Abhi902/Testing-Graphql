import 'package:flutter/material.dart';
import 'package:testing/main.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Equippp_login extends StatefulWidget {
  const Equippp_login({Key? key}) : super(key: key);

  @override
  State<Equippp_login> createState() => _Equippp_loginState();
}

class _Equippp_loginState extends State<Equippp_login> {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink('https://countries.trevorblades.com/graphql');

    final ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink as Link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: LoginScreen(),
    );
  }
}
