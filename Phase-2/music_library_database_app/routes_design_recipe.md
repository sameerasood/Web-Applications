# {{ Post }} {{ /albums}} Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  post/albums

  get /artists

  POST /artists

  GET /artists

# With body parameters:
title=Voyage
release_year=2022
artist_id=2

# With body parameters:
name=Wild nothing
genre=Indie

# Expected response (200 OK)
(No content)

# Expected response (200 OK)
Pixies, ABBA, Taylor Swift, Nina Simone, Wild nothin

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

response = post('/albums',
title: 'Voyage',
release_year: '2022',
artist_id = '2'
)
```
response = get('/artists?list=Pixies, ABBA, Taylor Swift, Nina Simone')
```html
<!-- EXAMPLE -->
<!-- Response when the post is not found: 404 Not Found -->

<html>
  <head></head>
  <body>
    <h1>Sorry!</h1>
    <div>We couldn't find this post. Have a look at the homepage?</div>
  </body>
</html>
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

Post/albums

# Expected response:

Response for 200 OK
```
get/artists
Expected response:
Response for 200 OK

```

```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /albums" do
    it 'adds new album to the database' do
        response = post('/albums',
        title: 'Voyage',
        release_year: '2022',
        artist_id = '2'
        )
        expect(response.status).to eq(200)

        response = get('/albums')
        expect(response.body).to eq("")
    end
  end

  context "GET/artists" do
    it 'returns the list of artists' do
    response = get('/artists?list=Pixies, ABBA, Taylor Swift, Nina Simone')
    expect(response.status).to eq(200)
    expect(response.body).to eq("Pixies, ABBA, Taylor Swift, Nina Simone")
    end
  end

  
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
