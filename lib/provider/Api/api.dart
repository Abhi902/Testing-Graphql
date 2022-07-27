import 'package:flutter/material.dart';
import 'package:testing/main.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String query = '''
''';

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

class mutation extends StatefulWidget {
  const mutation({Key? key}) : super(key: key);

  @override
  State<mutation> createState() => _mutationState();
}

class _mutationState extends State<mutation> {
  @override
  Widget build(BuildContext context) {
    return Text('you want me to return something');
  }
}
