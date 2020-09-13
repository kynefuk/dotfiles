export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH=/usr/local/bin/git:$PATH
export PYENV_ROOT=/usr/local/var/pyenv

# GO
export PATH=/usr/local/go/bin:$PATH
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin

# nodebrew
export PATH=$PATH:/Users/moritakee/.nodebrew/current/bin

# pyenvさんに自動補完機能を提供してもらう
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

 if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
 fi

# .bashrcの読み込み
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# MYSQLをPATHに追加
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/moritakee/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/moritakee/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/moritakee/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/moritakee/Downloads/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$HOME/.poetry/bin:$PATH"

# docker command completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
 fi
