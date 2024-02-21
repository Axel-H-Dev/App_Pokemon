import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Detalle extends StatefulWidget {
  
  final heroTag;
  final WpokNom;
  final WpoKTipo;
  final WpokNum;
  final WpoKImg;
  final WpokPeso;
  final WpoKAltura;
  const Detalle({Key? key, this.heroTag,this.WpokNom,this.WpoKTipo,this.WpokNum,this .WpoKImg,this.WpoKAltura,this.WpokPeso}) : super(key: key);

  @override
  State<Detalle> createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
      widget.WpoKTipo == "Grass"? Colors.greenAccent
      :widget.WpoKTipo == "Fire"? Colors.redAccent
      :widget.WpoKTipo == "Water"? Colors.blueAccent
      :widget.WpoKTipo == "Bug"? Colors.lightGreenAccent
      :widget.WpoKTipo == "Poison"? Colors.purpleAccent
      :widget.WpoKTipo == "Electric"? Colors.amberAccent
      :widget.WpoKTipo == "Ground"? Colors.brown
      :widget.WpoKTipo == "Figthting"? Colors.orangeAccent
      :widget.WpoKTipo == "Psychic"? Colors.indigoAccent
      :widget.WpoKTipo == "Dragon"? Colors.blueGrey
      :widget.WpoKTipo == "Rock"? Colors.grey
      :widget.WpoKTipo == "Ice"? Colors.lightBlue
      :Colors.black,                                                            
      body: Stack(
        alignment: Alignment.center,
        children: [
          _Flech(),
          _NombreNumPokemon(),
          _TipoPokemon(),
          _ImagenAtras(),
          Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(children: [
                        Container(
                          width: width * 0.3,
                          child: Text(
                          "Altura",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          child: Text(
                            widget.WpoKAltura.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(children: [
                        Container(
                          width: width * 0.3,
                          child: Text(
                            "Peso:",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          child: Text(
                            widget.WpokPeso.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ]),
                    )
                  ]),
                ),
              )),
          Positioned(
              top: (height * 0.2),
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                    imageUrl:
                      widget.WpoKImg,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover),
              )),
        ],
      ),
    );
  }

  Widget _Flech() {
    return Positioned(
        top: 40,
        left: 5,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget _NombreNumPokemon() {
    return Positioned(
        top: 95,
        left: 20,
        right: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.WpokNom.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "#" + widget.WpokNum.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Widget _TipoPokemon() {
    return Positioned(
        top: 140,
        left: 25,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.WpoKTipo.toString(),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ));
  }

  Widget _ImagenAtras() {
    var height = MediaQuery.of(context).size.height;
    return Positioned(
      top: height * 0.18,
      right: -30,
      child: Image.asset("images/poke2.png"),
      height: 200,
    );
  }
}
