#!/bin/zsh

# see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey "^[[H"    beginning-of-line
bindkey "^[[1~"   beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[4~"   end-of-line

bindkey "^L"	  clear-screen						   # ctrl-l
bindkey "^K"      kill-whole-line                      # ctrl-k
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a  
bindkey '^E'      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b
bindkey "^[[3~"   delete-char						   # backspace
bindkey -v   # Default to standard vi bindings, regardless of editor string
