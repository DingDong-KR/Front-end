

# DingDong - Network-free EHR Program for Medical Volunteers

  

<p  align="center">
<img  width="1000px"  height = "175px"  src="https://user-images.githubusercontent.com/111236793/212054463-d4fd811f-6622-4b2b-8393-8bdbb8897077.png"/>
</p>

 <p  align="center"><b> Enable rapid delivery of medical information in non-networked medical volunteer sites! </b></p>
<br>

Medical volunteers around the world are still suffering from patient bottlenecks due to difficulties in communicating information with poor Internet environments.<br>
Our DingDong team was launched to solve this situation using **Electronic Medical Record** and **Ad-hoc Network**

 
## 😎 Expectation 
Children can feel connected to each other and motivated even when they use our Sgether platform.  

In addition, AI's learning supervision allows you to objectively grasp your own learning status.

## 📄 Abstract

Current cable-based digital environment in field hospital takes too much setup time. <br>
<br>
It shortens the time needed to save the patients and makes the team vulnerable to changes. <br>
<br>
Our challenge is to shorten the set-up time by replacing current digital environment into wireless environment, using Ad-hoc technology. <br>
<br>
In places like field hospital, where every second is valuable, saving lives should be put first in any case. <br>
<br>
It means we should save the time spent elsewhere. In current condition, setting digital infrastructure takes the longest time in setting up the hospital because numerous cables must connect each device.  <br>
<br>
As medical staffs don’t have enough time to diagnose and cure each patient, insufficient treatment time could deteriorate the quality of the medical services in the long term. <br>
<br>
Also, changes occur at any time in a field hospital. It may be the natural disaster, battle, or bomb terror. In those cases, the team faces urgent need to change their route. <br>
<br>
However cable-based digital environment is vulnerable to those outbreaks. What if the cable is damaged? What if the hospital must take atypical shape that the cable environment cannot afford? <br>
<br>
Using wireless infrastructure prevents these worries from the first place, making the team agile to the changes. <br>

  
### 📄 UN SDG
![enter image description here](https://user-images.githubusercontent.com/111236793/229104885-08f072f1-83ad-4603-9bd4-bed9f79638bf.png)
Inspired by the product manager’s experience, Dingdong Chart chose ‘Good Health and Wellbeing’ as the goal to achieve. 
Our product manager is currently running a medical volunteer group in a medical school and felt inconvenience of using paper chart. While searching other groups for a hint, he found out that even other medical humanitarian organizations, even big groups like Médecins Sans Frontières or Samsung Seoul Hospital, suffer from similar limits.  
 In the goal, UN aims to decrease several indicators like maternal mortality, which are problem mainly in developing countries. But due to the poor road infrastructure and economic level of the countries, humanitarian organization must visit people rather than waiting for them to come. That means medical staffs will face tough conditions requiring swift changes where time is everything that matters. 
“Healthy people are the foundation for healthy economies”, UN said. Team Dingdong resonates with the agenda and will help the teams achieve the goal by providing efficient communication tool.


### Quality Education & Reduce Inequality

#### target
Children who, due to geographical or environmental limitations, cannot receive a certain level of education.
#### problem
Due to the difficulty of conducting face-to-face classes, remote classes need to be conducted. However, there are challenges in monitoring students' level of focus
#### resolve
We have addressed this issue by introducing AI proctoring.

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
<p  align="center">
<img width = "250px" height = "500px" src="https://user-images.githubusercontent.com/76484900/227690312-6296bc19-ab94-418b-ac83-76dc9fdfb836.png"/>
<img width = "250px" height = "500px" src="https://user-images.githubusercontent.com/76484900/227690317-f8f6294e-3d75-4ba4-8a95-1464a2609397.png"/>
<img width = "250px" height = "500px" src="https://user-images.githubusercontent.com/76484900/227690318-78d17535-1bae-4940-bb0f-5b8bda74ab26.png"/>
</p>


##  👍 Scalability of the project
Beyond self-study proctoring, we will collaborate with other large-scale education platforms to provide learning content. As a result, more users will be attracted, and more efficient and effective learning will be achieved through our project's technology.

We are also deploying the service using AWS EC2 cloud service. Therefore, scaling up based on the size of users can be easily performed and expansion can be prepared by dynamically increasing servers according to demand.



 

## ⚙️Tech Stack


### 🚏 `Server - APP(BE)`

|service|version|
|--|--|
|**NodeJS**|v16.x|
|**EXPRESS**|v4.x|
|**REDIS**|v3.0.x|
|**MySQL**|5.7.x|

  

### 📱 `FE - APP`

|service|version|
|--|--|
|**Android Studio**|v4.2|
|**Figma**|web_service|
|**webRTC**|open-source|

  

### 💻 `ML - embedded`

|service|version|
|--|--|
|**python**|v3.11.2|
|**Yolov5**|v5|

  


## 👪 Team Information
![enter image description here](https://user-images.githubusercontent.com/111236793/229105497-637d9283-f492-466e-ba76-4351eda3db79.png)

- YoungHwan Phan(lopahn2@gmail.com), Github Id: lopahn2 (Server, Database)
- KangMin Kim (rkdals0203@gmail.com), Github Id: rkdals0203 (APP Frontend)
- HongMu Chae (hongmuchae@gmail.com), Github Id: Hong-Mu (APP Frontend)
- JaeHoon Bang (dev.appendCBangJ@gmail.com), Github Id: devappendCBangJ (Deep Learning)
