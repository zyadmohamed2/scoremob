import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:scoremob/config.dart';
import 'package:scoremob/data/model/fixtures_response/fixtures_response.dart';
import 'package:scoremob/data/model/h2h_response/h2h_response.dart';
import 'package:scoremob/data/model/players_response/player.dart';
import 'package:scoremob/data/model/standings_response/standings_response.dart';
import 'package:scoremob/data/model/team_response/team_response.dart';
import 'package:scoremob/data/model/transfers_response/transfers_response.dart';

import '../model/coach_response/coach_response.dart';
import '../model/league_response/leagues_response.dart';
import '../model/players_response/players_response.dart';

class ApiClient {
  late final Dio _dio;
  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal() {
    _dio = Dio();
    _dio.options.baseUrl = BASE_URL;
    _dio.options.headers = {HEADER_KEY: API_KEY};
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 120));
  }

  Future<LeaguesResponse?> getLeagueInfo(int leagueId) async {
    var response = await _dio.get(
      '/leagues',
      queryParameters: {'current': true, 'id': leagueId},
    );
    var parsedResponse = LeaguesResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<FixturesResponse?> getFixtures(int leagueId, int season,
      String fromDate, String toDate, String timezone) async {
    var response = await _dio.get(
      '/fixtures',
      queryParameters: {
        'league': leagueId,
        'season': season,
        'from': fromDate,
        'to': toDate,
        'timezone': timezone
      },
    );
    var parsedResponse = FixturesResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<FixturesResponse?> getFixturesByRound(
      int leagueId, int season, String round, String timezone) async {
    var response = await _dio.get(
      '/fixtures',
      queryParameters: {
        'league': leagueId,
        'season': season,
        'round': round,
        'timezone': timezone
      },
    );
    var parsedResponse = FixturesResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<FixturesResponse?> getFixtureById(int id, String timezone) async {
    var response = await _dio.get(
      '/fixtures',
      queryParameters: {'id': id, 'timezone': timezone},
    );
    var parsedResponse = FixturesResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<StandingsResponse?> getLeagueStandings(
      int leagueId, int season) async {
    var response = await _dio.get(
      '/standings',
      queryParameters: {'league': leagueId, 'season': season},
    );
    var parsedResponse = StandingsResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<H2HResponse?> getH2H(
      int homeTeamId, int awayTeamId, int last, String timezone) async {
    var response = await _dio.get(
      '/fixtures/headtohead',
      queryParameters: {
        'h2h': '$homeTeamId-$awayTeamId',
        'last': last,
        'timezone': timezone
      },
    );
    var parsedResponse = H2HResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<FixturesResponse?> getLastFixtures(
      int teamId, String timezone, int count) async {
    var response = await _dio.get(
      '/fixtures',
      queryParameters: {'team': teamId, 'last': count, 'timezone': timezone},
    );
    var parsedResponse = FixturesResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<FixturesResponse?> getNextFixtures(
      int teamId, String timezone, int count) async {
    var response = await _dio.get(
      '/fixtures',
      queryParameters: {'team': teamId, 'next': count, 'timezone': timezone},
    );
    var parsedResponse = FixturesResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<PlayersResponse?> getTeamPlayers(int season, int teamId) async {
    var response = await _dio.get(
      '/players',
      queryParameters: {'team': teamId, 'season': season},
    );
    var parsedResponse = PlayersResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<TeamResponse?> getTeamInfo(int teamId) async {
    var response = await _dio.get(
      '/teams',
      queryParameters: {'id': teamId},
    );
    var parsedResponse = TeamResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<TransfersResponse?> getTeamTransfers(int teamId) async {
    var response = await _dio.get(
      '/transfers',
      queryParameters: {'team': teamId},
    );
    var parsedResponse = TransfersResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<CoachResponse?> getTeamCoaches(int teamId) async {
    var response = await _dio.get(
      '/coachs',
      queryParameters: {'team': teamId},
    );
    var parsedResponse = CoachResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<FixturesResponse?> getFixturesByLeague(
      int leagueId, int season, String timezone) async {
    var response = await _dio.get(
      '/fixtures',
      queryParameters: {
        'league': leagueId,
        'season': season,
        'timezone': timezone
      },
    );
    var parsedResponse = FixturesResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<Map<String, dynamic>> getPlayer(
      {required String id, required String season}) async {
    var response = await _dio
        .get("/players", queryParameters: {"id": id, "season": season});
    log(response.data['response'][0]['player'].toString());
    // log(player.age.toString());
    return response.data;
  }
}
