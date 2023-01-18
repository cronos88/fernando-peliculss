import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pelicula_model.dart';

class PeliculasProvider {
  final String _apiKey = 'c850d18621c9b97ce40590191266bdea';
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body); // queda transformado en un mapa

    // Vamos a transformar el dato decodificado en peliculas para mostrar
    final peliculas = Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });

    return _procesarRespuesta(url);

    // final resp = await http.get(url);
    // final decodedData = json.decode(resp.body); // queda transformado en un mapa
    //
    // // Vamos a transformar el dato decodificado en peliculas para mostrar
    // final peliculas = Peliculas.fromJsonList(decodedData['results']);
    //
    // return peliculas.items;
  }

  Future<List<Pelicula>> getPopulares() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
    });

    return _procesarRespuesta(url);

    // final resp = await http.get(url);
    // final decodedData = json.decode(resp.body); // queda transformado en un mapa
    //
    // // Vamos a transformar el dato decodificado en peliculas para mostrar
    // final peliculas = Peliculas.fromJsonList(decodedData['results']);
    //
    // return peliculas.items;
  }
}
