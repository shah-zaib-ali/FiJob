---

## 🚀 Features

<div align="center">

### 🔐 Authentication

![Credential Login](https://img.shields.io/badge/Login-Credential--Based-blue?style=for-the-badge&logo=shield&logoColor=white)
![Employer Role](https://img.shields.io/badge/Role-Employer-orange?style=for-the-badge&logo=briefcase&logoColor=white)
![Job Seeker Role](https://img.shields.io/badge/Role-Job--Seeker-green?style=for-the-badge&logo=person&logoColor=white)
![SQL Server](https://img.shields.io/badge/Auth--DB-SQL--Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)

</div>

- 🔑 Credential-based login at `/Account/Login`
- 👥 Supports separate **Employer** and **Job Seeker** roles
- 🗄️ Credentials verified directly against the local **SQL Server** database

---

### 👤 Job Seeker Features

#### 🪪 Profile Management

![Profile](https://img.shields.io/badge/Profile-Management-6DA55F?style=for-the-badge&logo=person&logoColor=white)
![Upload](https://img.shields.io/badge/Documents-Upload--Supported-3670A0?style=for-the-badge&logo=files&logoColor=white)
![Instant Sync](https://img.shields.io/badge/Changes-Auto--Persisted-FF6F00?style=for-the-badge&logo=database&logoColor=white)

- ✏️ Edit personal info, career details, and upload documents/media
- 🖼️ Profile picture updates reflect **instantly** across the dashboard
- 💾 All changes are automatically persisted to the database

---

#### 🧠 Skills

![Skills](https://img.shields.io/badge/Skills-Add%20%2F%20Remove-F7931E?style=for-the-badge&logo=lightbulb&logoColor=white)
![Filters](https://img.shields.io/badge/Skills-Used%20as%20Job%20Filters-0077B5?style=for-the-badge&logo=filter&logoColor=white)

- ➕ Add / remove professional skills via the **My Skills** page
- 🔍 Skills are used as **filters** when browsing jobs
- 📊 Skills count reflected in the **Activity Overview** dashboard widget

---

#### 💼 Browse & Save Jobs

![Browse](https://img.shields.io/badge/Jobs-Browse%20Live%20Listings-4ea94b?style=for-the-badge&logo=briefcase&logoColor=white)
![Save](https://img.shields.io/badge/Jobs-Save%20for%20Later-FF9900?style=for-the-badge&logo=bookmark&logoColor=white)
![Tracker](https://img.shields.io/badge/Tracker-My%20Job%20Tracker-3F4F75?style=for-the-badge&logo=checkmark&logoColor=white)

- 🌐 Browse live job listings posted by employers
- 🔖 Save jobs for later — stored in the `SAVED_JOBS` table
- 📋 Track saved jobs from the **My Job Tracker** page

---

#### 📨 Apply for Jobs

![Apply](https://img.shields.io/badge/Apply-Direct%20from%20Listing-DD0031?style=for-the-badge&logo=send&logoColor=white)
![Status](https://img.shields.io/badge/Status-PENDING%20→%20INTERVIEW%20→%20APPROVED-150458?style=for-the-badge&logo=timeline&logoColor=white)

- 🖱️ Apply directly from a job listing page
- 📈 Application status tracked:

<div align="center">

![Pending](https://img.shields.io/badge/1-PENDING-gray?style=for-the-badge)
![Interview](https://img.shields.io/badge/2-INTERVIEW%20SCHEDULED-orange?style=for-the-badge)
![Approved](https://img.shields.io/badge/3-APPROVED-brightgreen?style=for-the-badge)

</div>

---

#### 📁 My Applications Panel

![Panel](https://img.shields.io/badge/Applications-Full%20Panel%20View-0C55A5?style=for-the-badge&logo=clipboard&logoColor=white)
![Interview Details](https://img.shields.io/badge/Interviews-Date%20%7C%20Time%20%7C%20Location-EE4C2C?style=for-the-badge&logo=calendar&logoColor=white)
![Chat](https://img.shields.io/badge/Chat-Message%20Employer-6DA55F?style=for-the-badge&logo=chat&logoColor=white)

- 📄 View all submitted applications with **current status**
- 🗓️ See scheduled interview details (date, time, location/link, instructions)
- 💬 Chat with employer **directly** from the panel

---

#### 🔔 Notifications

![Notifications](https://img.shields.io/badge/Notifications-Real--Time-FF6F00?style=for-the-badge&logo=bell&logoColor=white)

- ✅ Application **approval** alerts
- 📅 **Interview invitation** notifications

---

### 🏢 Employer Features

#### 🏷️ Company Profile

![Company Profile](https://img.shields.io/badge/Company-Profile%20Management-0077B5?style=for-the-badge&logo=building&logoColor=white)
![Logo Upload](https://img.shields.io/badge/Logo-Upload%20%26%20Display-F80000?style=for-the-badge&logo=image&logoColor=white)

- 🏢 Update company information and upload company logo
- 🖼️ Logo appears on **job listings** and the **employer dashboard**

---

#### 📝 Post a Job

![Post Job](https://img.shields.io/badge/Post-New%20Job%20Listing-brightgreen?style=for-the-badge&logo=plus&logoColor=white)
![Visibility](https://img.shields.io/badge/Visibility-Immediate-4ea94b?style=for-the-badge&logo=eye&logoColor=white)

- 📋 Fill in job title, description, requirements, salary, location, and type
- 🚀 Posted jobs are **immediately visible** to job seekers

---

#### 🗂️ Manage Jobs

![Manage](https://img.shields.io/badge/Jobs-Full%20Management%20Panel-3F4F75?style=for-the-badge&logo=settings&logoColor=white)
![Status](https://img.shields.io/badge/Status-ACTIVE-brightgreen?style=for-the-badge)

- 📊 View all posted jobs with status, post date, and expiry date
- ⚡ Actions available:

<div align="center">

![Preview](https://img.shields.io/badge/Action-Preview-blue?style=for-the-badge)
![Edit](https://img.shields.io/badge/Action-Edit-orange?style=for-the-badge)
![Applicants](https://img.shields.io/badge/Action-View%20Applicants-purple?style=for-the-badge)
![Delete](https://img.shields.io/badge/Action-Delete-red?style=for-the-badge)

</div>

---

#### 👥 Review Applications

![Review](https://img.shields.io/badge/Applicants-Full%20Review%20Panel-CC2927?style=for-the-badge&logo=users&logoColor=white)
![Resume](https://img.shields.io/badge/Resume-PDF%20Auto--Download-150458?style=for-the-badge&logo=pdf&logoColor=white)

- 📄 View all applicants for a job listing
- 📥 Download applicant resumes (PDF, auto-retrieved from job seeker profile)
- ⚡ Actions available:

<div align="center">

![Approve](https://img.shields.io/badge/Action-Approve-brightgreen?style=for-the-badge)
![Reject](https://img.shields.io/badge/Action-Reject-red?style=for-the-badge)
![Schedule](https://img.shields.io/badge/Action-Schedule%20Interview-orange?style=for-the-badge)
![Message](https://img.shields.io/badge/Action-Message-blue?style=for-the-badge)

</div>

---

#### 🗓️ Schedule Interviews

![Schedule](https://img.shields.io/badge/Interview-Schedule%20System-FF9900?style=for-the-badge&logo=calendar&logoColor=white)
![Online](https://img.shields.io/badge/Type-Online-4285F4?style=for-the-badge&logo=video&logoColor=white)
![Offline](https://img.shields.io/badge/Type-Offline-6DA55F?style=for-the-badge&logo=location&logoColor=white)

- 🎯 Set interview type (**Online / Offline**), date & time, interviewer name & email
- 🔗 Provide meeting link and instructions for the applicant
- 📲 Scheduling details are **automatically pushed** to the job seeker's application panel

---

### 💬 Messaging

![Realtime Chat](https://img.shields.io/badge/Chat-Real--Time%20Messaging-039BE5?style=for-the-badge&logo=chat&logoColor=white)
![Job Seeker](https://img.shields.io/badge/Access-Job%20Seeker%20Panel-6DA55F?style=for-the-badge&logo=person&logoColor=white)
![Employer](https://img.shields.io/badge/Access-Employer%20Panel-orange?style=for-the-badge&logo=building&logoColor=white)

- ⚡ Real-time chat between **job seekers** and **employers**
- 🔁 Accessible from both sides — job seeker's application panel & employer's applicant view

---
