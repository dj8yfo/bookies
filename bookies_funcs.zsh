
  
# bound to helix, rg, sk
function sk_preview_find_jump(){ 
  x="$(sk --bind "ctrl-p:toggle-preview" --ansi -i -c "rg --color=always --line-number \"{}\" | sort" --preview="preview.sh -v {}" --preview-window=up:50%:hidden)"; 
  [[ $? -eq 0 ]] &&  hx "$(echo $x|cut -d: -f1)":"$(echo $x|cut -d: -f2)" || true
}

# bound to helix, rg, sk, local .books file
function sk_create_bookmark(){ 
 x="$(sk --bind "ctrl-p:toggle-preview" --ansi -i -c "rg --color=always --line-number \"{}\" | sort" --preview="preview.sh -v {}" --preview-window=up:50%:hidden)";
 [[ $? -eq 0 ]] &&  echo "$(echo $x|cut -d: -f1)":"$(echo $x|cut -d: -f2)" >> .books 
}

alias skridge='sk_preview_find_jump'

alias skbook='sk_create_bookmark'

# TODO: improve with preivew function
# bound to helix, sk, local .books file
alias hxbooks='hx $(cat .books | sk | cut -d" " -f1)'
