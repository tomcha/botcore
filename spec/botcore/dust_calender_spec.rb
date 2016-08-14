require 'spec_helper'
require 'botcore/dust_calender'

describe "DustCalender" do

  before do
    @dc_first_wednesday ||= Botcore::DustCalender.new(1, 3)
    @dc_second_wednesday ||= Botcore::DustCalender.new(2, 3)
    @dc_third_wednesday ||= Botcore::DustCalender.new(3, 3)
    @dc_force_wednesday ||= Botcore::DustCalender.new(4, 3)

    @dc_first_tuesday ||= Botcore::DustCalender.new(1, 2)
    @dc_second_tuesday ||= Botcore::DustCalender.new(2, 2)
    @dc_third_tuesday ||= Botcore::DustCalender.new(3, 2)
    @dc_force_tuesday ||= Botcore::DustCalender.new(4, 2)

    @dc_sunday ||= Botcore::DustCalender.new(1, 0)
    @dc_monday ||= Botcore::DustCalender.new(1, 1)
    @dc_wednesday ||= Botcore::DustCalender.new(1, 3)
    @dc_thirsday ||= Botcore::DustCalender.new(1, 4)

  end

  describe "今日が日曜日のとき" do
    it "明日、燃えるゴミの日が出力されること" do
      expect(@dc_sunday.tomorrow_schedule).to include('明日は燃えるゴミの日')
    end
  end

  describe "今日が月曜日のとき" do
    it "今日、燃えるゴミの日が出力されること" do
      expect(@dc_monday.today_schedule).to include('今日は燃えるゴミの日')
    end
  end

  describe "今日が第1週の火曜日の時" do
    it "明日、かんびんの日が出力されること" do
      expect(@dc_first_tuesday.tomorrow_schedule).to include('明日はかん・びんの日')
    end
  end

  describe "今日が第2週の火曜日の時" do
    it "明日、不燃、危険、大型ゴミの日が出力されること" do
      expect(@dc_second_tuesday.tomorrow_schedule).to include('明日は不燃、危険、大型ゴミの日')
    end
  end

  describe "今日が第3週の火曜日の時" do
    it "明日、かんびんの日が出力されること" do
      expect(@dc_third_tuesday.tomorrow_schedule).to include('明日はかん・びんの日')
    end
  end

  describe "今日が第4週の火曜日の時" do
    it "明日、不燃、危険、大型ゴミの日が出力されること" do
      expect(@dc_force_tuesday.tomorrow_schedule).to include('明日は不燃、危険、大型ゴミの日')
    end
  end

  describe "今日が水曜日のとき" do
    it "明日、燃えるゴミの日が出力されること" do
      expect(@dc_wednesday.tomorrow_schedule).to include('明日は燃えるゴミの日')
    end
  end

  describe "今日が第1週の水曜日の時" do
    it "今日、かんびんの日が出力されること" do
      expect(@dc_first_wednesday.today_schedule).to include('今日はかん・びんの日')
    end
    it "明日、古着・ダンボールの日が出力されること" do
      expect(@dc_first_wednesday.tomorrow_schedule).to include('明日は古着・ダンボールの日')
    end
  end

  describe "今日が第2週の水曜日の時" do
    it "今日、不燃、危険、大型ゴミの日が出力されること" do
      expect(@dc_second_wednesday.today_schedule).to include('今日は不燃、危険、大型ゴミの日')
    end
  end

  describe "今日が第3週の水曜日のとき" do
    it "今日、かんびんの日が出力されること" do
      expect(@dc_third_wednesday.today_schedule).to include('今日はかん・びんの日')
    end
    it "明日、古着・ダンボールの日が出力されること" do
      expect(@dc_third_wednesday.tomorrow_schedule).to include('明日は古着・ダンボールの日')
    end
  end

  describe "今日が第4週の水曜日の時" do
    it "今日、不燃、危険、大型ゴミの日が出力されること" do
      expect(@dc_force_wednesday.today_schedule).to include('今日は不燃、危険、大型ゴミの日')
    end
  end

  describe "今日が木曜日のとき" do
    it "今日、燃えるゴミの日が出力されること" do
      expect(@dc_thirsday.today_schedule).to include('今日は燃えるゴミの日')
    end
  end
end
