import 'package:film_uygulamasi/DetaySayfa.dart';
import 'package:film_uygulamasi/Filmler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Filmler>> filmleriGetir() async{
    var filmlerListe = <Filmler>[];

    var f1 = Filmler(1, "Anadoluda", "anadoluda.png", 15.99);
    var f2 = Filmler(2, "Django", "django.png", 9.99);
    var f3 = Filmler(3, "Inception", "inception.png", 7.99);
    var f4 = Filmler(4, "Interstellar", "interstellar.png", 21.99);
    var f5 = Filmler(5, "The Hateful Eight", "thehatefuleight.png", 5.99);
    var f6 = Filmler(6, "The Pianist", "thepianist.png", 17.99);

    filmlerListe.add(f1);
    filmlerListe.add(f2);
    filmlerListe.add(f3);
    filmlerListe.add(f4);
    filmlerListe.add(f5);
    filmlerListe.add(f6);

    return filmlerListe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              itemCount: filmlerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemBuilder: (context,indeks){
                var film = filmlerListesi[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("fotolar/${film.film_foto_adi}"),
                        ),
                        Text(film.film_adi, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Text("${film.film_fiyat} \u{20BA}", style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                );
              },
            );
          } else{
            return Center();
          }
        },
      ),

    );
  }
}
