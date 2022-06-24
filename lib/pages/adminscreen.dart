import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../login_activity/screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (builder) => HomePage())),
            icon: Icon(Icons.logout),color: themeData.primaryColor,)
        ],
        title: Image.asset(
          themeData.brightness == Brightness.light
              ? 'assets/sobGOGdark.png'
              : 'assets/sobGOGlight.png',
          height: 3.5.h,
        ),
        centerTitle: true,
        backgroundColor: themeData.backgroundColor,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: 15.w,
      ),
      body: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future _data;
  Future getPosts() async {
    var firestore = FirebaseFirestore.instance;

    QuerySnapshot qn = await firestore.collection('users').get();

    return qn.docs;
  }
  navigateToDetail(DocumentSnapshot users) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: users)));
  }
  @override
  void initState() {
    super.initState();
    _data = getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _data,
        builder: ( context ,AsyncSnapshot snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(
          child: Text("Loading... "),
        );
      }else{
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: ( context , index){
              return ListTile(
                title: Text(snapshot.data[index]['name']),
                subtitle: Text(snapshot.data[index]['email']),
                onTap: () => navigateToDetail(snapshot.data[index]),
              );
        });
      }
    });
  }
}

class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;
  const DetailPage({Key? key, required this.post}) : super(key: key);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios))
          ],
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: themeData.backgroundColor,
          leading: SizedBox(
            height: 10.w,
            width: 15.w,
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: 15.w,
          title: Image.asset(
            themeData.brightness == Brightness.light
                ? 'assets/sobGOGdark.png'
                : 'assets/sobGOGlight.png',
            height: 3.5.h,
          ),
          centerTitle: true,
        ),
      ),
      body: Card(
        child: ListTile(
          title: Column(
            children: [
              Text(
                widget.post.data().toString(),
                style: TextStyle(
                    color: themeData.primaryColor,
                    fontSize: 20,
                    backgroundColor: themeData.backgroundColor
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}