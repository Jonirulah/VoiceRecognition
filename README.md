# VoiceRecognition
Voice Recognition from EvilRP

**Steps**
- Create an account in https://wit.ai/
- Create a New Application (Make Sure to set your visibility to Private and the Recognition Language to whatever you want)
- Once the Application has been created make sure to go the **Management -> Settings** tab
- There you will find the Server Access Token (API Key) which will be used to process all the Voice Recognition requests, copy it and then place the API Key in the **speech_server.py** that you downloaded from this repo
![image](https://i.gyazo.com/23c37db877d6ba20365c2828ec08d684.png)
- Now your speech server is fully configured to be recognizing voices

**Requirements**
- FFMPEG (added in the system PATH)
- Python 3.8
- A server with more than one core in order to process the requests as fast as possible.

**Python Libraries**
- pip install mutagen
- pip install fastapi
- pip install logging
- pip install wit
- pip install uvicorn

**How to run the Speech Server**
- Open a cmd (inside your speech_server folder) and run **uvicorn speech_server:app --workers 8**

However this is not mandatory is recommended to run this service behind Cloudflare or any other reverse proxy HTTP service.
In order to send the requests from **FiveM** to your **speech_server.py**, you have in the **configuration.lua** the **Config.Endpoint** where requests will be sent to

For example if you are running this within a domain/cloudflare etc your **speech_server** listening port should be set to 80  
https://voiceserver.roleplay.net/speech 

But if you are not using a domain/cloudflare your URL should be like this (make sure that you have your port TCP open)  
http://163.210.34.39:8000/speech  

This is completely open-source, you can fork it, recode it, re-style it, do whatever you want with it.
