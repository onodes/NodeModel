require 'node'
require 'rubygems'
require 'narray'
require 'sdl'
SIZE = 256
SPIKE = 0
PROBABILITY = 35.7130801687764
COUNT = 50000

SDL.init(SDL::INIT_VIDEO)
screen = SDL.setVideoMode(SIZE,SIZE,16,SDL::SWSURFACE)
screen.fill_rect(0,0,SIZE,SIZE,[128,128,128])
output = NArray.int(SIZE,SIZE)
node = Node.new(SIZE)
spike_count = 0

COUNT.times do |i|
  data = NArray.float(SIZE,SIZE).collect!{|i| (rand()-0.5)*2.0}
  node.put(data)
  
  if node.spike >= SPIKE
    #   p node.spike
    output+=data
    #output.collect!{|element| (element/i).to_i}
    spike_count+=1
      end
  if i % 100 == 0
    p [i,spike_count]
    max = output.max
    min = output.min
   puts diff = (max-min).abs
    next if diff==0 
    #puts i
    SIZE.times{|height|
      SIZE.times{|width|

        data =((output[width,height] + min.abs)/diff.to_f*SIZE).to_i
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
