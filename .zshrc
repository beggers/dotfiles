# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ben/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# What else would you use a shell for?
cow_wisdom() {
  fortune | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n
}

#{{{ ZSH Modules
autoload -U compinit promptinit zcalc zsh-mime-setup
compinit
promptinit
zsh-mime-setup
#}}}


# Directory navigation
alias ...='cd ../..'

# Other aliases
alias ls='ls -h --color=auto'
alias ll='ls -lA'
alias la='ls -A'
alias l='ls -CF'
alias open='xdg-open'

alias grep='grep --color=auto'

# Use the autocolor script (homework 3 from CSE 455) to color the image all
# cool, and put the output image into ~/Pictures/color
alias color='~/./.smart_color.sh'

# java stuff
alias javac='javac -Xlint -g'
alias junitc='javac -cp .:/usr/share/java/junit.jar'
alias junit='java -cp .:/usr/share/java/junit.jar org.junit.runner.JUnitCore'
alias processing='~/.processing/processing-2.2.1/./processing'

# Having a prompt that doesn't suck is pretty important
autoload -U colors && colors
PROMPT="%{%(?.$fg[green].$fg[red])%}%?%{$reset_color%} %n %# "
RPROMPT="%{$fg[yellow]%}%~%{$reset_color%}"


# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Spell check commands!  (Sometimes annoying)
#setopt CORRECT

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# 10 second wait if you do something that will delete everything
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
setopt ZLE

# beeps are annoying
setopt NO_BEEP

# Don't overwrite, append!
setopt APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

# And of course, the most important ;)
function mandelbrot {
   local lines columns colour a b p q i pnew
   ((columns=COLUMNS-1, lines=LINES-1, colour=0))
   for ((b=-1.5; b<=1.5; b+=3.0/lines)) do
       for ((a=-2.0; a<=1; a+=3.0/columns)) do
           for ((p=0.0, q=0.0, i=0; p*p+q*q < 4 && i < 32; i++)) do
               ((pnew=p*p-q*q+a, q=2*p*q+b, p=pnew))
           done
           ((colour=(i/4)%8))
            echo -n "\\e[4${colour}m "
        done
        echo
    done
}

export GOPATH=$HOME/Documents/go
export GOBIN=$GOPATH/bin
export PATH=~/.cabal/bin:$PATH:$GOBIN

python ~/.archey.py
setxkbmap dvorak
