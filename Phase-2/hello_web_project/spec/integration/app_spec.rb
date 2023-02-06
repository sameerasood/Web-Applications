require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
    include Rack::Test::Methods
    let(:app){Application.new}

    context 'GET /hello' do
      it 'returns "Hello Sameera!"' do
        response = get('/hello?name=Sameera')
        expect(response.status).to be(200)
        expect(response.body).to eq("Hello Sameera!")
      end

      it 'returns "Hello Raaya!"' do
        response = get('/hello?name=Raaya')
        expect(response.status).to be(200)
        expect(response.body).to eq("Hello Raaya!")
      end
    end

    context 'GET /names' do
      it 'returns the names' do
        response = get('/names?names=Julia, Mary, Karim')
        expect(response.status).to be(200)
        expect(response.body).to eq("Julia, Mary, Karim")
      end
    end

    context  "/sort-names" do
        it "it returns the list of names in alphabetical order" do
        response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")
        expect(response.status).to be(200)
        expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
        end
    end

end