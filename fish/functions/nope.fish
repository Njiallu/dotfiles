# Defined in - @ line 1
function nope --wraps='nvim **/*.{c,h} makefiles/* {**,.}/Makefile' --description 'alias nope=nvim **/*.{c,h} makefiles/* {**,.}/Makefile'
  nvim **/*.{c,h} makefiles/* {**,.}/Makefile $argv;
end
