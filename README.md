

# DingDong, Internet-free EHR Program for Medical Volunteers

  

<p  align="center">
  
![제목을-입력해주세요_-001](https://github.com/Chartify-KR/Front-end/assets/111236793/a991be0d-9c3f-4b3a-92b2-7143ae777eff)
 <p  align="center"><b> Enable rapid delivery of medical information in non-networked medical volunteer sites! </b></p>
<br>

Medical volunteers around the world are still suffering from patient bottlenecks due to difficulties in communicating information with poor Internet environments.<br>
Our DingDong team was launched to solve this situation using **Electronic Medical Record** and **Ad-hoc Network**

## 📄 Abstract

 Wired network infrastructure, which many medical humanitarian groups use, is taking up too much time and can be damaged so easily.  <br>
 <br>
 Our challenge is to provide more time and agility to the team.<br>
 <br>
 ![image](https://github.com/Chartify-KR/Front-end/assets/111236793/50477e69-c6cf-4b24-9472-d1664ff071b2)
 Due to the lack of internet access, most medical groups have been using cables to facilitate communication between staffs.<br>
 <br>
However, setting wired network takes up a lot of time.<br>
<br>
It is the main reason why medical staffs can’t attend the patients as early as they want. <br>
<br>
<img width="1503" alt="image" src="https://github.com/Chartify-KR/Front-end/assets/111236793/de5a56a0-497b-4958-9d11-633d28431f19">
Also, it causes staff overwork and stress. Because setting wired network shortened the time that should be used to diagnose and treat patients,<br>
<br>
staffs feel like they’re pressed for time. This reduces service quality and the number of patients, hindering achieving our goal.  <br>
<br>
 Also, cables are vulnerable to physical damages. Medical areas are exposed to various outbreaks like natural disaster, bomb attacks, etc.<br>
 <br>
 When the team faces those threats, the team must move very quickly to avoid further damages.<br>
 <br>
 However, wired network is vulnerable and sluggish. What if the cable is cut? <br>
 <br>
 What if the hospital must move to another place several times in a row?<br>
 <br>
 Wireless infrastructure can better protect the team, making the team agile to the changes.<br>
 
  
### 📄 UN SDG
![image](https://github.com/Chartify-KR/Front-end/assets/111236793/31b5f28b-1f70-4061-a751-a4da40946650)

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
