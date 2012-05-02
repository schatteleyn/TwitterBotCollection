#!/usr/bin/ruby

require 'rubygems'
require 'chatterbot/dsl'
require 'date'

today = "#{Time.now.day}/#{Time.now.month}"
year = Time.now.year
easter_hash = Easter(year)

dates = { "1/1" => "la nouvelle année ! Bonne année à tous !",
          "2/2" => "la Chandeleur ! N'abusez pas trop des crêpes :)",
          "14/2" => "la St-Valentin, n'oubliez pas votre cher(e) et tendre.",
          "1/5" => "le 1er Mai, profitez de votre journée de repos !",
          "4/5" => "le Star Wars Day, May The Fourth be with you.",
          "8/5" => "le 8 Mai, fête de la Victoire.",
          "25/5" => "Le Towel Day et le Geek Pride Day ! http://fr.wikipedia.org/wiki/Geek_Pride_Day",
          "21/6" => "la Fête de la Musique ! Let's Rock !",
          "14/7" => "la Fête Nationale !",
          "15/8" => "l'Assomption",
          "31/10" => "Halloween",
          "1/11" => "la Toussaint.",
          "24/12" => "le réveillon de Noël", 
          "25/12" => "Noël. Apportez les cadeaux !",
          "31/12" => "le réveillon de la St Sylvestre."
        }
dates.merge! easter_hash

dates.each do |day, value|
  if today == day
    reply "Aujourd'hui c'est #{value}"
  end
end


# Algorithm for calculating the date of Easter Sunday
# (Meeus/Jones/Butcher Gregorian algorithm)
# http://en.wikipedia.org/wiki/Computus#Meeus.2FJones.2FButcher_Gregorian_algorithm

def Easter(year)
    y = year
    a = y % 19
    b = y / 100
    c = y % 100
    d = b / 4
    e = b % 4
    f = (b + 8) / 25
    g = (b - f + 1) / 3
    h = (19 * a + b - d - g + 15) % 30
    i = c / 4
    k = c % 4
    l = (32 + 2 * e + 2 * i - h - k) % 7
    m = (a + 11 * h + 22 * l) / 451
    month = (h + l - 7 * m + 114) / 31
    day = ((h + l - 7 * m + 114) % 31) + 1
    dt = DateTime.new(year, month, day)
    
    easter_day = "#{dt.day}/#{dt.month}"
    easter_days = {1 => :easter_monday, 39 => :ascension, 49 => :pentecost, 50 => :pentecost_monday}
    easter_days.each do |day, name|
      dt += day
      name = "#{dt.day}/#{dt.month}"
    end
    
    easter = Hash[easter_day => "le dimanche de Pâques !", :easter_monday => "le lundi de Pâques !", :ascension => "l'Ascension.", :pentecost => "la Pentecôte", :pentecost_monday => "le lundi de Pentecôte."]
    return easter
end
