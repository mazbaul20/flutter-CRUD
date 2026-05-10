
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
          ScreenBackground(context),
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

                  SizedBox(height: 20,),

                  AppDropDownStyle(
                    DropdownButton(
                        value: '2 pcs',
                        items: [
                          DropdownMenuItem(value: '', child: Text('Select Qt')),
                          DropdownMenuItem(value: '1 pcs', child: Text('1 pcs')),
                          DropdownMenuItem(value: '2 pcs', child: Text('2 pcs')),
                          DropdownMenuItem(value: '3 pcs', child: Text('3 pcs')),
                          DropdownMenuItem(value: '4 pcs', child: Text('4 pcs')),
                        ],
                        onChanged: (value){},
                        underline: Container(),
                        isExpanded: true,
                    ),
                  ),
                  SizedBox(height: 20,),

                  ElevatedButton(
                    onPressed: (){},
                    style: AppButtonStyle(),
                    child: SuccessButtonStyle('Submit'),
                    // child: Text('Create Product'),
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