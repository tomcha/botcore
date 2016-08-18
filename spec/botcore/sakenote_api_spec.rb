require 'spec_helper'
require 'botcore/sakenote_api'

describe 'SakenoteApi' do
  describe '初期化もろもろ' do
    it 'apiトークンを読み込んでいる'do
      sna = Botcore::SakenoteApi.new
      expect(sna.loaded_apitoken?).to eq true
    end
  end
end
