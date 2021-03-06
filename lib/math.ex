defmodule Math do
  def clamp(value, min, max) do
    value |> max(min) |> min(max)
  end

  def lerp(a, b, t) do
    a + (b - a) * t
  end

  def vip_up(vip , exp) do 
    case Math.vip_exp(vip) do 
      nil -> {vip , exp } 
      -1 -> {vip , exp } 
      cost when cost > exp -> {vip , exp } 
      cost when cost == exp -> {vip + 1 , 0 } 
      cost -> vip_up(vip + 1 , exp - cost ) 
    end 
  end

  def vip_exp(vip) do 
    case vip do 
      _ -> 10 
    end 
  end

  def levelup(level, exp ) do
    case Math.level_exp(level) do
      nil -> {level, exp}   # max level reached
      -1 -> {level, 0}      # max level reached
      cost when cost > exp -> {level, exp}
      cost when cost == exp -> {level + 1, 0}
      cost -> levelup(level + 1, exp - cost ) 
    end
  end


  #每一级所需要的exp
  def level_exp(level) do 
    case level do 
      1 -> 10 
      2 -> 20 
      3 -> 40 
      4 -> 100 
      5 -> 250
      6 -> 500 
      7 -> 1000 
      8 -> -1 
    end 
  end

end
