
# install & update node version manager
Add-Package 'nvm.portable' -displayName 'Node Version Manager'

# verify node version manager
nvm version | AddVersion -name 'Node Version Manager'

# install & update node
Write-Message "Installing Node ..."
nvm install latest
nvm on
Start-Sleep 1

# verify node
node --version | AddVersion -name 'Node' -replace 'v'
npm --version | AddVersion -name 'NPM'

# install global packages
Write-Message "Installing global Node packages ..."
npm i -g yarn
npm i -g gitmoji-cli

# verify global packages
yarn --version | AddVersion -name 'Yarn'
