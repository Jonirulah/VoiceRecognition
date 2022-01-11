fx_version 'adamant'
games { 'gta5' };

name 'VoiceRecognition'
author 'Jonirulah'
description 'Voice Recognition from EvilRP, made open-source by Jonirulah'


ui_page 'html/main.html'
lua54 'yes'

files {
    'html/main.html',
    'html/SpeechRecognition.js',
    'html/style.css',
}

client_scripts {
    'client/client.lua',
    'configuration.lua'
}

