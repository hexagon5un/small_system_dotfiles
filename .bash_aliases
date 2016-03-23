
PS1='[$HOSTNAME \w]\$ '

# Global Aliases (set by Elliot)
alias df='df -m'
alias du='du -m'
alias ls='ls --color=tty'
alias l='ls -FC'
alias dir='ls -ahl'
alias hi='history'
alias j='jobs'
alias up='cd ..'
alias proc="ps aux | grep -v grep | grep $1"
alias which="type -path"
alias r='fc -s'
alias dc='/usr/bin/dc -f ~/.dcrc -'
# alias startx='ssh-agent startx'
alias hd='hexdump -C $1 | less'

# Site-dependent aliases (Elliot) 
## (improved script in /usr/local/bin/) alias preposterous='ssh -X postero.us'
alias smallbox='ssh -X 192.168.1.41' 
alias smallbox_local='ssh -X 10.10.10.11'

alias mailTunnelHome='sudo ssh -N -f -p 23 -L 110:mail.speakeasy.net:110 -L 25:mail.speakeasy.net:25 elliot@66.92.147.234'
alias mailTunnelPosterous='sudo ssh -N -f -p 23 -L 110:mail.speakeasy.net:110 -L 25:mail.speakeasy.net:25 elliot@postero.us'
alias mailTunnelLocal='sudo ssh -N -f -L 110:mail.speakeasy.net:110 -L 25:mail.speakeasy.net:25 elliot@localhost'
# alias tunnelOut='ssh -p 23 -R 10000:localhost:22 elliotwilliams.org'

alias quintessenz='ssh -f -N -L 10200:192k-audio.electrosound.tv:8000 postero.us sleep 1s && mplayer -cache 640 http://localhost:10200'
alias wfmu='ssh -f -N -L 10200:216.118.106.249:8006 postero.us sleep 1s && mplayer -cache 640 http://localhost:10200'
alias qLounge='ssh -f -N -L 10200:128k-audio-qlounge.electrosound.tv:8000 postero.us && mplayer -cache 640 http://localhost:10200'
alias killMusic='pkill -f 10200'
alias getMP3='wget -r -H -N -l1 -A.mp3 -nd -np'

alias syncPhotosToHome='rsync -auv --delete -e"ssh -p 23" /home/elliot/camera/ elliotwilliams.org:/home/elliot/camera'

alias tv='mpv --cache 8192 --framedrop=hard dvb://$1'
alias dvbSignal='dvbsnoop -pd 1 -s signal'

# Transition to vim
alias edit='vim'
alias joe='vim'
export EDITOR=vim
export PAGER=less

# what went wrong with ipython? and when?
alias ipython='ipython2 -i'

export MPD_HOST='localhost'
#export MPD_HOST='192.168.1.38'
export MPD_PORT=6600

# browser default
export BROWSER='/usr/bin/uzbl-browser'
# Tmux with ssh-agent and some automatic stuffs
#alias tm='ssh-agent tmux attach'
alias tm='/usr/local/bin/tmuxInitPrimary'
alias tm2='/usr/local/bin/tmuxInitSecondary'

export PATH=$PATH:/home/elliot/.gem/ruby/2.3.0/bin/
