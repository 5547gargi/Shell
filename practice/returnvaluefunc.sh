#!/usr/bin/env bash

# define_variable()
# {
#     local x=7
#     echo "$x"
# }
# y=$(define_variable)
# echo "value of y is : $y"

return_variable()
{
    local x=9
    return $x
}

return_variable
echo "The value of x is : $?"

