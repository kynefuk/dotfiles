source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
PS1='[\u@\W$(__git_ps1 " (%s)")]\$ '

complete -C /usr/local/Cellar/tfenv/1.0.2/versions/0.11.14/terraform terraform

# history & peco
alias historyp='eval $(history | cut -c 8-|peco)'

#PecoでcdをGUIにする
function peco-cd {
  local sw="1"
  while [ "$sw" != "0" ]
   do
		if [ "$sw" = "1" ];then
			local list=$(echo -e "---$PWD\n../\n$( ls -F | grep / )\n---Show hidden directory\n---Show files, $(echo $(ls -F | grep -v / ))\n---HOME DIRECTORY")
		elif [ "$sw" = "2" ];then
			local list=$(echo -e "---$PWD\n$( ls -a -F | grep / | sed 1d )\n---Hide hidden directory\n---Show files, $(echo $(ls -F | grep -v / ))\n---HOME DIRECTORY")
		else
			local list=$(echo -e "---BACK\n$( ls -F | grep -v / )")
		fi
		
		local slct=$(echo -e "$list" | peco )
		
		if [ "$slct" = "---$PWD" ];then
			local sw="0"
		elif [ "$slct" = "---Hide hidden directory" ];then
			local sw="1"
		elif [ "$slct" = "---Show hidden directory" ];then
			local sw="2"
		elif [ "$slct" = "---Show files, $(echo $(ls -F | grep -v / ))" ];then
			local sw=$(($sw+2))
		elif [ "$slct" = "---HOME DIRECTORY" ];then
			cd "$HOME"
		elif [[ "$slct" =~ / ]];then
			cd "$slct"
		elif [ "$slct" = "" ];then
			:
		else
			local sw=$(($sw-2))
		fi
   done
}
alias sd='peco-cd'

# ghq alias
alias g='cd $(ghq list -p | peco)'
alias gh='hub browse $(ghq list | grep github.com | peco | cut -d "/" -f 2,3)'

# dockr buildkit
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

complete -C /usr/local/Cellar/tfenv/1.0.2/versions/0.12.28/terraform terraform

eval "$(direnv hook bash)"

# alias
alias ls='ls -al -FGt'

# Apply Vim mode to iTerm2
set -o vi

# Docker remove all container
alias dpsa='docker ps -aq'
alias drma='docker rm -f $(dpsa)'
