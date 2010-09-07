require 'rubygems'
require 'narray'
require 'sdl'
require 'complexCell'

require 'node2'

include Math



SIZE = 256
SPIKE = ARGV[0].chomp.to_i
PROBABILITY = 35.7130801687764
COUNT = 50000


SDL.init(SDL::INIT_VIDEO)
screen = SDL.setVideoMode(SIZE,SIZE,16,SDL::SWSURFACE)
screen.fill_rect(0,0,SIZE,SIZE,[128,128,128])
output = NArray.int(SIZE,SIZE)
option1 = {:size => 256,:theta => 0, :psi => 0.0, :gamma => 1, :lmda => 32, :sigma => 64}
option2 = {:size => 256,:theta => 0, :psi => PI/2.0, :gamma => 1, :lmda => 32, :sigma => 64}
node = ComplexCell.new(option1, option2)
spike_count = 0

COUNT.times do |i|
  
#!!!!stimulation of randomdot patern 
# data = NArray.float(SIZE,SIZE).collect!{|j| rand()}
#  ave = data.mean
 # puts "data average(before) => #{ave}"
#  data.collect!{|element| element-ave}
  #puts "data Average(after) => #{data.mean}"

#!!!!test stimulation!!!
 data = NArray.float(SIZE,SIZE).collect{|j| 0.0}
   for a in 200..220
     SIZE.times do |b|
       data[a,b] = rand()
     end
   end
   
   
    
  #p data
   

 
 #p data
  node.put(data)
  p node.spike
  if node.spike >= SPIKE
    
    output+=data
    #output.collect!{|element| (element/i).to_i}
    spike_count+=1
      end
  if i % 100 == 0
    p [i,spike_count]
    max = output.max
    min = output.min
    diff = (max-min).abs
    next if diff==0 
    #puts i
    SIZE.times{|height|
      SIZE.times{|width|

        data =((output[width,height] - min.abs)/diff.to_f*255).to_i
        screen.put_pixel(width,height,[data,data,data])
      }

    }
   # p output
    screen.updateRect(0,0,0,0)
    p output
  end

end


p output
gets
p output

#puts i
