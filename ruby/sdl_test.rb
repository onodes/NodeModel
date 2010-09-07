require 'sdl'

SDL.init(SDL::INIT_VIDEO)

screen = SDL.setVideoMode(10,10,16,SDL::SWSURFACE)
screen1 = SDL.setVideoMode(10,10,16,SDL::SWSURFACE)

screen.fill_rect(0,0,10,10,[128,128,128])
screen1.fill_rect(0,0,10,10,[128,128,128])


screen.updateRect(0,0,0,0)
screen1.updateRect(0,0,0,0)
