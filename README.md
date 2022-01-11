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

**How to run**
 Open a cmd (inside your speech_server folder) and run **uvicorn speech_server:app --workers 8**
