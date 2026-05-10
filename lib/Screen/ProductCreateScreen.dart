
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Style/Style.dart';

class ProductCreateScreen extends StatefulWidget{
  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();

}

class _ProductCreateScreenState extends State<ProductCreateScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Product"),),
      body: Stack(
        children: [
          Container(
            child: (SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value){},
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (value){},
                    decoration: AppInputDecoration('Product Code'),
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (value){},
                    decoration: AppInputDecoration('Product Image'),
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (value){},
                    decoration: AppInputDecoration('Unit price'),
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (value){},
                    decoration: AppInputDecoration('Total price'),
                  ),

                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}