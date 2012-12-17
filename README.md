# RWeightbot

A simple gem for pulling and parsing the backup data uploaded by Tapbot's [Weightbot][1] app.

[1]: http://tapbots.com/software/weightbot/

## Installation

Add this line to your application's Gemfile:

    gem 'rweightbot'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rweightbot

## Usage

```` ruby
account = RWeightbot::Account.new(:email => 'user@example.com', :password => 'password')
account.csv                   # returns the full CSV file as a string
weighings = account.weighings # returns an array of RWeightbot::Weighing objects
weighings[0].date             # date of the weighing
weighings[0].pounds           # weight in pounds
weighings[0].kilograms        # weight in kilograms
````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Make sure the specs pass (you'll need to add test credentials to weightbot_credentials.yml)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

