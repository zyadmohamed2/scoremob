import 'dart:ui';

const BASE_URL = 'https://v3.football.api-sports.io';

const HEADER_KEY = 'x-apisports-key';
const API_KEY = '8288a4aa95cb365698df75a0e57085bc';
// const API_KEY = '5918ded40423d97feac64a61223b2e19';

// To add a league or a cup get the league ID from
// https://dashboard.api-football.com/soccer/ids
const SUPPORTED_LEAGUES = [
  // 39, // Premier League
  // 140,  // La Liga
  // 61,   // Ligue 1
  // 135,  // Serie A
  // 78,   // Bundesliga
  // Cups
  6, //Africa cup
  // 143, // Copa del Rey
  //testing
  // 41,   // League One England
  // 186,  // Ligue 1 Algeria
  // 141,  // LaLiga 2 Spain
];

//Amount of days before and after the 'Today' tab
const FIXTURES_DATE_RANGE = 4;

//In seconds, making it lower then 15 seconds has no difference since the api backend updates at 15 seconds
const FIXTURES_REFRESH_PERIOD = 6660;

//in seconds, making it lower then 15 seconds has no difference since the api backend updates at 15 seconds
const FIXTURE_DETAILS_REFRESH_PERIOD = 6660;

// Amount of games fetched to show the H2H tab in match page
const FIXTURES_DETAILS_H2H_LAST_GAMES_FETCHED = 10;

// Amount of months back the date picker will allow the user to select
// example: 10 will mean the user will be able to select dates that are 10 months old starting from today
const FIXTURES_DATE_PICKER_RANGE_START = 3;

// Amount of months forward the date picker will allow the user to select
// example: 10 will mean the user will be able to select dates that are 10 months in the future starting from today
const FIXTURES_DATE_PICKER_RANGE_END = 3;

const ChampionsLeagueColor = Color(0xff00fd47);
const EuropaLeagueColor = Color(0xff0008e1);
const EuropaConferenceLeagueColor = Color(0xff00bede);
const RelegationColor = Color(0xffbf0000);

const DefaultPromotionColor = Color(0xff00d091);
const DefaultRelegationColor = Color(0xffbf8300);

// in seconds,league standings cache validity time
const STANDINGS_CACHE_TIMEOUT = 60;

// whether the error screen show all the details when you click on the error Text
const ERROR_VIEW_SHOWS_DETAILS_ON_TAP = true;

//Transfers dates because the endpoint in returning all the transfers in history with these dates we can show just the
// last transfer window
var WINTER_TRANSFER_WINDOW = DateTime(0, 1, 1);
var SUMMER_TRANSFER_WINDOW = DateTime(0, 6, 1);
