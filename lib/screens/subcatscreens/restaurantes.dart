import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantesPage extends StatefulWidget {
  _RestaurantesPageState createState() => _RestaurantesPageState();
}

class _RestaurantesPageState extends State<RestaurantesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.0),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(22, 32, 44, 1),
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              'Restaurantes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: new IconButton(
              icon: new Icon(
                CupertinoIcons.back,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      body: ListRestaurantes(),
    );
  }
}

class ListRestaurantes extends StatefulWidget {
  // ListBaresPage({Key key}) : super(key: key);

  _ListRestaurantesState createState() => _ListRestaurantesState();
}

class _ListRestaurantesState extends State<ListRestaurantes> {
  Future getClient() async {
    print('hola');
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore
        .collection('client')
        .where('tasktags', arrayContains: 'Restaurantes')
        .getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getClient(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Cargando Datos...'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  child: Card(
                    color: Color.fromRGBO(246, 247, 250, 5),
                    elevation: 1,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 30.0, height: 47.0),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FadeInImage.assetNetwork(
                            width: 47,
                            height: 47,
                            fit: BoxFit.fill,
                            placeholder: ('assets/images/seemurIsotipo.png'),
                            image: (snapshot.data[index].data['logos']),
                          ),
                        ),
                        SizedBox(
                          width: 21.0,
                          height: 47.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 72.0,
                          child: ListTile(
                            title: Container(
                              child: Text(
                                snapshot.data[index].data['taskname'],
                                style: TextStyle(
                                  fontFamily: 'HankenGrotesk',
                                  color: Color(0xff000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
