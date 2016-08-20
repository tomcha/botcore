require 'spec_helper'
require 'botcore/sakenote_api'

describe 'SakenoteApi' do
  before :all do
    @sna = Botcore::SakenoteApi.new
  end

  describe '初期化もろもろ' do
    it 'apiトークンを読み込んでいる'do
      expect(@sna.loaded_apitoken?).to eq true
    end
  end

  describe 'SakenoteApi#invest_maker' do
    it '大阪のお酒を検索すると酒名をキーとしたハッシュが返ってくる' do
      expect(@sna.invest_maker('大阪')).to be_an(Hash)
    end
  end
end
