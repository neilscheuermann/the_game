defmodule TheGame.Seeds do
  def completed_game() do
    %{
      "arena" => %{
        "city" => "Houston",
        "country" => "USA",
        "isDomestic" => true,
        "name" => "Toyota Center",
        "stateAbbr" => "TX"
      },
      "attendance" => "3399",
      "clock" => "",
      "endTimeUTC" => "2021-04-08T02:15:00.000Z",
      "extendedStatusNum" => 0,
      "gameDuration" => %{"hours" => "2", "minutes" => "05"},
      "gameId" => "0022000456",
      "gameUrlCode" => "20210407/DALHOU",
      "hTeam" => %{
        "linescore" => [
          %{"score" => "24"},
          %{"score" => "23"},
          %{"score" => "28"},
          %{"score" => "27"}
        ],
        "loss" => "37",
        "score" => "102",
        "seriesLoss" => "1",
        "seriesWin" => "2",
        "teamId" => "1610612745",
        "triCode" => "HOU",
        "win" => "14"
      },
      "hasGameBookPdf" => false,
      "homeStartDate" => "20210407",
      "homeStartTime" => "1900",
      "isBuzzerBeater" => false,
      "isGameActivated" => false,
      "isNeutralVenue" => false,
      "isPreviewArticleAvail" => true,
      "isRecapArticleAvail" => true,
      "isStartTimeTBD" => false,
      "leagueName" => "standard",
      "nugget" => %{"text" => ""},
      "period" => %{
        "current" => 4,
        "isEndOfPeriod" => false,
        "isHalftime" => false,
        "maxRegular" => 4,
        "type" => 0
      },
      "seasonStageId" => 2,
      "seasonYear" => "2020",
      "startDateEastern" => "20210407",
      "startTimeEastern" => "8:00 PM ET",
      "startTimeUTC" => "2021-04-08T00:00:00.000Z",
      "statusNum" => 3,
      "tickets" => %{
        "desktopWeb" => "https://a.data.nba.com/tickets/single/2020/0022000456/TEAM_SCH",
        "leagGameInfo" => "https://a.data.nba.com/tickets/single/2020/0022000456/LEAG_GAMEINFO",
        "leagTix" => "https://a.data.nba.com/tickets/single/2020/0022000456/LEAG_TIX",
        "mobileApp" => "https://a.data.nba.com/tickets/single/2020/0022000456/APP_TIX",
        "mobileWeb" => "https://a.data.nba.com/tickets/single/2020/0022000456/WEB_MWEB"
      },
      "vTeam" => %{
        "linescore" => [
          %{"score" => "23"},
          %{"score" => "19"},
          %{"score" => "22"},
          %{"score" => "29"}
        ],
        "loss" => "22",
        "score" => "93",
        "seriesLoss" => "2",
        "seriesWin" => "1",
        "teamId" => "1610612742",
        "triCode" => "DAL",
        "win" => "28"
      },
      "visitorStartDate" => "20210407",
      "visitorStartTime" => "1900",
      "watch" => %{
        "broadcast" => %{
          "audio" => %{
            "hTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "KBME/KTRH/S: KLAT",
                  "shortName" => "KBME/KTRH/S: KLAT"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "national" => %{
              "broadcasters" => [],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "vTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "ESPN 103.3 FM / 1270 AM (ESP)",
                  "shortName" => "ESPN 103.3 FM / 1270 AM (ESP)"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            }
          },
          "broadcasters" => %{
            "canadian" => [],
            "hTeam" => [
              %{
                "longName" => "AT&T Sportsnet - Southwest",
                "shortName" => "ATTSN-SW"
              }
            ],
            "national" => [],
            "spanish_hTeam" => [],
            "spanish_national" => [],
            "spanish_vTeam" => [],
            "vTeam" => [
              %{
                "longName" => "Bally Sports Southwest - Dallas",
                "shortName" => "BSSW-DAL"
              }
            ]
          },
          "video" => %{
            "canPurchase" => true,
            "deepLink" => [],
            "isLeaguePass" => true,
            "isMagicLeap" => false,
            "isNBAOnTNTVR" => false,
            "isNationalBlackout" => false,
            "isNextVR" => false,
            "isOculusVenues" => false,
            "isTNTOT" => false,
            "isVR" => false,
            "regionalBlackoutCodes" => "hour",
            "streams" => [%{"doesArchiveExist" => false}],
            "tntotIsOnAir" => false
          }
        }
      }
    }
  end

  def live_game() do
    %{
      "arena" => %{
        "city" => "Phoenix",
        "country" => "USA",
        "isDomestic" => true,
        "name" => "Phoenix Suns Arena",
        "stateAbbr" => "AZ"
      },
      "attendance" => "5110",
      "clock" => "41.1",
      "extendedStatusNum" => 0,
      "gameDuration" => %{"hours" => "1", "minutes" => "39"},
      "gameId" => "0022000783",
      "gameUrlCode" => "20210407/UTAPHX",
      "hTeam" => %{
        "linescore" => [
          %{"score" => "20"},
          %{"score" => "31"},
          %{"score" => "26"},
          %{"score" => "0"}
        ],
        "loss" => "14",
        "score" => "77",
        "seriesLoss" => "0",
        "seriesWin" => "2",
        "teamId" => "1610612756",
        "triCode" => "PHX",
        "win" => "35"
      },
      "hasGameBookPdf" => false,
      "homeStartDate" => "20210407",
      "homeStartTime" => "1900",
      "isBuzzerBeater" => false,
      "isGameActivated" => true,
      "isNeutralVenue" => false,
      "isPreviewArticleAvail" => true,
      "isRecapArticleAvail" => false,
      "isStartTimeTBD" => false,
      "leagueName" => "standard",
      "nugget" => %{"text" => ""},
      "period" => %{
        "current" => 3,
        "isEndOfPeriod" => false,
        "isHalftime" => false,
        "maxRegular" => 4,
        "type" => 0
      },
      "seasonStageId" => 2,
      "seasonYear" => "2020",
      "startDateEastern" => "20210407",
      "startTimeEastern" => "10:00 PM ET",
      "startTimeUTC" => "2021-04-08T02:00:00.000Z",
      "statusNum" => 2,
      "tickets" => %{
        "desktopWeb" => "https://a.data.nba.com/tickets/single/2020/0022000783/TEAM_SCH",
        "leagGameInfo" => "https://a.data.nba.com/tickets/single/2020/0022000783/LEAG_GAMEINFO",
        "leagTix" => "https://a.data.nba.com/tickets/single/2020/0022000783/LEAG_TIX",
        "mobileApp" => "https://a.data.nba.com/tickets/single/2020/0022000783/APP_TIX",
        "mobileWeb" => "https://a.data.nba.com/tickets/single/2020/0022000783/WEB_MWEB"
      },
      "vTeam" => %{
        "linescore" => [
          %{"score" => "21"},
          %{"score" => "19"},
          %{"score" => "34"},
          %{"score" => "0"}
        ],
        "loss" => "12",
        "score" => "74",
        "seriesLoss" => "2",
        "seriesWin" => "0",
        "teamId" => "1610612762",
        "triCode" => "UTA",
        "win" => "38"
      },
      "visitorStartDate" => "20210407",
      "visitorStartTime" => "2000",
      "watch" => %{
        "broadcast" => %{
          "audio" => %{
            "hTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "KMVP 98.7 / S: KSUN",
                  "shortName" => "KMVP 98.7 / S: KSUN"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "national" => %{
              "broadcasters" => [],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "vTeam" => %{
              "broadcasters" => [
                %{"longName" => "KZNS / S: KTUB", "shortName" => "KZNS / S: KTUB"}
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            }
          },
          "broadcasters" => %{
            "canadian" => [%{"longName" => "TSN", "shortName" => "TSN"}],
            "hTeam" => [
              %{"longName" => "Bally Sports Arizona EXTRA", "shortName" => "BSAZX"}
            ],
            "national" => [%{"longName" => "ESPN", "shortName" => "ESPN"}],
            "spanish_hTeam" => [],
            "spanish_national" => [],
            "spanish_vTeam" => [],
            "vTeam" => [
              %{
                "longName" => "AT&T Sportsnet - Rocky Mountain",
                "shortName" => "ATTSN-RM"
              }
            ]
          },
          "video" => %{
            "canPurchase" => false,
            "deepLink" => [
              %{
                "androidApp" => "http://www.espn.com/watch?id=3741634",
                "broadcaster" => "ESPN",
                "desktopWeb" => "http://www.espn.com/watch?id=3741634",
                "iosApp" => "http://www.espn.com/watch?id=3741634",
                "mobileWeb" => "http://www.espn.com/watch?id=3741634",
                "regionalMarketCodes" => ""
              }
            ],
            "isLeaguePass" => true,
            "isMagicLeap" => false,
            "isNBAOnTNTVR" => false,
            "isNationalBlackout" => true,
            "isNextVR" => false,
            "isOculusVenues" => false,
            "isTNTOT" => false,
            "isVR" => false,
            "regionalBlackoutCodes" => "torr_utar",
            "streams" => [
              %{"doesArchiveExist" => false, "duration" => 0},
              %{"doesArchiveExist" => false}
            ],
            "tntotIsOnAir" => false
          }
        }
      }
    }
  end

  def live_game_at_halftime() do
    %{
      "arena" => %{
        "city" => "Los Angeles",
        "country" => "USA",
        "isDomestic" => true,
        "name" => "STAPLES Center",
        "stateAbbr" => "CA"
      },
      "attendance" => "0",
      "clock" => "",
      "extendedStatusNum" => 0,
      "gameDuration" => %{"hours" => "0", "minutes" => "57"},
      "gameId" => "0022000842",
      "gameUrlCode" => "20210415/BOSLAL",
      "hTeam" => %{
        "linescore" => [
          %{"score" => "23"},
          %{"score" => "25"},
          %{"score" => "0"},
          %{"score" => "0"}
        ],
        "loss" => "21",
        "score" => "48",
        "seriesLoss" => "1",
        "seriesWin" => "1",
        "teamId" => "1610612747",
        "triCode" => "LAL",
        "win" => "34"
      },
      "hasGameBookPdf" => false,
      "homeStartDate" => "20210415",
      "homeStartTime" => "1900",
      "isBuzzerBeater" => false,
      "isGameActivated" => true,
      "isNeutralVenue" => false,
      "isPreviewArticleAvail" => true,
      "isRecapArticleAvail" => false,
      "isStartTimeTBD" => false,
      "leagueName" => "standard",
      "nugget" => %{"text" => ""},
      "period" => %{
        "current" => 2,
        "isEndOfPeriod" => true,
        "isHalftime" => true,
        "maxRegular" => 4,
        "type" => 0
      },
      "seasonStageId" => 2,
      "seasonYear" => "2020",
      "startDateEastern" => "20210415",
      "startTimeEastern" => "10:00 PM ET",
      "startTimeUTC" => "2021-04-16T02:00:00.000Z",
      "statusNum" => 2,
      "tickets" => %{
        "desktopWeb" => "https://a.data.nba.com/tickets/single/2020/0022000842/TEAM_SCH",
        "leagGameInfo" => "https://a.data.nba.com/tickets/single/2020/0022000842/LEAG_GAMEINFO",
        "leagTix" => "https://a.data.nba.com/tickets/single/2020/0022000842/LEAG_TIX",
        "mobileApp" => "https://a.data.nba.com/tickets/single/2020/0022000842/APP_TIX",
        "mobileWeb" => "https://a.data.nba.com/tickets/single/2020/0022000842/WEB_MWEB"
      },
      "vTeam" => %{
        "linescore" => [
          %{"score" => "31"},
          %{"score" => "30"},
          %{"score" => "0"},
          %{"score" => "0"}
        ],
        "loss" => "26",
        "score" => "61",
        "seriesLoss" => "1",
        "seriesWin" => "1",
        "teamId" => "1610612738",
        "triCode" => "BOS",
        "win" => "29"
      },
      "visitorStartDate" => "20210415",
      "visitorStartTime" => "2200",
      "watch" => %{
        "broadcast" => %{
          "audio" => %{
            "hTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "ESPN LA 710/KWKW (S)",
                  "shortName" => "ESPN LA 710/KWKW (S)"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "national" => %{
              "broadcasters" => [],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "vTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "98.5 The Sports Hub",
                  "shortName" => "98.5 The Sports Hub"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            }
          },
          "broadcasters" => %{
            "canadian" => [%{"longName" => "TSN", "shortName" => "TSN"}],
            "hTeam" => [
              %{"longName" => "Spectrum SportsNet", "shortName" => "SPECSN"}
            ],
            "national" => [%{"longName" => "TNT", "shortName" => "TNT"}],
            "spanish_hTeam" => [],
            "spanish_national" => [],
            "spanish_vTeam" => [],
            "vTeam" => [
              %{"longName" => "NBC SPORTS BOSTON", "shortName" => "NBCSB"}
            ]
          },
          "video" => %{
            "canPurchase" => false,
            "deepLink" => [
              %{
                "androidApp" => "https://tnt.app.link/7w91Bdy0NV",
                "broadcaster" => "TNT",
                "desktopWeb" => "https://tnt.app.link/7w91Bdy0NV",
                "iosApp" => "https://tnt.app.link/7w91Bdy0NV",
                "mobileWeb" => "https://tnt.app.link/7w91Bdy0NV",
                "regionalMarketCodes" => ""
              }
            ],
            "isLeaguePass" => true,
            "isMagicLeap" => false,
            "isNBAOnTNTVR" => false,
            "isNationalBlackout" => true,
            "isNextVR" => false,
            "isOculusVenues" => false,
            "isTNTOT" => true,
            "isVR" => false,
            "regionalBlackoutCodes" => "torr_lalr_bosr",
            "streams" => [%{"doesArchiveExist" => false}],
            "tntotIsOnAir" => false
          }
        }
      }
    }
  end

  def live_game_end_of_3rd_period() do
    %{
      "arena" => %{
        "city" => "Boston",
        "country" => "USA",
        "isDomestic" => true,
        "name" => "TD Garden",
        "stateAbbr" => "MA"
      },
      "attendance" => "2298",
      "clock" => "",
      "extendedStatusNum" => 0,
      "gameDuration" => %{"hours" => "1", "minutes" => "41"},
      "gameId" => "0022000858",
      "gameUrlCode" => "20210417/GSWBOS",
      "hTeam" => %{
        "linescore" => [
          %{"score" => "24"},
          %{"score" => "36"},
          %{"score" => "29"},
          %{"score" => "0"}
        ],
        "loss" => "26",
        "score" => "89",
        "seriesLoss" => "1",
        "seriesWin" => "1",
        "teamId" => "1610612738",
        "triCode" => "BOS",
        "win" => "30"
      },
      "hasGameBookPdf" => false,
      "homeStartDate" => "20210417",
      "homeStartTime" => "2030",
      "isBuzzerBeater" => false,
      "isGameActivated" => true,
      "isNeutralVenue" => false,
      "isPreviewArticleAvail" => true,
      "isRecapArticleAvail" => false,
      "isStartTimeTBD" => false,
      "leagueName" => "standard",
      "nugget" => %{"text" => ""},
      "period" => %{
        "current" => 3,
        "isEndOfPeriod" => true,
        "isHalftime" => false,
        "maxRegular" => 4,
        "type" => 0
      },
      "seasonStageId" => 2,
      "seasonYear" => "2020",
      "startDateEastern" => "20210417",
      "startTimeEastern" => "8:30 PM ET",
      "startTimeUTC" => "2021-04-18T00:30:00.000Z",
      "statusNum" => 2,
      "tickets" => %{
        "desktopWeb" => "https://a.data.nba.com/tickets/single/2020/0022000858/TEAM_SCH",
        "leagGameInfo" => "https://a.data.nba.com/tickets/single/2020/0022000858/LEAG_GAMEINFO",
        "leagTix" => "https://a.data.nba.com/tickets/single/2020/0022000858/LEAG_TIX",
        "mobileApp" => "https://a.data.nba.com/tickets/single/2020/0022000858/APP_TIX",
        "mobileWeb" => "https://a.data.nba.com/tickets/single/2020/0022000858/WEB_MWEB"
      },
      "vTeam" => %{
        "linescore" => [
          %{"score" => "33"},
          %{"score" => "33"},
          %{"score" => "23"},
          %{"score" => "0"}
        ],
        "loss" => "28",
        "score" => "89",
        "seriesLoss" => "1",
        "seriesWin" => "1",
        "teamId" => "1610612744",
        "triCode" => "GSW",
        "win" => "28"
      },
      "visitorStartDate" => "20210417",
      "visitorStartTime" => "1730",
      "watch" => %{
        "broadcast" => %{
          "audio" => %{
            "hTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "98.5 The Sports Hub",
                  "shortName" => "98.5 The Sports Hub"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "national" => %{
              "broadcasters" => [],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "vTeam" => %{
              "broadcasters" => [
                %{"longName" => "95.7 The Game", "shortName" => "95.7 The Game"}
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            }
          },
          "broadcasters" => %{
            "canadian" => [%{"longName" => "Sportsnet", "shortName" => "SN"}],
            "hTeam" => [],
            "national" => [%{"longName" => "ABC", "shortName" => "ABC"}],
            "spanish_hTeam" => [],
            "spanish_national" => [],
            "spanish_vTeam" => [],
            "vTeam" => []
          },
          "video" => %{
            "canPurchase" => false,
            "deepLink" => [
              %{
                "androidApp" => "http://www.espn.com/watch?id=3755499",
                "broadcaster" => "ABC",
                "desktopWeb" => "http://www.espn.com/watch?id=3755499",
                "iosApp" => "http://www.espn.com/watch?id=3755499",
                "mobileWeb" => "http://www.espn.com/watch?id=3755499",
                "regionalMarketCodes" => ""
              }
            ],
            "isLeaguePass" => true,
            "isMagicLeap" => false,
            "isNBAOnTNTVR" => false,
            "isNationalBlackout" => true,
            "isNextVR" => false,
            "isOculusVenues" => false,
            "isTNTOT" => false,
            "isVR" => false,
            "regionalBlackoutCodes" => "torr",
            "streams" => [%{"doesArchiveExist" => false}],
            "tntotIsOnAir" => false
          }
        }
      }
    }
  end

  def live_game_end_of_4th_period() do
    %{
      "arena" => %{
        "city" => "Sacramento",
        "country" => "USA",
        "isDomestic" => true,
        "name" => "Golden 1 Center",
        "stateAbbr" => "CA"
      },
      "attendance" => "0",
      "clock" => "",
      "extendedStatusNum" => 0,
      "gameDuration" => %{"hours" => "2", "minutes" => "17"},
      "gameId" => "0022000891",
      "gameUrlCode" => "20210421/MINSAC",
      "hTeam" => %{
        "linescore" => [
          %{"score" => "44"},
          %{"score" => "26"},
          %{"score" => "25"},
          %{"score" => "33"}
        ],
        "loss" => "35",
        "score" => "128",
        "seriesLoss" => "2",
        "seriesWin" => "1",
        "teamId" => "1610612758",
        "triCode" => "SAC",
        "win" => "23"
      },
      "hasGameBookPdf" => false,
      "homeStartDate" => "20210421",
      "homeStartTime" => "1900",
      "isBuzzerBeater" => false,
      "isGameActivated" => true,
      "isNeutralVenue" => false,
      "isPreviewArticleAvail" => true,
      "isRecapArticleAvail" => false,
      "isStartTimeTBD" => false,
      "leagueName" => "standard",
      "nugget" => %{"text" => ""},
      "period" => %{
        "current" => 4,
        "isEndOfPeriod" => true,
        "isHalftime" => false,
        "maxRegular" => 4,
        "type" => 0
      },
      "seasonStageId" => 2,
      "seasonYear" => "2020",
      "startDateEastern" => "20210421",
      "startTimeEastern" => "10:00 PM ET",
      "startTimeUTC" => "2021-04-22T02:00:00.000Z",
      "statusNum" => 2,
      "tickets" => %{
        "desktopWeb" => "https://a.data.nba.com/tickets/single/2020/0022000891/TEAM_SCH",
        "leagGameInfo" => "https://a.data.nba.com/tickets/single/2020/0022000891/LEAG_GAMEINFO",
        "leagTix" => "https://a.data.nba.com/tickets/single/2020/0022000891/LEAG_TIX",
        "mobileApp" => "https://a.data.nba.com/tickets/single/2020/0022000891/APP_TIX",
        "mobileWeb" => "https://a.data.nba.com/tickets/single/2020/0022000891/WEB_MWEB"
      },
      "vTeam" => %{
        "linescore" => [
          %{"score" => "34"},
          %{"score" => "25"},
          %{"score" => "39"},
          %{"score" => "27"}
        ],
        "loss" => "43",
        "score" => "125",
        "seriesLoss" => "1",
        "seriesWin" => "2",
        "teamId" => "1610612750",
        "triCode" => "MIN",
        "win" => "16"
      },
      "visitorStartDate" => "20210421",
      "visitorStartTime" => "2100",
      "watch" => %{
        "broadcast" => %{
          "audio" => %{
            "hTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "KHTK Sports 1140 AM",
                  "shortName" => "KHTK Sports 1140 AM"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "national" => %{
              "broadcasters" => [],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "vTeam" => %{
              "broadcasters" => [
                %{"longName" => "830 WCCO", "shortName" => "830 WCCO"}
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            }
          },
          "broadcasters" => %{
            "canadian" => [],
            "hTeam" => [
              %{"longName" => "NBC Sports California", "shortName" => "NBCSCA"}
            ],
            "national" => [],
            "spanish_hTeam" => [],
            "spanish_national" => [],
            "spanish_vTeam" => [],
            "vTeam" => [
              %{"longName" => "Bally Sports North Plus", "shortName" => "BSN+"}
            ]
          },
          "video" => %{
            "canPurchase" => true,
            "deepLink" => [],
            "isLeaguePass" => true,
            "isMagicLeap" => false,
            "isNBAOnTNTVR" => false,
            "isNationalBlackout" => false,
            "isNextVR" => false,
            "isOculusVenues" => false,
            "isTNTOT" => false,
            "isVR" => false,
            "regionalBlackoutCodes" => "sacr_minr",
            "streams" => [%{"doesArchiveExist" => false}],
            "tntotIsOnAir" => false
          }
        }
      }
    }
  end

  def live_game_overtime_double() do
    %{
      "arena" => %{
        "city" => "Denver",
        "country" => "USA",
        "isDomestic" => true,
        "name" => "Ball Arena",
        "stateAbbr" => "CO"
      },
      "attendance" => "4005",
      "clock" => "41.0",
      "extendedStatusNum" => 0,
      "gameDuration" => %{"hours" => "2", "minutes" => "43"},
      "gameId" => "0022000874",
      "gameUrlCode" => "20210419/MEMDEN",
      "hTeam" => %{
        "linescore" => [
          %{"score" => "27"},
          %{"score" => "29"},
          %{"score" => "31"},
          %{"score" => "29"},
          %{"score" => "9"},
          %{"score" => "12"}
        ],
        "loss" => "20",
        "score" => "137",
        "seriesLoss" => "1",
        "seriesWin" => "1",
        "teamId" => "1610612743",
        "triCode" => "DEN",
        "win" => "36"
      },
      "hasGameBookPdf" => false,
      "homeStartDate" => "20210419",
      "homeStartTime" => "1900",
      "isBuzzerBeater" => false,
      "isGameActivated" => true,
      "isNeutralVenue" => false,
      "isPreviewArticleAvail" => true,
      "isRecapArticleAvail" => false,
      "isStartTimeTBD" => false,
      "leagueName" => "standard",
      "nugget" => %{"text" => ""},
      "period" => %{
        "current" => 6,
        "isEndOfPeriod" => false,
        "isHalftime" => false,
        "maxRegular" => 4,
        "type" => 0
      },
      "seasonStageId" => 2,
      "seasonYear" => "2020",
      "startDateEastern" => "20210419",
      "startTimeEastern" => "9:00 PM ET",
      "startTimeUTC" => "2021-04-20T01:00:00.000Z",
      "statusNum" => 2,
      "tickets" => %{
        "desktopWeb" => "https://a.data.nba.com/tickets/single/2020/0022000874/TEAM_SCH",
        "leagGameInfo" => "https://a.data.nba.com/tickets/single/2020/0022000874/LEAG_GAMEINFO",
        "leagTix" => "https://a.data.nba.com/tickets/single/2020/0022000874/LEAG_TIX",
        "mobileApp" => "https://a.data.nba.com/tickets/single/2020/0022000874/APP_TIX",
        "mobileWeb" => "https://a.data.nba.com/tickets/single/2020/0022000874/WEB_MWEB"
      },
      "vTeam" => %{
        "linescore" => [
          %{"score" => "35"},
          %{"score" => "25"},
          %{"score" => "35"},
          %{"score" => "21"},
          %{"score" => "9"},
          %{"score" => "9"}
        ],
        "loss" => "26",
        "score" => "134",
        "seriesLoss" => "1",
        "seriesWin" => "1",
        "teamId" => "1610612763",
        "triCode" => "MEM",
        "win" => "29"
      },
      "visitorStartDate" => "20210419",
      "visitorStartTime" => "2000",
      "watch" => %{
        "broadcast" => %{
          "audio" => %{
            "hTeam" => %{
              "broadcasters" => [
                %{"longName" => "KKSE 92.5FM", "shortName" => "KKSE 92.5FM"}
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "national" => %{
              "broadcasters" => [],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "vTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "ESPN 92.9FM/680AM",
                  "shortName" => "ESPN 92.9FM/680AM"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            }
          },
          "broadcasters" => %{
            "canadian" => [],
            "hTeam" => [%{"longName" => "Altitude", "shortName" => "ALT"}],
            "national" => [],
            "spanish_hTeam" => [],
            "spanish_national" => [],
            "spanish_vTeam" => [],
            "vTeam" => [
              %{
                "longName" => "Bally Sports Southeast - Memphis",
                "shortName" => "BSSE-MEM"
              }
            ]
          },
          "video" => %{
            "canPurchase" => true,
            "deepLink" => [],
            "isLeaguePass" => true,
            "isMagicLeap" => false,
            "isNBAOnTNTVR" => false,
            "isNationalBlackout" => false,
            "isNextVR" => false,
            "isOculusVenues" => false,
            "isTNTOT" => false,
            "isVR" => false,
            "regionalBlackoutCodes" => "denr",
            "streams" => [%{"doesArchiveExist" => false}],
            "tntotIsOnAir" => false
          }
        }
      }
    }
  end

  def upcoming_game() do
    %{
      "arena" => %{
        "city" => "Miami",
        "country" => "USA",
        "isDomestic" => true,
        "name" => "AmericanAirlines Arena",
        "stateAbbr" => "FL"
      },
      "attendance" => "",
      "clock" => "",
      "extendedStatusNum" => 0,
      "gameDuration" => %{"hours" => "", "minutes" => ""},
      "gameId" => "0022000871",
      "gameUrlCode" => "20210419/HOUMIA",
      "hTeam" => %{
        "linescore" => [],
        "loss" => "28",
        "score" => "",
        "seriesLoss" => "0",
        "seriesWin" => "1",
        "teamId" => "1610612748",
        "triCode" => "MIA",
        "win" => "29"
      },
      "hasGameBookPdf" => false,
      "homeStartDate" => "20210419",
      "homeStartTime" => "2000",
      "isBuzzerBeater" => false,
      "isGameActivated" => false,
      "isNeutralVenue" => false,
      "isPreviewArticleAvail" => true,
      "isRecapArticleAvail" => false,
      "isStartTimeTBD" => false,
      "leagueName" => "standard",
      "nugget" => %{"text" => ""},
      "period" => %{
        "current" => 0,
        "isEndOfPeriod" => false,
        "isHalftime" => false,
        "maxRegular" => 4,
        "type" => 0
      },
      "seasonStageId" => 2,
      "seasonYear" => "2020",
      "startDateEastern" => "20210419",
      "startTimeEastern" => "8:00 PM ET",
      "startTimeUTC" => "2021-04-20T00:00:00.000Z",
      "statusNum" => 1,
      "tickets" => %{
        "desktopWeb" => "https://a.data.nba.com/tickets/single/2020/0022000871/TEAM_SCH",
        "leagGameInfo" => "https://a.data.nba.com/tickets/single/2020/0022000871/LEAG_GAMEINFO",
        "leagTix" => "https://a.data.nba.com/tickets/single/2020/0022000871/LEAG_TIX",
        "mobileApp" => "https://a.data.nba.com/tickets/single/2020/0022000871/APP_TIX",
        "mobileWeb" => "https://a.data.nba.com/tickets/single/2020/0022000871/WEB_MWEB"
      },
      "vTeam" => %{
        "linescore" => [],
        "loss" => "42",
        "score" => "",
        "seriesLoss" => "1",
        "seriesWin" => "0",
        "teamId" => "1610612745",
        "triCode" => "HOU",
        "win" => "15"
      },
      "visitorStartDate" => "20210419",
      "visitorStartTime" => "1900",
      "watch" => %{
        "broadcast" => %{
          "audio" => %{
            "hTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "WAXY 790 / WAQI 710",
                  "shortName" => "WAXY 790 / WAQI 710"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "national" => %{
              "broadcasters" => [],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "vTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "KBME/KTRH/S: KLAT",
                  "shortName" => "KBME/KTRH/S: KLAT"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            }
          },
          "broadcasters" => %{
            "canadian" => [],
            "hTeam" => [
              %{"longName" => "Bally Sports Sun", "shortName" => "BSSUN"}
            ],
            "national" => [],
            "spanish_hTeam" => [],
            "spanish_national" => [],
            "spanish_vTeam" => [],
            "vTeam" => [
              %{
                "longName" => "AT&T Sportsnet - Southwest",
                "shortName" => "ATTSN-SW"
              }
            ]
          },
          "video" => %{
            "canPurchase" => true,
            "deepLink" => [],
            "isLeaguePass" => true,
            "isMagicLeap" => false,
            "isNBAOnTNTVR" => false,
            "isNationalBlackout" => false,
            "isNextVR" => false,
            "isOculusVenues" => false,
            "isTNTOT" => false,
            "isVR" => false
          }
        }
      }
    }
  end

  def upcoming_game_on_espn() do
    %{
      "arena" => %{
        "city" => "Philadelphia",
        "country" => "USA",
        "isDomestic" => true,
        "name" => "Wells Fargo Center",
        "stateAbbr" => "PA"
      },
      "attendance" => "",
      "clock" => "",
      "extendedStatusNum" => 0,
      "gameDuration" => %{"hours" => "", "minutes" => ""},
      "gameId" => "0022000870",
      "gameUrlCode" => "20210419/GSWPHI",
      "hTeam" => %{
        "linescore" => [],
        "loss" => "17",
        "score" => "",
        "seriesLoss" => "0",
        "seriesWin" => "1",
        "teamId" => "1610612755",
        "triCode" => "PHI",
        "win" => "39"
      },
      "hasGameBookPdf" => false,
      "homeStartDate" => "20210419",
      "homeStartTime" => "1930",
      "isBuzzerBeater" => false,
      "isGameActivated" => false,
      "isNeutralVenue" => false,
      "isPreviewArticleAvail" => true,
      "isRecapArticleAvail" => false,
      "isStartTimeTBD" => false,
      "leagueName" => "standard",
      "nugget" => %{"text" => ""},
      "period" => %{
        "current" => 0,
        "isEndOfPeriod" => false,
        "isHalftime" => false,
        "maxRegular" => 4,
        "type" => 0
      },
      "seasonStageId" => 2,
      "seasonYear" => "2020",
      "startDateEastern" => "20210419",
      "startTimeEastern" => "7:30 PM ET",
      "startTimeUTC" => "2021-04-19T23:30:00.000Z",
      "statusNum" => 1,
      "tickets" => %{
        "desktopWeb" => "https://a.data.nba.com/tickets/single/2020/0022000870/TEAM_SCH",
        "leagGameInfo" => "https://a.data.nba.com/tickets/single/2020/0022000870/LEAG_GAMEINFO",
        "leagTix" => "https://a.data.nba.com/tickets/single/2020/0022000870/LEAG_TIX",
        "mobileApp" => "https://a.data.nba.com/tickets/single/2020/0022000870/APP_TIX",
        "mobileWeb" => "https://a.data.nba.com/tickets/single/2020/0022000870/WEB_MWEB"
      },
      "vTeam" => %{
        "linescore" => [],
        "loss" => "29",
        "score" => "",
        "seriesLoss" => "1",
        "seriesWin" => "0",
        "teamId" => "1610612744",
        "triCode" => "GSW",
        "win" => "28"
      },
      "visitorStartDate" => "20210419",
      "visitorStartTime" => "1630",
      "watch" => %{
        "broadcast" => %{
          "audio" => %{
            "hTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "97.5 The Fanatic",
                  "shortName" => "97.5 The Fanatic"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "national" => %{
              "broadcasters" => [],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "vTeam" => %{
              "broadcasters" => [
                %{"longName" => "95.7 The Game", "shortName" => "95.7 The Game"}
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            }
          },
          "broadcasters" => %{
            "canadian" => [%{"longName" => "Sportsnet", "shortName" => "SN"}],
            "hTeam" => [],
            "national" => [%{"longName" => "ESPN", "shortName" => "ESPN"}],
            "spanish_hTeam" => [],
            "spanish_national" => [],
            "spanish_vTeam" => [],
            "vTeam" => [
              %{"longName" => "NBC Sports  Bay Area", "shortName" => "NBCSBA"}
            ]
          },
          "video" => %{
            "canPurchase" => false,
            "deepLink" => [
              %{
                "androidApp" => "http://www.espn.com/watch?id=3753341",
                "broadcaster" => "ESPN",
                "desktopWeb" => "http://www.espn.com/watch?id=3753341",
                "iosApp" => "http://www.espn.com/watch?id=3753341",
                "mobileWeb" => "http://www.espn.com/watch?id=3753341",
                "regionalMarketCodes" => ""
              }
            ],
            "isLeaguePass" => true,
            "isMagicLeap" => false,
            "isNBAOnTNTVR" => false,
            "isNationalBlackout" => true,
            "isNextVR" => false,
            "isOculusVenues" => false,
            "isTNTOT" => false,
            "isVR" => false,
            "regionalBlackoutCodes" => "torr_gswr",
            "streams" => []
          }
        }
      }
    }
  end

  def upcoming_game_on_tnt() do
    %{
      "arena" => %{
        "city" => "Dallas",
        "country" => "USA",
        "isDomestic" => true,
        "name" => "American Airlines Center",
        "stateAbbr" => "TX"
      },
      "attendance" => "",
      "clock" => "",
      "extendedStatusNum" => 0,
      "gameDuration" => %{"hours" => "", "minutes" => ""},
      "gameId" => "0022000897",
      "gameUrlCode" => "20210422/LALDAL",
      "hTeam" => %{
        "linescore" => [],
        "loss" => "26",
        "score" => "",
        "seriesLoss" => "1",
        "seriesWin" => "0",
        "teamId" => "1610612742",
        "triCode" => "DAL",
        "win" => "31"
      },
      "hasGameBookPdf" => false,
      "homeStartDate" => "20210422",
      "homeStartTime" => "2030",
      "isBuzzerBeater" => false,
      "isGameActivated" => false,
      "isNeutralVenue" => false,
      "isPreviewArticleAvail" => true,
      "isRecapArticleAvail" => false,
      "isStartTimeTBD" => false,
      "leagueName" => "standard",
      "nugget" => %{"text" => ""},
      "period" => %{
        "current" => 0,
        "isEndOfPeriod" => false,
        "isHalftime" => false,
        "maxRegular" => 4,
        "type" => 0
      },
      "seasonStageId" => 2,
      "seasonYear" => "2020",
      "startDateEastern" => "20210422",
      "startTimeEastern" => "9:30 PM ET",
      "startTimeUTC" => "2021-04-23T01:30:00.000Z",
      "statusNum" => 1,
      "tickets" => %{
        "desktopWeb" => "https://a.data.nba.com/tickets/single/2020/0022000897/TEAM_SCH",
        "leagGameInfo" => "https://a.data.nba.com/tickets/single/2020/0022000897/LEAG_GAMEINFO",
        "leagTix" => "https://a.data.nba.com/tickets/single/2020/0022000897/LEAG_TIX",
        "mobileApp" => "https://a.data.nba.com/tickets/single/2020/0022000897/APP_TIX",
        "mobileWeb" => "https://a.data.nba.com/tickets/single/2020/0022000897/WEB_MWEB"
      },
      "vTeam" => %{
        "linescore" => [],
        "loss" => "23",
        "score" => "",
        "seriesLoss" => "0",
        "seriesWin" => "1",
        "teamId" => "1610612747",
        "triCode" => "LAL",
        "win" => "35"
      },
      "visitorStartDate" => "20210422",
      "visitorStartTime" => "1830",
      "watch" => %{
        "broadcast" => %{
          "audio" => %{
            "hTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "ESPN 103.3 FM / 1270 AM (ESP)",
                  "shortName" => "ESPN 103.3 FM / 1270 AM (ESP)"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "national" => %{
              "broadcasters" => [],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            },
            "vTeam" => %{
              "broadcasters" => [
                %{
                  "longName" => "ESPN LA 710/KWKW (S)",
                  "shortName" => "ESPN LA 710/KWKW (S)"
                }
              ],
              "streams" => [
                %{"isOnAir" => false, "language" => "English", "streamId" => ""},
                %{"isOnAir" => false, "language" => "Spanish", "streamId" => ""}
              ]
            }
          },
          "broadcasters" => %{
            "canadian" => [%{"longName" => "TSN", "shortName" => "TSN"}],
            "hTeam" => [],
            "national" => [%{"longName" => "TNT", "shortName" => "TNT"}],
            "spanish_hTeam" => [],
            "spanish_national" => [],
            "spanish_vTeam" => [],
            "vTeam" => [
              %{"longName" => "Spectrum SportsNet", "shortName" => "SPECSN"}
            ]
          },
          "video" => %{
            "canPurchase" => false,
            "deepLink" => [
              %{
                "androidApp" => "https://tnt.app.link/7w91Bdy0NV",
                "broadcaster" => "TNT",
                "desktopWeb" => "https://tnt.app.link/7w91Bdy0NV",
                "iosApp" => "https://tnt.app.link/7w91Bdy0NV",
                "mobileWeb" => "https://tnt.app.link/7w91Bdy0NV",
                "regionalMarketCodes" => ""
              }
            ],
            "isLeaguePass" => true,
            "isMagicLeap" => false,
            "isNBAOnTNTVR" => false,
            "isNationalBlackout" => true,
            "isNextVR" => false,
            "isOculusVenues" => false,
            "isTNTOT" => true
          }
        }
      }
    }
  end
end
