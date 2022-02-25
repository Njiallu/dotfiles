# Defined in - @ line 1
function ls --wraps='exa -lF' --description 'alias ls=exa -lF'
  exa -lF $argv;
end
