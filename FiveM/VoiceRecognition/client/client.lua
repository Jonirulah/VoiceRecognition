record = nil
speech_token = nil
speech_url = nil

Citizen.CreateThread(function()
    RegisterKeyMapping('voicerecognition', 'Activate Voice Recognition', 'KEYBOARD', "Z")
    RegisterKeyMapping('acceptvoicerecognition', 'Accept recognized voice', 'KEYBOARD', "RIGHT")
    RegisterKeyMapping('declinevoicerecognition', 'Decline recognized voice', 'KEYBOARD', "LEFT")

end)

RegisterCommand('voicerecognition', function()
    if record == nil or record == false then
        SendNUIMessage({
            record = "true"
        })
        record = true
    elseif record == true then
        SendNUIMessage({
            record = "false",
            url = Config.Endpoint,
        })     
        record = false   
    end
end)

RegisterCommand('acceptvoicerecognition', function()
    SendNUIMessage({
        send = "true"
    })
    TriggerEvent(_recognizedVoiceData, data)
    ResetEnvironment()
end)

RegisterCommand('declinevoicerecognition', function()
    SendNUIMessage({
        send = "false"
    })
    ResetEnvironment()
end)

function ProcessText(_text)
    -- Retranslate
    for k, v in pairs(Config.ReTranslate) do
        _text = _text:gsub(k,v)
    end

    -- Remove action words from text to send
    for k,v in pairs(Config.Voices) do
        _text = _text:gsub(k,"")
    end
    return _text
end

function ResetEnvironment()
    _recognizedVoiceData = nil
    _intent = nil
    _recognizedVoice = false
    action = nil
    status = nil
    recognized_text = nil
end

RegisterNUICallback("send_text", function(data, cb)
    ResetEnvironment()
    -- Retranslate & Ban words
    _text = data
    for k, v in pairs(Config.Voices) do
        -- Recognize text
        if string.find(_text, k) then
            _recognizedVoice = true
            _recognizedVoiceData = v
            _intent = k
            break
        end
    end
    _text = ProcessText(data)
    -- Send Message to Frontend on Processed Input
    if _recognizedVoice then
        SendNUIMessage({
            action = string.upper(_intent),
            status = "Reconocimiento de voz (Finalizado)",
            recognized_text = _text,

        })
    else
        SendNUIMessage({
            action = "No detectada",
            status = "Reconocimiento de voz (Error-Acción)",
            recognized_text = _text,
        })
    end
end)