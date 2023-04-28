
  
# bound to helix, rg, sk
function sk_preview_find_jump(){ 
  x="$(sk --bind "ctrl-p:toggle-preview" --ansi -i -c "rg --color=always --line-number \"{}\" | sort" --preview="preview.sh -v {}" --preview-window=up:70%)"; 
  [[ $? -eq 0 ]] &&  hx "$(echo $x|cut -d: -f1)":"$(echo $x|cut -d: -f2)" || true
}

# bound to helix, rg, sk, local .books file
function sk_create_bookmark(){ 
  sk_echo_position >> .books 
}

# bound to helix, rg, sk, local .books file
function sk_echo_position(){ 
 x="$(sk --bind "ctrl-p:toggle-preview" --ansi -i -c "rg --color=always --line-number \"{}\" | sort" --preview="preview.sh -v {}" --preview-window=up:70%)";
 [[ $? -eq 0 ]] &&  echo "$(echo $x|cut -d: -f1)":"$(echo $x|cut -d: -f2)" 
}

function sk_echo_position_absolute() {
  echo -n $PWD/"$(sk_echo_position)"
  
}

alias skridge='sk_preview_find_jump'

alias skbook='sk_create_bookmark'

# bound to helix, sk, local .books file
alias hxbooks='hx $(cat .books | sk --preview="preview.sh -v {}" --preview-window="up:70%" | cut -d" " -f1)'
