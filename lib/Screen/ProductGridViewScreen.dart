import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';
import '../Style/Style.dart';
import 'ProductCreateScreen.dart';
import 'ProductUpdateScreen.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List ProductList = [];
  bool Loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    Loading = true;

    var data = await ProductGridViewListRequest();
    setState(() {
      ProductList = data;
      Loading = false;
    });
  }

  DeleteItem(id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete !"),
          content: Text("Do you want to delete this product?"),
          actions: [
            OutlinedButton(
              onPressed: () async {
                Navigator.pop(context);
                setState(() {
                  Loading = true;
                });
                await ProductDeleteRequest(id);
                CallData();
              },
              child: Text("yes"),
            ),

            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  GoToUpdate(context,productItem){
    Navigator.push(context, MaterialPageRoute(builder: (builder){
      return ProductUpdateScreen(productItem);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List")),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: Loading? Center(child: CircularProgressIndicator()): RefreshIndicator(
                    child: GridView.builder(
                      itemCount: ProductList.length,
                      gridDelegate: ProductGridViewStyle(),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.network(
                                  ProductList[index]['Img'],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(ProductList[index]['ProductName']),
                                    SizedBox(height: 10),
                                    Text("Price: "+ProductList[index]['UnitPrice']+" BDT"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            GoToUpdate(context, ProductList[index]);
                                          },
                                          child: Icon(CupertinoIcons.ellipsis_vertical_circle,size: 18,color: colorGreen,),
                                        ),
                                        SizedBox(width: 4),
                                        OutlinedButton(
                                          onPressed: () {
                                            DeleteItem(ProductList[index]['_id']);
                                          },
                                          child: Icon(CupertinoIcons.delete, size: 18, color: colorRed,),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    onRefresh: () async {
                      await CallData();
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder){
          return ProductCreateScreen();
        }));
      },child: Icon(Icons.add),),
    );
  }
}
