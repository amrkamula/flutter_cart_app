import 'package:flutter/material.dart';

import 'data.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: "Catalog",
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _secured = true;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color: Colors.black87),)),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'email',
                      ),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return 'Please, enter a text';
                        }
                        if(!(value.contains('@')&&value.contains('.com'))){
                          return 'Please, enter a valid e-mail';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex:4,
                          child: TextFormField(
                            obscureText: _secured,
                            decoration: InputDecoration(
                              hintText: 'password',
                            ),
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return 'Please, enter a text';
                              }
                              if(value.length <6){
                                return 'Password can not be less than 6 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(child: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: (){
                            setState(() {
                              _secured = !_secured;
                            });
                          },
                        ),
                        flex: 1,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text('Enter'),
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListScreen()));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListScreen extends StatefulWidget {

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color: Colors.black87),),
        backgroundColor: Colors.yellowAccent,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child:IconButton(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
              },
            ) ,)
        ],
      ),
      body: ListView.separated(itemBuilder: (context,index){
        var product = Data.allProducts[index];
        return ListTile(
          leading: Container(
            height: 40.0,
            width: 40.0,
            color: product.color,
          ),
          title: Text('${product.name}'),
          trailing: Container(
            child: (Data.boughtProductsIndicies.contains(index))?
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                  icon: Icon(Icons.check),
              onPressed:(){
                setState(() {
                  Data.boughtProductsIndicies.remove(index);
                });
              }
                ,),
            ):
            TextButton(
                onPressed: (){
                  setState(() {
                    Data.boughtProductsIndicies.add(index);
                  });
                }, child: Text('Add',style: TextStyle(color: Colors.grey)),),
          ),
        );
      }, separatorBuilder: (context,index){
        return Divider();
      }, itemCount: Data.allProducts.length),
    );
  }
}

class CartScreen extends StatelessWidget {

  double getTotalPrice(){
    double sum= 0.0;
    for(int i =0;i<Data.allProducts.length;i++){
      if(Data.boughtProductsIndicies.contains(i)){
        sum =Data.allProducts[i].price + sum;
      }
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color: Colors.black87) ,),
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex:4,
              child:Container(
                padding: EdgeInsets.all(20.0),
                child: ListView.builder(itemBuilder: (context,index){
                  var product = Data.allProducts[Data.boughtProductsIndicies[index]];
                  return Text('${product.name}',style: TextStyle(color: Colors.black,fontSize: 20.0),);
                },
                itemCount: Data.boughtProductsIndicies.length,),
              ),
            ),
            Container(
              width: double.infinity,
              height: 8.0,
              color: Colors.black,
            ),
            Expanded(
                flex:1,
                child:Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('\$${getTotalPrice()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0,color: Colors.black87),),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(color: Colors.grey[300],
                            child: TextButton(onPressed: (){}, child: Text('Buy',style: TextStyle(color: Colors.black,fontSize: 16.0),))),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}



