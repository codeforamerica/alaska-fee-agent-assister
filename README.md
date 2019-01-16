# Alaska Fee Agent Assister

Code repository for Alaska Fee Agent Assister, an application for assisting fee agents in Alaska with the benefits 
interview process by [Code for America](https://www.codeforamerica.org).

## Getting Set Up

### macOS

Install [Homebrew].

Install [Heroku CLI].

`brew install heroku/brew/heroku`

Install and start PostgreSQL.

`brew install postgresql`

`brew services start postgresql`

[Homebrew]: https://brew.sh/
[Heroku CLI]: https://devcenter.heroku.com/articles/heroku-cli

### Ruby on Rails

This application is built using [Ruby on Rails].

Your system will require [Ruby] to develop on the application.

The required Ruby version is listed in the [.ruby-version](.ruby-version) file.

If you do not have this binary, [use this guide to get set up on MacOS].

[Ruby on Rails]: http://rubyonrails.org
[Ruby]: https://www.ruby-lang.org/en/
[use this guide to get set up on MacOS]: http://installfest.railsbridge.org/installfest/macintosh

### Configuring the Application

1. Clone this repo
2. Ask the team for the RAILS_MASTER_KEY
3. Add it to a new file `config/master.key`
4. Run `bin/setup`

## Day-to-day Development

### Local Server

* Run the server(s): `rails s`
* Visit [your local server](http://localhost:3000)
* Run tests, Rubocop, bundle audit, and Brakeman: `rake`

### Conventions

* **Secrets** - We store all secrets in credentials.yml.enc. Locally you will need a `config/master.key` file with the master key in it (stored in LastPass). To edit run `EDITOR=vi bin/rails credentials:edit`
* **Environment config** - We store non-sensitive environment configuration in environment variables. In development, environment variables are loaded from `.env`. When adding an environment, be sure to update the `.env` file and `app.json` (used by Heroku for review apps).

### Form Navigation

This application is a long questionnaire. You will probably want to work on parts of 
it without completing the whole application.

After booting the server and filling out the first few questions,
go to `http://localhost:3000/screens` to jump around.

### Testing

#### Running specs

For development purposes, we generally just run `rspec`.

#### Spec Helpers

* Use `match_html` to test that two HTML strings match, excluding whitespace, order of attributes, etc.:

```ruby
expect(rendered).to match_html <<-HTML
  <table class="foo bar">
  <tr>
  <td>Hi!</td>
  </tr>
  </table>
HTML
```


### Styleguide/Branding
This application was designed using an Atomic design system.

The styleguide can be viewed at [GetCalFresh Styleguide](http://localhost:3000/cfa/styleguide).

## Deploying

### Timing for Deploys

* Staging: Deployed automatically on successful builds from `master`.

### Deploying to Staging

[CircleCI](https://circleci.com/gh/codeforamerica/alaska-fee-agent-assister) is currently set up to deploy green builds to **staging**.

## PDF for Alaska Benefits
A fillable PDF for Alaska's benefit programs - [GEN 50C - Fillable.pdf](https://github.com/codeforamerica/alaska-fee-agent-assister/blob/master/app/lib/pdfs/GEN 50C - Fillable.pdf)
