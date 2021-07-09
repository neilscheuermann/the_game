defmodule TheGame.NBALiveGameAnalysisTest do
  use ExUnit.Case

  alias TheGame.NBALiveGameAnalysis

  describe "TheGame.NBALiveGameAnalysis.calculate_start_delay/2 determins the amount of miliseconds to delay" do
    test "for the next cycle" do
      now =
        Timex.now()
        |> Timex.set(hour: 14, minute: 0, second: 0)
        |> DateTime.truncate(:second)

      event_start =
        Timex.now()
        |> Timex.set(hour: 18, minute: 0, second: 0)
        |> DateTime.truncate(:second)

      milliseconds_til_start = NBALiveGameAnalysis.calculate_start_delay(now, event_start)

      four_hours_in_milliseconds = 60 * 60 * 4 * 1000
      assert milliseconds_til_start == four_hours_in_milliseconds
    end

    test "for next cycle if the process reboots after games have ended, before the next day" do
      process_reboot_timestamp =
        ~U[2021-06-25 23:00:00.405529Z]
        |> DateTime.truncate(:second)

      next_day_event_start =
        ~U[2021-06-26 18:00:00.000Z]
        |> DateTime.truncate(:second)

      milliseconds_til_start =
        NBALiveGameAnalysis.calculate_start_delay(
          process_reboot_timestamp,
          next_day_event_start
        )

      nineteen_hours_in_milliseconds = 60 * 60 * 19 * 1000

      assert milliseconds_til_start ==
               nineteen_hours_in_milliseconds
    end
  end

  describe "TheGame.NBALiveGameAnalysis.shift_by_a_day/1" do
    test "shifts a day" do
      assert NBALiveGameAnalysis.shift_by_a_day("20210708") == "20210709"
    end

    test "shifts a day spanning a month" do
      assert NBALiveGameAnalysis.shift_by_a_day("20210731") == "20210801"
    end

    test "shifts a day spanning a year" do
      assert NBALiveGameAnalysis.shift_by_a_day("20211231") == "20220101"
    end
  end
end
