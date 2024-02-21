import 'package:flutter_application_2/pages/Detalle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/getDataController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getDataController = Get.put(GetDataController());

  @override
  void initState() {
    getDataController.getDataFromapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // ignore: avoid_unnecessary_containers
    return Obx(
      () => Scaffold(
          backgroundColor: Colors.white,
          body: !getDataController.isLoading.value
              ? Stack(
                  children: [
                    _ImagenFondo(),
                    _Titulo(),
                    Positioned(
                        top: 150,
                        bottom: 0,
                        width: width,
                        child: Column(
                          children: [
                            Expanded(
                                child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 1.4),
                                    itemCount: 151,
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        child: InkWell(
                                          child: SafeArea(
                                              child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)),
                                                color: getDataController
                                                            .getDataModel
                                                            .value
                                                            .result[index]
                                                            .pokTipo ==
                                                        "Grass"
                                                    ? Colors.greenAccent
                                                    : getDataController
                                                                .getDataModel
                                                                .value
                                                                .result[index]
                                                                .pokTipo ==
                                                            "Fire"
                                                        ? Colors.redAccent
                                                        : getDataController
                                                                    .getDataModel
                                                                    .value
                                                                    .result[
                                                                        index]
                                                                    .pokTipo ==
                                                                "Water"
                                                            ? Colors.blueAccent
                                                            : getDataController
                                                                        .getDataModel
                                                                        .value
                                                                        .result[
                                                                            index]
                                                                        .pokTipo ==
                                                                    "Bug"
                                                                ? Colors
                                                                    .lightGreenAccent
                                                                : getDataController
                                                                            .getDataModel
                                                                            .value
                                                                            .result[index]
                                                                            .pokTipo ==
                                                                        "Poison"
                                                                    ? Colors.purpleAccent
                                                                    : getDataController.getDataModel.value.result[index].pokTipo == "Electric"
                                                                        ? Colors.amberAccent
                                                                        : getDataController.getDataModel.value.result[index].pokTipo == "Ground"
                                                                            ? Colors.brown
                                                                            : getDataController.getDataModel.value.result[index].pokTipo == "Fighting"
                                                                                ? Colors.orangeAccent
                                                                                : getDataController.getDataModel.value.result[index].pokTipo == "Psychic"
                                                                                    ? Colors.indigoAccent
                                                                                    : getDataController.getDataModel.value.result[index].pokTipo == "Dragon"
                                                                                        ? Colors.blueGrey
                                                                                        : getDataController.getDataModel.value.result[index].pokTipo == "Rock"
                                                                                            ? Colors.grey
                                                                                            : getDataController.getDataModel.value.result[index].pokTipo == "Ice"
                                                                                                ? Colors.lightBlueAccent
                                                                                                : Colors.black),
                                            child: Stack(
                                              children: [
                                                _PokebolaInterna(),
                                                _Pokemon(index),
                                                _NombrePokemon(index),
                                                _TipoPokemon(index)
                                              ],
                                            ),
                                          )),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => Detalle(
                                                          heroTag: index,
                                                          WpokNom:
                                                              getDataController
                                                                  .getDataModel
                                                                  .value
                                                                  .result[index]
                                                                  .pokNom,
                                                          WpoKTipo:
                                                              getDataController
                                                                  .getDataModel
                                                                  .value
                                                                  .result[index]
                                                                  .pokTipo,
                                                          WpokNum:
                                                              getDataController
                                                                  .getDataModel
                                                                  .value
                                                                  .result[index]
                                                                  .pokNum,
                                                          WpoKImg:
                                                              getDataController
                                                                  .getDataModel
                                                                  .value
                                                                  .result[index]
                                                                  .pokeImag,
                                                          WpoKAltura:
                                                              getDataController
                                                                  .getDataModel
                                                                  .value
                                                                  .result[index]
                                                                  .pokAltura,
                                                          WpokPeso:
                                                              getDataController
                                                                  .getDataModel
                                                                  .value
                                                                  .result[index]
                                                                  .pokPeso,
                                                        )));
                                          },
                                        ),
                                      );
                                    }))
                          ],
                        ))
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }

  Widget _ImagenFondo() {
    return Positioned(
      top: -50,
      right: -70,
      child:
          Image.asset("images/pokkebola.png", fit: BoxFit.fitWidth, width: 300),
    );
  }

  Widget _Titulo() {
    return Positioned(
        top: 100,
        left: 20,
        child: Text(
          "Pokedex",
          style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontSize: 40),
        ));
  }

  Widget _PokebolaInterna() {
    return Positioned(
      top: 8,
      bottom: -35,
      left: 100,
      width: 100,
      child: Image.asset(
        "images/poke2.png",
        height: 50,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _Pokemon(index) {
    return Positioned(
      bottom: 5,
      right: 5,
      child: Hero(
        tag: index,
        child: CachedNetworkImage(
          imageUrl: getDataController.getDataModel.value.result[index].pokeImag,
          height: 90,
          fit: BoxFit.fitWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget _NombrePokemon(index) {
    return Positioned(
        top: 35,
        left: 16,
        child: Text(
          getDataController.getDataModel.value.result[index].pokNom,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white),
        ));
  }

  Widget _TipoPokemon(index) {
    return Positioned(
      bottom: 35,
      left: 16,
      child: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 9, bottom: 8),
          child: Text(
            getDataController.getDataModel.value.result[index].pokTipo
                .toString(),
            style: TextStyle(color: Colors.white, shadows: [
              BoxShadow(color: Colors.green, offset: Offset(0, 0))
            ]),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            color: Colors.black.withOpacity(0.5)),
      ),
    );
  }
}
