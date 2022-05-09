abstract class TopMoviesStates {}

class TopMoviesInitialState extends TopMoviesStates {}

class TopMoviesDataLoadingState extends TopMoviesStates {}

class TopMoviesDataSuccessState extends TopMoviesStates {}

class TopMoviesDataErrorState extends TopMoviesStates {}

class TopMoviesVideoLoadingState extends TopMoviesStates{}

class TopMoviesVideoSuccessState extends TopMoviesStates{}

class TopMoviesVideoErrorState extends TopMoviesStates{}