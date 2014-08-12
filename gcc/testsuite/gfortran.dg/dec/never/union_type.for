program main

type words_long
  union 
    map 
      integer*2  w1, w2, w3 
    end map 
    map 
      integer*4  long
    end map 
  end union 
end type

type (words_long) x

x%long = z'56781234'
write (*,8) x%w1, x%w2, x%w3
8     format (z5,z5,z5)

end program main
