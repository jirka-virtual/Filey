class HomeController < ApplicationController
  def index
  end

  def download
  	file_path = "/home/jirka/live/#{params[:filename]}"
    send_file file_path, :filename => params[:filename], :disposition => 'attachment'
  end
end
