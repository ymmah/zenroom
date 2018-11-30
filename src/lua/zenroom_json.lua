local J = require('json')

J.decode = function(str)
   -- fixes strange behavior of tables returned
   -- second value returned should be used
   -- first one becomes a string after first transformation
   -- TODO: investigate this behavior
   local t = JSON.raw_decode(str)
   local i = t
   return i,t
end

-- no problem found in encode
J.encode = function(tab)
   return JSON.raw_encode(tab)
end

return J