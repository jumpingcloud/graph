require 'rubygems'
require 'rubyvis'
vis = Rubyvis::Panel.new do 
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
vis.render()
puts vis.to_svg # Output final SVG
