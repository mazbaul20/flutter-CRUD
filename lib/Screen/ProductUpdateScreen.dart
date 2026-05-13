import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Style/Style.dart';
import '../RestAPI/RestClient.dart';
import 'ProductGridViewScreen.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map<String, dynamic> productItem;
  const ProductUpdateScreen(this.productItem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  var Loading = false;

  Map<String, dynamic> FormValues = {
    "Img":"",
    "ProductCode":"",
    "ProductName":"",
    "Qty":"",
    "TotalPrice":"",
    "UnitPrice":"",
    "_id":""
  };

  @override
  void initState() {
    super.initState();
    setState(() {
      FormValues.update('Img', (value)=>widget.productItem['Img']);
      FormValues.update('ProductCode', (value)=>widget.productItem['ProductCode']);
      FormValues.update('ProductName', (value)=>widget.productItem['ProductName']);
      FormValues.update('Qty', (value)=>widget.productItem['Qty']);
      FormValues.update('TotalPrice', (value)=>widget.productItem['TotalPrice']);
      FormValues.update('UnitPrice', (value)=>widget.productItem['UnitPrice']);
      FormValues.update('_id', (value)=>widget.productItem['_id']);
    });
  }

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['ProductName']!.length==0){
      ErrorToast("Product Name Required!");
    }else if(FormValues['ProductCode']!.length==0){
      ErrorToast("Product Code Required!");
    }else if(FormValues['Img']!.length==0){
      ErrorToast("Image Link Required!");
    }else if(FormValues['UnitPrice']!.length==0){
      ErrorToast("Unit Price Required!");
    }else if(FormValues['TotalPrice']!.length==0){
      ErrorToast("Total Price Required!");
    }else if(FormValues['Qty']!.length==0){
      ErrorToast("Quantity Required!");
    }else{
      setState(() { Loading = true; });
      // await Future.delayed(Duration(seconds: 2));
      await ProductUpdateRequest(FormValues);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (builder)=>ProductGridViewScreen()),
        (Route route)=>false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Product"),),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: Loading?(Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: FormValues['ProductName'],
                    onChanged: (TextValue){
                      InputOnChange("ProductName", TextValue);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue: FormValues['ProductCode'],
                    onChanged: (TextValue){
                      InputOnChange("ProductCode", TextValue);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    initialValue: FormValues['Img'],
                    onChanged: (TextValue){
                      InputOnChange("Img", TextValue);
                    },
                    decoration: AppInputDecoration('Product Image'),
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    initialValue: FormValues['UnitPrice'],
                    onChanged: (TextValue){
                      InputOnChange("UnitPrice", TextValue);
                    },
                    decoration: AppInputDecoration('Unit price'),
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    initialValue: FormValues['TotalPrice'],
                    onChanged: (TextValue){
                      InputOnChange("TotalPrice", TextValue);
                    },
                    decoration: AppInputDecoration('Total price'),
                  ),

                  SizedBox(height: 20,),

                  AppDropDownStyle(
                    DropdownButton(
                      value: FormValues['Qty'],
                      items: [
                        DropdownMenuItem(value: '', child: Text('Select Qt')),
                        DropdownMenuItem(value: '1 pcs', child: Text('1 pcs')),
                        DropdownMenuItem(value: '2 pcs', child: Text('2 pcs')),
                        DropdownMenuItem(value: '3 pcs', child: Text('3 pcs')),
                        DropdownMenuItem(value: '4 pcs', child: Text('4 pcs')),
                      ],
                      onChanged: (TextValue){
                        InputOnChange("Qty", TextValue);
                      },
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(
                    onPressed: (){
                      FormOnSubmit();
                    },
                    style: AppButtonStyle(),
                    child: SuccessButtonStyle('Submit'),
                    // child: Text('Create Product'),
                  ),

                ],
              ),
            ))),
          )
        ],
      ),
    );
  }
}
