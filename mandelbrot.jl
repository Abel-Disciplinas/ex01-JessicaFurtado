# add Images
# add ImageMagick

using Images

# z^2 = x^2 + 2xyi - y^2 = (x^2 - y^2) + (2xy) i
function iteracao_mandelbrot(cx, cy; max_iter = 40)
  iter = 0
  x=cx
  y=cy
  while iter<40
    antigox=x
    x=x^2-y^2+cx
    y=2*antigox*y+cy

    iter+=1

  end

  if x^2 + y^2 < 4
    return false, 0
  else
    return true, iter / max_iter
  end
end

function mandelbrot(N)
  x = range(-2.5, 1.5, length=N)
  y = range(-2.0, 2.0, length=N)

  imagem = zeros(N, N)
  for i = 1:N
    for j = 1:N
      estavel, ρ = iteracao_mandelbrot(x[i], y[j])
      if estavel
        imagem[i,j] = ρ
      end
    end
  end

  save("mandelbrot.jpg", imagem')
end

mandelbrot(1000)
