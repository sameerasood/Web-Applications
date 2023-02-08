require "spec_helper"
require "rack/test"
require_relative '../../app'


describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "POST /albums" do
    it 'adds new album to the database' do
        response = post(
          '/albums',
          title: 'Voyage',
          release_year: '2022',
          artist_id: '2'
        )
        expect(response.status).to eq(200)
        expect(response.body).to eq("")
    end
  end

  context "GET /albums/:id" do
    it 'returns the album with id = 1' do
    response = get('/albums/2')
    expect(response.status).to eq(200)
    expect(response.body).to include('<h1>Surfer Rosa</h1>')
    expect(response.body).to include('Release year: 1988')
    end
  end

  context "GET/albums" do
    it "returns the list of albums" do
      response = get('/albums')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Albums</h1>')
      expect(response.body).to include('Title: <a href = "albums/2">Surfer Rosa</a>')
    end
  end

  context "GET/artists" do
    it 'returns the list of artists' do
    response = get('/artists')
    expect(response.status).to eq(200)
    expect(response.body).to include('Name:ABBA')
    expect(response.body).to include('Genre:Pop')
    end
  end

  context "GET /artists/:id" do
    it 'returns the artist with id = 1' do
    response = get('/artists/1')
    expect(response.status).to eq(200)
    expect(response.body).to include('<h1>Artists</h1>')
    expect(response.body).to include('Name:Pixies')
    expect(response.body).to include('Genre:Rock')
    end
  end

  context 'post/artists' do
    it 'adds new artist to the database' do
      response = post('/artists',
      name: 'Wild nothing',
      genre: 'Indie'
    )
    expect(response.status).to eq(200)

    response = get('/artists')
    expect(response.status).to eq(200)
    expect(response.body).to include('Wild nothing')
    end
  end
end
