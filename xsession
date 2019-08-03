export LC_CTYPE='en_US.UTF-8'
[[ -s "$HOME/.Xresources" ]] && xrdb -merge $HOME/.Xresources
[[ -s "$HOME/.fehbg" ]] && sh $HOME/.fehbg
xidle &
xclock &
cwm
