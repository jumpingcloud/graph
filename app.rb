# Sinatra testing, to render graph.

require 'rubygems'
require 'sinatra'
require 'rubyvis'

get '/' do 
  @keyword = %w(Awesome Amazing Average).sample
@vis = Rubyvis::Panel.new do 
  width 150
  height 150
  bar do
    data [1, 1.2, 1.7, 1.5, 0.7, 0.3]
    width 20
    height {|d| d * 80}
    bottom(0)
    left {index * 25}
  end
end
@vis.render()
graph = @vis.to_svg

  erb :index
end

post '/tell_me_more' do
  email, keyword = params[:email], params[:keyword]
  File.open("interest.csv", "a+") do |f|
    f.write "#{Time.now},#{email},#{keyword}\n"
  end

  erb :thanks
end
