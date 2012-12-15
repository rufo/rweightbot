require "mechanize"
require "csv"

module RWeightbot
  class Account
    attr_accessor :email, :password

    # Creates a new Account object. Note that it won't try to log in until you call one of the other public methods.
    # @param [Hash] options Options for creating an account:
    # @option options [String] :email The e-mail address for a registered account at weightbot.com
    # @option options [String] :password The password for the same account
    def initialize(options = {})
      self.email = options[:email]
      self.password = options[:password]
    end

    # Attempts to log in at weightbot.com, and returns true if the credentials were valid.
    # @return [Boolean] Whether or not the login was successful.
    def valid_credentials?
      !export_form.nil?
    end

    # Attempts to log in at weightbot.com, and returns the CSV data file as a String.
    # @return [String] The weightbot_data.csv file, in its entirety.
    def csv
      mech.submit(export_form).body
    end

    # Attempts to log in at weightbot.com, downloads the CSV file, and parses it into
    # an array of {Weighing} objects.
    # @return [Array<Weighing>] An array of Weighing objects.
    def weighings
      return @weighings if @weighings

      @weighings = []
      CSV.parse(csv, :headers => true, :return_headers => false, :col_sep => ", ") do |row|
        @weighings << RWeightbot::Weighing.new(row)
      end

      @weighings
    end

    private
    def mech
      @agent ||= Mechanize.new
    end

    def main_page
      return @main_page if @main_page
      login_page = mech.get('https://www.weightbot.com/account/login')
      login_form = login_page.forms_with(:action => "/account/login").first
      login_form.email = email
      login_form.password = password
      @main_page = mech.submit(login_form)
    end

    def export_form
      main_page.forms_with(:action => "/export")[0]
    end
  end
end
