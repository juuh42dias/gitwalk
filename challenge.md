**Desafio**:

A Rails application (backend only) that keeps track of the stars that a given user has in its Github repositories.
This application must have an endpoint that receives a Github username and in the background searches the user’s public repositories using Github’s REST API (https://docs.github.com/en/rest/overview/resources-in-the-rest-api) and saves in a database their repository name and how many stars it has.
You must use Sidekiq and we expect some tests using RSpec.
