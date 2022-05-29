#! /bin/sh

echo "Updating brew"
brew update

echo "Installing zshrc"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing git"
brew install git

# install ruby
echo "Installing ruby"
brew install rbenv ruby-build && brew upgrade ruby-build

if [[ $PATH == *"$HOME/.rbenv/bin"* ]]; then
  echo "rbenv is already set."
else
  echo "rbenv is not in path. try to append."
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
fi

eval "$(rbenv init -)"
yes '' | rbenv install 3.1.2
rbenv global 3.1.2
ruby -v

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install node
nvm use node
