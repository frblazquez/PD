-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Practice 1 exercise 1. Define haskell expressions for computing:

-- a) Years in 10^10 seconds (can suppose years of 365 days):

years_in_n_seconds:: Integer -> Integer
years_in_n_seconds n = if(n`mod`(3600*24*365)==0) then n`div`(3600*24*365)
                       else n`div`(3600*24*365) + 1

full_years_in_n_seconds:: Integer -> Integer
full_years_in_n_seconds n = n`div`(3600*24*365)

-- b) Full years, days, hours, minutes and seconds in 10^10 seconds:

date_format_seconds:: Integer -> (Integer,Integer,Integer,Integer,Integer)
date_format_seconds n = (years, days, hours, minutes, seconds)
    where years   = div n (3600*24*365)
          days    = div n (3600*24) - years*365   
          hours   = div n (3600) - years*365*24 - days*24
          minutes = div n (60) - years*365*24*60 - days*24*60 - hours*60
          seconds = n - years*365*24*3600 - days*24*3600 - hours*3600 - minutes*60

date_format_seconds2:: Integer -> (Integer,Integer,Integer,Integer,Integer)
date_format_seconds2 n = formater (0,0,0,0,n)
    where formater (y,d,h,m,s) 
            |s>=60     = formater(y, d, h,m + s`div`60, s`mod`60)
            |m>=60     = formater(y, d,h + m`div`60,m`mod`60 , s)
            |h>=24     = formater(y,d + h`div`24, h`mod`24, m, s)
            |d>=365    = formater(y+d`div`365,d`mod`365, h, m, s)
            |otherwise = (y,d,h,m,s)

-- c) Generalization, having the seconds as a parameter: (Already done)

