require 'sdl'

SDL.init(SDL::INIT_VIDEO)

screen = SDL.setVideoMode(256,256,16,SDL::SWSURFACE)
screen2 = SDL.setVideoMode(256,256,16,SDL::SWSURFACE)

screen.put_pixel(10,10,[255,255,255])
screen2.put_pixel(10,10,[255,255,255])

screen.updateRect(0,0,0,0)
screen2.updateRect(0,0,0,0)

gets
