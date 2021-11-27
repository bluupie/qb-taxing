fx_version 'cerulean'
game 'gta5'

description 'QB-Taxes'
version '1.0.0'

server_script {
    'server/main.lua',
}
client_script {
    'client/main.lua',
}
shared_scripts {
    'config.lua',
    '@qb-core/import.lua',
}