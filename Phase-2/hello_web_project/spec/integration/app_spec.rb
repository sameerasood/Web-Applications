require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
    include Rack::Test::Methods
    let(:app){Application.new}

    context 'GET /hello' do
      it 'returns "Hello!"' do
        response = get('/hello')
        expect(response.status).to be(200)
        expect(response.body).to include("<h1>Hello!</h1>")
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