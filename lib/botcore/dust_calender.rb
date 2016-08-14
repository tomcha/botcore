module Botcore
  class DustCalender
    def initialize(*weeknumber)
      def initialize(*weeknumber)
        if (weeknumber.size > 0)
          #      #テスト用イニシャライザ
          @today_weeknumber = weeknumber[0]
          @tomorrow_weeknumber = weeknumber[0]
          @today_weekday = weeknumber[1]
        else
          @today_weeknumber = ((Time.now.day) / 7) + 1
          @tomorrow_weeknumber = ((Time.now.day - 1) / 7) + 1
          @today_weekday = Time.now.wday
        end
      end

      def tomorrow_schedule
        tomorrow_schedule = Array.new
        case @today_weekday
        when 0
          tomorrow_schedule << '明日は燃えるゴミの日'
        when 2
          if (@today_weeknumber == 1 || @today_weeknumber == 3)
            tomorrow_schedule << '明日はかん・びんの日'
          elsif (@today_weeknumber == 2 || @today_weeknumber == 4)
            tomorrow_schedule << '明日は不燃、危険、大型ゴミの日'
          end
        when 3
          tomorrow_schedule << '明日は燃えるゴミの日'
          if (@today_weeknumber == 1 || @today_weeknumber == 3)
            tomorrow_schedule << '明日は古着・ダンボールの日'
          end
        end
        return tomorrow_schedule
      end

      def today_schedule
        today_schedule = Array.new
        case @today_weekday
        when 1
          today_schedule << '今日は燃えるゴミの日'
        when 3
          if (@tomorrow_weeknumber == 1 || @tomorrow_weeknumber == 3)
            today_schedule << '今日はかん・びんの日'
          elsif (@tomorrow_weeknumber == 2 || @tomorrow_weeknumber == 4)
            today_schedule << '今日は不燃、危険、大型ゴミの日'
          end
        when 4
          today_schedule << '今日は燃えるゴミの日'
          if (@tomorrow_weeknumber == 1 || @tomorrow_weeknumber == 3)
            today_schedule << '今日は古着・ダンボールの日'
          end
        end
        return today_schedule
      end
    end
  end
end
