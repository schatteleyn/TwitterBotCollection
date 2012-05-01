require 'rubygems'
require 'chatterbot/dsl'
require 'date'

today = "#{Time.now.day}/#{Time.now.month}"

dates = { "1/1" => "la nouvelle année ! Bonne année à tous !",
          "2/2" => "la Chandeleur ! N'abusez pas trop des crêpes :)"
          "14/2" => "la St-Valentin, n'oubliez pas votre cher(e) et tendre."
          "1/5" => "le 1er Mai, profitez de votre journée de repos !",
          "8/5" => "le 8 Mai, fête de la Victoire.",
          "21/6" => "la Fête de la Musique ! Let's Rock !"
          "14/7" => "la Fête Nationale !",
          "15/8" => "l'Assomption",
          "31/10" => "Halloween",
          "1/11" => "la Toussaint.",
          "24/12" => "le réveillon de Noël", 
          "25/12" => "Noël. Apportez les cadeaux !"
          "31/12" => "le réveillon de la St Sylvestre."
        }

dates.each do |day, value|
  if today == day
    reply "Aujourd'hui c'est + #{value}"
  end
end
