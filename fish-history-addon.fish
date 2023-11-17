# Replacement for !number history substitution feature in bash and zsh
# Usage: h <index number of command>
# NOTE: Index number is the number preceding the command in the output of 'history'
function h
  set prgmcmd (history -R | command cat -n | awk "NR==$argv{print $0}" | awk '{print $2}')
  set prgmargs (history -R | command cat -n | awk "NR==$argv{print $0}" | awk -F "$prgmcmd" '{print $2}')
  echo "$prgmcmd $prgmargs"
  eval "$prgmcmd $prgmargs"
end
