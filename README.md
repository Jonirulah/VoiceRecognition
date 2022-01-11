# VoiceRecognition
Voice Recognition from EvilRP

**Features**
- Completely FREE (not using paid API's like Microsoft/IBM/Google)
- Voice background removal on FFMPEG Post-Processing.
- Voice length reduction removing the silent parts of the audio with FFMPEG Post-Processing.
- Developers are able to retranslate words in case the API missunderstands it, you'll see if you use it for a while.
- Fast as much as it can be, long voice audio (over 5 seconds) should take more then 4000 msec to process, since this dependes on a lot of factors (network latency for API response times, CPU-load for the FFMPEG Post-Processing) this can depend on your server/computer.

**Tips**
- Recommended to run with more than CPUS above one core even tho one core can work good with it.
- Recommended to run behind Cloudflare or any caching provider for improved response time and all the features that cloudflare provides.

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

This is completely open-source, you can fork it, recode it, re-style it, do whatever you want with it.   And yeah you are able to do PR if you can improve the code, as always I do those things for myself and then since I don't use them, I don't give support as much as I would do with any active project.

This is how the UI looks like in FiveM  
![image](https://cdn.discordapp.com/attachments/809481528965988352/930254448587071518/5a532683db80235821b8497a20ab0e5c.png)  


This has been used with my one-core CPU machine so don't expect worse results than this one!
![image](https://cdn.discordapp.com/attachments/809481528965988352/930254537200136262/54c581d430c2388c20a5f6d71330e50a.png)


