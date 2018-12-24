if test -n "$ZSH_VERSION"; then
  export CURRENT_SHELL=zsh
  export SH_START_INDEX=1
elif test -n "$BASH_VERSION"; then
  export CURRENT_SHELL=bash
  export SH_START_INDEX=0
elif test -n "$KSH_VERSION"; then
  export CURRENT_SHELL=ksh
elif test -n "$FCEDIT"; then
  export CURRENT_SHELL=ksh
  export SH_START_INDEX=0
elif test -n "$PS3"; then
  export CURRENT_SHELL=unknown
  export SH_START_INDEX=0
else
  export CURRENT_SHELL=sh
  export SH_START_INDEX=0
fi

wai_source(){
     for i in $@
     do
         b=$(basename i)
         target=${${i%.*}#*.}
         if [[ $target == $CURRENT_SHELL ]]
         then
             source $target
         fi
     done
    
}
wai(){
    echo $CURRENT_SHELL
}
