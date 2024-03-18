// ignore_for_file: file_names

import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slidesshow.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvides.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final slidesShowMovies = ref.watch(moviesSlideshowProvider);
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvides);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(),
        title: CustomAppBar(),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideShow(movies: slidesShowMovies),
              SizedBox(
                height: 420,
                child: MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: "En cines",
                  subtTitle: "Viernes 1",
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvides.notifier).loadNextPage();
                  },
                ),
              ),
              SizedBox(
                height: 420,
                child: MovieHorizontalListView(
                  movies: upComingMovies,
                  title: "Proximamente",
                  subtTitle: "En este mes ",
                  loadNextPage: () {
                    ref.read(upComingMoviesProvider.notifier).loadNextPage();
                  },
                ),
              ),
              SizedBox(
                height: 420,
                child: MovieHorizontalListView(
                  movies: popularMovies,
                  title: "Populares",
                  // subtTitle: "Viernes 1",
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
              ),
              SizedBox(
                height: 420,
                child: MovieHorizontalListView(
                  movies: topRatedMovies,
                  title: "Mejores calificadas",
                  subtTitle: "De todos lso tiempos",
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ),
              ),
              const SizedBox(height: 50)
            ],
          );
        }, childCount: 1),
      )
    ]);
  }
}
