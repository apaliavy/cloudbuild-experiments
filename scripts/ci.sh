#!/bin/bash -ex

setup_github () {
 # Setup ssh key
  echo "$GITHUB_SSH_KEY" >> /root/.ssh/id_rsa
  chmod 400 /root/.ssh/id_rsa

  # Setup .ssh/config
  cat <<EOF > /root/.ssh/config
  Host github.com
    IdentityFile /root/.ssh/id_rsa
    User git
    IdentitiesOnly yes
EOF

  # Setup .gitconfig
  cat << EOF > $HOME/.gitconfig
  [url "git@github.com:apaliavy"]
    insteadOf = http://github.com/apaliavy
    insteadOf = https://github.com/apaliavy
    insteadOf = git://github.com/apaliavy
    insteadOf = git+ssh://github.com/apaliavy
EOF
  git config --global user.email "apaliavy@example.com"
  git config --global user.name "test-apaliavy"
}

eval "$@"
