require 'rubygems'
require 'array'
require 'narray'
require 'pp'
include Math

class Node
  def initialize(option ={:size => 256,:theta => 0.25,:psi => 0, :gamma => 1, :lmda => 64, :sigma => 64})
    size = option[:size]
    theta=option[:theta]
    psi=option[:psi]
    gamma=option[:gamma]
    lmda=option[:lmda]
    sigma=option[:sigma]

    @InputData = NArray.float(size,size)
    @OutputData = NArray.float(size,size)
    @theta = theta
    @psi = psi
    @gamma = gamma
    @lmda = lmda
    @sigma = sigma
    @size = sqrt(@InputData.size).to_i

    @GaborData = NArray.float(size,size)
    narray_each{|data|
      @GaborData[data[0],data[1]] = gabor(data[0]-@size/2,data[1]-@size/2) 
    }
    self
  end

  def put(data)
    @InputData = data

    self
  end

  def spike
    #p  @InputData
    # 
    # p @InputData.collect!{|data| data * (rand(10)-5)}
    #p @InputData
    # narray_each(@InputData){|data| 
    #   @MidData[data[1],data[2]] =  gabor(data[0],data[1]-@size/2,data[2]-@size/2)
    # }
    # @Mid  (@MidData * @InputData)
    return filter(@InputData,@GaborData).sum
        
  end


  private


  def narray2

  end
  def narray_each()
    @size.times{|height|
      @size.times{|width|
        yield [width,height]
      }
    }

  end


  #gabor filter data,x,y ... x,y' ... -1 0 1

  def filter(data1,data2)
    return data1*data2
  end

  def gabor (x,y) 
    x_dash = x * cos(@theta) + y * sin(@theta)
    y_dash = -x * sin(@theta) + y* cos(@theta)


    g = E**(-(x_dash**2 + (@gamma**2 * y_dash**2)  )/(2*@sigma**2))* cos(2*PI*(x_dash/@lmda.to_f) + @psi).to_f
    #    puts g
    return g

  end

end


#node = Node.new
#node.put(NArray.int(255,255).collect!{|i| rand(2)})

#node.spike
