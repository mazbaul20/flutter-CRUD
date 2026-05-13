import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Style/Style.dart';

Future<List> ProductGridViewListRequest() async {
  var URL = Uri.parse("http://10.0.2.2:8000/api/v1/products");
  var PostHeader = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };

  var response = await http.get(URL, headers: PostHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast("Product List Successfully Loaded");
    return ResultBody['data'];
  } else {
    ErrorToast("Request fail ! try again");
    return [];
  }
}

Future<bool> ProductCreateRequest(FormValues) async {
  var URL = Uri.parse("http://10.0.2.2:8000/api/v1/products");

  var PostBody = json.encode(FormValues);
  var PostHeader = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };

  var response = await http.post(URL, headers: PostHeader, body: PostBody);
  // print("Response Status: ${response.statusCode}");
  // print("Response Body: ${response.body}");
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast("Product Created Successfully");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> ProductDeleteRequest(id) async {
  var URL = Uri.parse("http://10.0.2.2:8000/api/v1/products/"+id);
  var PostHeader = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };

  var response = await http.delete(URL, headers: PostHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast("Product Deleted Successfully");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}