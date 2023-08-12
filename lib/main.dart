import 'package:flutter/material.dart';
import 'package:flutter_eleven/models/products_fakestore.dart';
import 'package:flutter_eleven/services/fakestore_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FakeStoreProducts> products = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            Text('Id: ${products[index].id.toString()}'),
                            Text('Title: ${products[index].title!}'),
                            Image.network(products[index].image!),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            ElevatedButton(
              onPressed: () async {
                products = (await getFakeStoreProductsWithDio())!;
                setState(() {});
              },
              child: const Text('Get Data From Server'),
            ),
          ],
        ),
      ),
    );
  }
}
