import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Style/Style.dart';
import '../RestAPI/RestClient.dart';

class ProductUpdateScreen extends StatefulWidget {
  const ProductUpdateScreen({super.key});

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
    "UnitPrice":""
  };

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
      await ProductCreateRequest(FormValues);
      if (mounted) {
        setState(() { Loading = false; });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Product"),),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: Loading?(Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("ProductName", TextValue);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("ProductCode", TextValue);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("Img", TextValue);
                    },
                    decoration: AppInputDecoration('Product Image'),
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("UnitPrice", TextValue);
                    },
                    decoration: AppInputDecoration('Unit price'),
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
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
