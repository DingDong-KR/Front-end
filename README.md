

# DingDong, Internet-free EHR Program for Medical Volunteers

  

<p  align="center">
  
![제목을-입력해주세요_-001](https://github.com/Chartify-KR/Front-end/assets/111236793/a991be0d-9c3f-4b3a-92b2-7143ae777eff)
 <p  align="center"><b> Enable rapid delivery of medical information in non-networked medical volunteer sites! </b></p>
<br>

Medical volunteers around the world are still suffering from patient bottlenecks due to difficulties in communicating information with poor Internet environments.<br>
Our DingDong team was launched to solve this situation using **Electronic Medical Record** and **Ad-hoc Network**

## 📄 Abstract

In current condition, setting digital infrastructure takes the longest time in setting up the hospital because numerous cables must connect each device.  <br>
<br>

![image](https://github.com/Chartify-KR/Front-end/assets/111236793/50477e69-c6cf-4b24-9472-d1664ff071b2)

In places like field hospital, where every second is valuable, saving lives should be put first in any case. <br>
As medical staffs don’t have enough time to diagnose and cure each patient, insufficient treatment time could deteriorate the quality of the medical services in the long term. <br>
<br>
Also, changes occur at any time in a field hospital. It may be the natural disaster, battle, or bomb terror. In those cases, the team faces urgent need to change their route. <br>
<br>
<img width="1503" alt="image" src="https://github.com/Chartify-KR/Front-end/assets/111236793/de5a56a0-497b-4958-9d11-633d28431f19">


Current cable-based digital environment in field hospital takes too much setup time. <br>
<br>
It shortens the time needed to save the patients and makes the team vulnerable to changes. <br>
<br>

Also, cable-based digital environment is vulnerable to those outbreaks. What if the cable is damaged? What if the hospital must take atypical shape that the cable environment cannot afford? <br>
<br>
Using wireless infrastructure prevents these worries from the first place, making the team agile to the changes. <br>
<br>
Our challenge is to shorten the set-up time by replacing current digital environment into wireless environment, using Ad-hoc technology. <br>
<br>


  
### 📄 UN SDG
![image](https://github.com/Chartify-KR/Front-end/assets/111236793/71812aa3-ec79-45e4-b8fa-88859f8bab1d)

Inspired by the product manager’s experience, Dingdong Chart chose ‘Good Health and Wellbeing’ as the goal to achieve. <br>
<br>
Our product manager is currently running a medical volunteer group in a medical school and felt inconvenience of using paper chart. <br>
<br>
While searching other groups for a hint, we found out that even other medical humanitarian organizations, even big groups like Médecins Sans Frontières or Samsung Seoul Hospital, suffer from similar limits.  <br>
<br>
In the goal, UN aims to decrease several indicators like maternal mortality, which are problem mainly in developing countries. <br>
 <br>
But due to the poor road infrastructure and economic level of the countries, humanitarian organization must visit people rather than waiting for them to come.<br>
<br>
That means medical staffs will face tough conditions requiring swift changes where time is everything that matters. <br>
<br>
“Healthy people are the foundation for healthy economies”, UN said. Team Dingdong resonates with the agenda and will help the teams achieve the goal by providing efficient communication tool.


### Good Health and Wellbeing

#### Target
Medical volunteers in fields
#### Problem
Due to the vulnerability of medical facilities in fields, it is hard to communicate medical information
#### Resolve
We have addressed this issue by introducing ###Local network-based EHR

## 😎 Expectation 
Improved diagnosis and treatment system through accurate and rapid exchange of information between medical volunteers

Providing more equitable care by reducing the time a patient is seen per medical volunteer


## 🛣 Architecture
<p  align="center">
<img width = "1000px" height = "550px" src="https://github.com/Chartify-KR/Front-end/assets/111236793/33a2554b-76cd-4018-bfb6-b58a5bc31252"/>
</p>
Medical volunteer activity can be divided into three main teams: pre-examination, main-examination, and treatment. <br>
<br>
So, taking inspiration from distributed computing, we designated a hub computer for each team and transmitted data generated from each node computer to the hub computer.<br>
<br>
In addition, the hub computer was able to exchange data by communicating with the hub computers of other teams.<br>
<br>
Data integrity is maintained by storing hub computer's data in the internet environment after the fieldwork.<br>
<br>
Uses Firebase to store medical data, synchronizing data among users in the same affiliation before they participate in the medical activity.<br>

## 📚 Project overview
<p>
<img width="1512" alt="image" src="https://github.com/Chartify-KR/Front-end/assets/111236793/936245cd-7646-4697-8837-a4631dcf94f1">
<img width="1512" alt="스크린샷 2024-02-21 오후 10 16 58" src="https://github.com/Chartify-KR/Front-end/assets/111236793/fc453f04-61b4-40d0-9c7c-53bfeae9ebd5">
<img width="1512" alt="스크린샷 2024-02-21 오후 10 17 46" src="https://github.com/Chartify-KR/Front-end/assets/111236793/9571a3e3-15a1-4895-8215-43b5c666957f">



</p>


##  👍 Scalability of the project
- Convenient information management for bedding department and prescription
![침구부 flow](https://github.com/Chartify-KR/Front-end/assets/111236793/e7210f39-7b08-46b7-bc4b-e982c321d345)
![약제부](https://github.com/Chartify-KR/Front-end/assets/111236793/8811d6b5-6ab3-4b0c-9457-37c1615e4881)
- A canvas to convey accurate information about the patient's condition
![그림판 flow1](https://github.com/Chartify-KR/Front-end/assets/111236793/c267cc55-9ffe-4520-be4c-78f63f17577d)
- Speech-to-Text technology for quick treatment and bonding between patients and medical volunteers
- Mobile Dingdong app for quick ROS(Review Of System) and OCR

## ⚙️Tech Stack

### 💻 `FE - Labtop Application`

|service|version|
|--|--|
|**Flutter**|v3.19.0|
|**Android Studio**|2023.1.1.28|
|**Visual Studio Code**|v1.86|
|**Figma**|Saas Service|


### 🚏 `Server - APP(BE)`

|service|version|
|--|--|
|**Google Cloud Service**|Cloud Service|
|**Firebase**|v10|


## 👪 Team Information

- Wontaek Lee (Product Manager)
- KangMin Kim (Frontend)
- Yun-ho Jang (Backend)
- Ho-yeon Choi (Design)
