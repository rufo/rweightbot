require "mechanize"
require "csv"

module RWeightbot
  class Account
    attr_accessor :email, :password

    def initialize(options)
      self.email = options[:email]
      self.password = options[:password]
    end

    def valid_credentials?
      !export_form.nil?
    end

    def csv
      mech.submit(export_form).body
    end

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
