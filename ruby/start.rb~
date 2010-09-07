require 'node'
require 'rubygems'
require 'narray'
require 'sdl'
SIZE = 256

SDL.init(SDL::INIT_VIDEO)
screen = SDL.setVideoMode(SIZE,SIZE,16,SDL::SWSURFACE)

output = NArray.int(SIZE,SIZE)
node = Node.new
50000.times do |i|
  data = NArray.int(SIZE,SIZE).collect!{|i| rand(2)==0?-1:1}
  node.put(data)
  if node.spike >= 50
       p node.spike
    output+=data
    output.collect!{|element| (element/i).to_i}
    SIZE.times{|height|
      SIZE.times{|width|
        data = output[width,height]
        if data >= 255 
          data = 255
        end
        if data < 0
          data = 0
        end

        screen.put_pixel(width,height,[255-data,255-data,255-data])
      }
   
    }
  end
       if i % 100 == 0
      puts i
      
screen.updateRect(0,0,0,0)
    end

end



gets
p output

#puts i
