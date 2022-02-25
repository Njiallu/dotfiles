# Defined in - @ line 1
function lt --wraps='ls -lTF' --description 'alias lt=ls -lTF'
  ls -lTF $argv;
end
