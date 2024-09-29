import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api.dart';

import '../model/movie_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    super.initState();
    
    // Inicializa os futuros das chamadas de API
    upcomingMovies = Api().getUpcomingMovies();
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().getTopRatedMovies();

    // Testar API separadamente para verificação
    upcomingMovies.then((movies) {
      print('Upcoming Movies: $movies');
    }).catchError((error) {
      print('Erro ao carregar upcoming movies: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center, // Garante que o conteúdo está centralizado
        children: [
          // Imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgroundHome.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo da tela
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.black12.withOpacity(0.7), // Adiciona transparência
                    foregroundColor: const Color(0xFFFFFFFF),
                    leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                    title: const Text("Movie Groove"),
                    centerTitle: true,
                    actions: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
                    ],
                  ),
                  const Text(
                    'Upcoming',
                    style: TextStyle(color: Colors.white),
                  ),
                  // Carrossel
                  FutureBuilder(
                    future: upcomingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
                        );
                      }
                      if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                        return const Center(
                          child: Text('No data available', style: TextStyle(color: Colors.white)),
                        );
                      }

                      final movies = snapshot.data as List<Movie>;
                      return CarouselSlider.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index, movieIndex) {
                          final movie = movies[index];
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 1.4,
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                      );
                    },
                  ),

                  // Popular Movies
                  const Text(
                    'Popular',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 200,
                    child: FutureBuilder(
                      future: popularMovies,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
                          );
                        }
                        if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                          return const Center(
                            child: Text('No data available', style: TextStyle(color: Colors.white)),
                          );
                        }

                        final movies = snapshot.data as List<Movie>;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            final movie = movies[index];

                            return Container(
                              width: 150,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const Text(
                    'Top Rated',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 200,
                    child: FutureBuilder(
                      future: topRatedMovies,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
                          );
                        }
                        if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                          return const Center(
                            child: Text('No data available', style: TextStyle(color: Colors.white)),
                          );
                        }

                        final movies = snapshot.data as List<Movie>;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            final movie = movies[index];

                            return Container(
                              width: 150,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
