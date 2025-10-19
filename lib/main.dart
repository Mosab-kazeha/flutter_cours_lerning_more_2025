import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_statefull/model/prodact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProdactPageWithModel());
  }
}

Dio dio = Dio();
late Response temp;

class ProdactPageWithOutModel extends StatelessWidget {
  const ProdactPageWithOutModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            temp = await dio.delete("https://dummyjson.com/products/1");
            print(temp.data);
          },
          child: Text('temp.statusMessage.toString()'),
        ),
      ),
    );
  }
}

class ProdactPageWithModel extends StatefulWidget {
  const ProdactPageWithModel({super.key});

  @override
  State<ProdactPageWithModel> createState() => _ProdactPageWithModelState();
}

class _ProdactPageWithModelState extends State<ProdactPageWithModel> {
  late ProdactModel? prodact = ProdactModel(
    id: 0,
    title: 'get the data',
    category: 'category',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            temp = await dio.get("https://dummyjson.com/products/1");
            prodact = ProdactModel.formMap(temp.data);
            setState(() {});
            print(temp.data);
          },
          child: Text(prodact!.title.isEmpty ? "get data" : prodact!.title),
        ),
      ),
    );
  }
}
