# MAYA AI — Dark Orb Redesign (Android Starter)

यह नया स्वतंत्र Android प्रोजेक्ट है। मूल ROX APK/कोड को इसमें बदला या शामिल नहीं किया गया।

## इस संस्करण में शामिल
- डार्क MAYA होम स्क्रीन
- एनिमेटेड हरा Orb; सुनने/बोलने/idle के अलग रंग
- स्क्रीन किनारे पर रंगीन glow
- मुख्य स्क्रीन पर केवल Mic और Camera controls
- Profile और menu
- 37 फीचर switches Settings में
- माइक्रोफोन permission माँगना और Android SpeechRecognizer से हिंदी voice input
- Android system TextToSpeech से साधारण हिंदी उत्तर
- Chrome / YouTube / WhatsApp खोलने के कुछ basic voice intents
- Self Test status dialog

## अभी शामिल नहीं / पूर्ण काम नहीं करते
- Original ROX voice/audio assets, Gemini Live/Kore voice, always-on background wake word
- Gemini API integration / वास्तविक AI coding generation
- WhatsApp संदेश भेजना/पढ़ना, Telegram, कॉल answer/caller identification, Maps live routing,
  YouTube upload, OCR, website publishing, full cyber defence
- Persistent Important Call Numbers screen (अभी placeholder)
- Edge light thickness slider और पूर्ण permission center

पुरानी ROX voice को ज्यों का त्यों रखने के लिए उसकी मूल voice files/authorized source project चाहिए। इस starter में system TTS है, इसलिए इसे ROX voice के समान न समझें।

## इस ZIP की वास्तविक स्थिति (25 नवंबर 2026 की कोड-जाँच)

यह प्रोजेक्ट एक Android Java ऐप है; इसे अभी वास्तविक Vivo Y18 पर प्रमाणित नहीं किया गया है। README में पुराने संस्करणों के कुछ दावे और शुरुआती Starter विवरण साथ मौजूद थे, इसलिए नीचे की स्थिति को प्राथमिक मानें:

- मौजूद कोड: MAYA UI, Android SpeechRecognizer आधारित voice input, Android TextToSpeech fallback, Gemini HTTP request/streaming code, ऐप खोलने के कुछ voice commands, Camera2 आधारित कैमरा, Settings UI, Accessibility/Notification listener सेवाएँ।
- इस ZIP में Gemini Live/WebSocket voice session का प्रमाणित implementation नहीं मिला।
- Notification listener केवल समर्थित ऐप notifications से उपलब्ध text पढ़ता है; यह चैट इतिहास या सभी media/files तक सीधी पहुँच नहीं देता।
- `MayaAccessService.onAccessibilityEvent()` खाली है; Accessibility की हर घोषित क्षमता लागू नहीं है।
- Boot पर Android 10+ background activity launch और Android 14+ microphone foreground-service नियम लागू होते हैं। अब boot receiver सूचना दिखाता है; user के टैप के बाद ऐप खुलेगा।
- कॉल/मैसेज/Accessibility जैसे संवेदनशील काम OEM, Android version, granted permissions और target app के UI पर निर्भर हैं।

**महत्वपूर्ण:** इस ZIP की static जाँच में Gradle/Android SDK उपलब्ध न होने के कारण APK compile/test नहीं हुआ। इसे “बिना एरर” या “Vivo Y18 पर tested” नहीं कहा जा सकता।

## Build
- Android Gradle Plugin 8.7.3
- Gradle 8.9
- JDK 17
- Android SDK Platform 35
- Android Studio में project root खोलकर Sync, फिर Build APK.
- GitHub Actions workflow debug APK बनाता है जब project GitHub repository में push हो।

## v2.8 में नया
- बात सुनते ही तुरंत "जी बॉस" (Gemini की मीठी आवाज़ पहले से तैयार रखी जाती है); ऐप खुलते ही बॉस कहकर स्वागत
- "ओपन करो", "व्हाट्सअप" जैसे देवनागरी शब्द अब पहचाने जाते हैं
- आवाज़ चुनने की सूची (Sulafat, Achernar, Vindemiatrix, Leda, Aoede, Kore...) और ज़्यादा भावुक अंदाज़
- कोई जवाब 8 सेकंड तक न मिले तो Maya बोलकर बताती है

## v2.7 में नया
- "बॉस" अब देवनागरी में बोला जाता है
- फोटो अब ऐप के अंदर ही खिंचती है (लाइव प्रीव्यू, तीन-दो-एक, गैलरी में Pictures/Maya); न चले तो सिस्टम कैमरा खुलता है
- ऐप खोलना तेज़: पूरा वाक्य ख़त्म होने से पहले ही काम शुरू
- Gemini Key: "Key लो" और "Key पेस्ट करो" बटन, सेटअप गाइड में भी
- Gemini आवाज़ और जवाब का मॉडल न मिले (404) तो अपने आप दूसरा मॉडल; आवाज़ न चले तो एरर की वजह स्क्रीन पर
- आवाज़ टेस्ट, फ़ोन की आवाज़ चुनना
- WhatsApp मैसेज अपने आप Send (Accessibility चालू हो तो)
- Google Maps नेविगेशन ("लोकेशन लगाओ X"), स्पीड बताना
- कॉन्टैक्ट मिलान बेहतर (ओमकार / Omkar / Onkar)
- Play Store: हिंदी नाम का अंग्रेज़ी अनुवाद; Termux के लिए F-Droid
- "जल्द आएगा" वाली सेटिंग हटाई

## v2.6 में नया
- पहली बार खुलते ही सेटअप गाइड: सारी अनुमतियाँ और ज़रूरी स्क्रीन एक-एक करके बोलकर
- लोकेशन: "मैं कहाँ हूँ", "लोकेशन X को भेजो"; SOS ("बचाओ") पर आपातकालीन नंबर को कॉल
- रिमाइंडर/दवा का अलार्म, फ़ोन की सेटिंग वॉइस से, स्क्रीनशॉट/नोटिफ़िकेशन/रीसेंट/लॉक
- स्क्रीन पढ़कर सुनाना, टाइप करना, अगली/पिछली रील स्वाइप, लाइक/सब्सक्राइब
- भजन/आरती/समाचार, चुटकुला, स्टोरेज, किसी कॉन्टैक्ट का नंबर बताना

## v2.5 में नया (बुज़ुर्ग / हैंड्स-फ़्री)
- कॉल आते ही Maya बोलती है: "मनोज का कॉल आ रहा है, उठाऊँ?" (हाँ = उठाना, नहीं = काटना)
- अनजान नंबर: "ये कंपनी का नहीं लगता, आख़िरी 6 अंक ...". कंपनी के नंबर (140/160/1800) अपने आप कटते हैं और बताती है
- कॉल की घोषणा ऑफ़लाइन में भी, तुरंत (तेज़ Android आवाज़ से)
- Accessibility से स्क्रीन पर अपने आप Install/Open/Back/Scroll, "X इंस्टॉल करो" बोलने पर Play Store में इंस्टॉल
- वीडियो रोको / चलाओ / अगला / पिछला
- मिस्ड कॉल पढ़ना
- फ़ोन चालू होते ही Maya अपने आप शुरू (बुज़ुर्ग मोड)
- इंटरनेट लौटते ही अपने आप ऑनलाइन; ऑफ़लाइन में फ़ोन की सबसे अच्छी आवाज़ अपने आप चुनी जाती है
- Gemini की आवाज़ और ज़्यादा भावुक ("Emotional" अंदाज़)

## v2.3 में नया
- माइक की "कट-कट" बीप बंद (सेटिंग: माइक की बीप बंद करो)
- तेज़ जवाब: Gemini का जवाब वाक्य-दर-वाक्य बोलना शुरू हो जाता है
- होम पर गियर के बाजू में AI ON/OFF बटन: OFF = सिर्फ़ ऑफ़लाइन काम, Key सुरक्षित
- नीचे 5 बटन: गैलरी, सेल्फ़ी, माइक (बड़ा), कैमरा, चुप मोड
- चुप मोड: "माया, मैं काम कर रहा हूँ" बोलने पर चुप; "माया" बोलने पर वापस
- ऑफ़लाइन काम: ऐप खोलना, कॉल (नाम से, नंबर बोलकर पूछना), कॉल उठाना/काटना, टाइमर, अलार्म, टॉर्च, वॉल्यूम, बैटरी, समय, कैलकुलेशन, गैलरी, कैमरा, मैप्स
- मैसेज पढ़ना और रिप्लाई (भाषा पूछकर), WhatsApp मैसेज तैयार करना, YouTube/Google/Play Store खोज, Termux कमांड चलाना
- 13 भारतीय भाषाएँ; Gemini की मीठी आवाज़ (Kore/Puck) का ऑप्शन

## v2.2 में नया: 40 सेटिंग + Gemini
- गियर आइकन > Settings (40): नाम, उपनाम, Gemini API Key, मॉडल का नाम, Memory, आवाज़, लुक, सुरक्षा
- 28 सेटिंग अभी असल में काम करती हैं; बाक़ी 12 पर "जल्द आएगा" लिखा है और वे सिर्फ़ सेव होती हैं
- Gemini API Key डालने पर Maya के जवाब Gemini से आते हैं (Key: aistudio.google.com/apikey)
- मेन्यू में "Test Gemini" बटन से Key जाँचें
- Key सिर्फ़ फ़ोन में ऐप की निजी जगह सेव होती है

## v2.1 में नया
- ऐप का नाम और आइकन: गोल आइकन, रंगीन टिपके और बीच में रंग-बिरंगा MAYA
- होम स्क्रीन पर सिर्फ़ बड़ा घूमता ऑर्ब, जिसमें रंगीन टिपकों की दो रिंग, दो सफ़ेद घूमने वाले तारे और रंग बदलता MAYA है
- किनारे की रंगीन लाइट अब गोल-गोल घूमती है
- माइक, कैमरा, सेटिंग (गियर) और प्रोफ़ाइल के असली आइकन
- APK का नाम Maya.apk

## इस संस्करण के सुधार
- Android 11+ पर Chrome/YouTube/WhatsApp खुलने का बग ठीक (manifest में queries जोड़े)
- Android 15 पर ऊपर/नीचे का हिस्सा सिस्टम बार के पीछे छिपता था, ठीक किया
- माइक अब तब तक चालू रहता है जब तक आप ख़ुद बंद न करें; Maya के बोलने के बाद फिर सुनती है
- Maya का बोलना ख़त्म होने का सही पता चलता है (पहले अंदाज़े से टाइमर था)
- एनिमेशन स्क्रीन बदलने पर बंद होते हैं (बैटरी बचत)
- Termux के लिए `termux_build.sh`

## Termux
`bash termux_build.sh` (विवरण docs/BUILD_GUIDE.md में)
