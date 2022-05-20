import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:vcbn/main.dart';


class  InsertProduct extends StatefulWidget {
  @override
  _InsertProductState createState() => _InsertProductState();
}


class _InsertProductState extends State<InsertProduct> {
var formkey = GlobalKey<FormState>();
var name = TextEditingController();
var desc = TextEditingController();

insert() async{
  var res = await http.post(Uri.parse( "https://serene-brushlands-26785.herokuapp.com/products"),
  body: {"name" : name.text, "desc" : desc.text},
  headers : {
    "Content-Type" : "application/x-www-form-urlencoded"
      }
  );
  return res;
}
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center
          , mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key:formkey ,
              child: Column(
                children: [
                        TextFormField(
                          validator: (value){
                            if(value == null){
                              return "you you" ;
                            }
                            return null;
                          },
                          controller: name,
                        ),
                  SizedBox(height: 10,),
                  TextFormField(
                    validator: (value){
                      if(value == null){
                        return "you you" ;
                      }
                      return null;
                    },
                    controller: desc,
                  ),
                  SizedBox(height: 10,),
                  TextButton(onPressed:(){
                    insert();
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>MyApp()
                    ));
                  },
                      child: Text("insert product")
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

