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

  def current_game() do
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

  def current_game_at_halftime() do
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
end
