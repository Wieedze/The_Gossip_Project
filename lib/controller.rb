require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do 
    erb :new_gossip
  end

  post '/gossips/new/' do

    @author = params[:gossip_author]
    @content = params[:gossip_content]

    @gossip = Gossip.new("#{params["gossip_author"]}","#{params["gossip_content"]}").save
    redirect '/'
  end

  get '/gossip/:id/' do
    @gossip = Gossip.find(params[:id]) # Trouve le gossip par son ID
    if @gossip
      erb :show_gossip # Affiche le gossip trouvé
    else
      "Gossip introuvable."
    end
  end

end 