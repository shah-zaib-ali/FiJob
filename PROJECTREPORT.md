# FiJob — Job Portal System

> A full-stack job portal web application backed by a locally hosted SQL Server Express database, built and demonstrated using SSMS (SQL Server Management Studio).

---

## 📋 Project Overview

FiJob is a locally hosted job portal that connects **Job Seekers** and **Employers** through a shared SQL Server database. The system handles everything from user registration and profile management to job posting, applications, interview scheduling, and real-time notifications.

---

## 🗄️ Database Setup

- Built on **SQL Server Express**, managed via **SSMS (SQL Server Management Studio)**
- Database: `FiJobDB`
- The schema is initialized via a SQL script that seeds two default users:

| Role        | Username   | Full Name        | Company              |
|-------------|------------|------------------|----------------------|
| Employer    | `farisali` | Faris Ali        | Contour Software     |
| Job Seeker  | `shahzaib` | Shahzaib Ali     | —                    |

### Database Tables

| Table                  | Description                              |
|------------------------|------------------------------------------|
| `dbo.USERS`            | Stores all user accounts and credentials |
| `dbo.EMPLOYERS`        | Employer profile and company details     |
| `dbo.JOB_SEEKER_PROFILE` | Job seeker personal and career info    |
| `dbo.JOBS`             | Job listings posted by employers         |
| `dbo.JOB_SKILLS`       | Skills associated with job listings      |
| `dbo.APPLICATIONS`     | Job applications submitted by seekers    |
| `dbo.SAVED_JOBS`       | Jobs bookmarked by job seekers           |
| `dbo.USER_SKILLS`      | Skills added to job seeker profiles      |
| `dbo.NOTIFICATIONS`    | System notifications for users           |
| `dbo.Messages`         | Chat messages between users              |

---

## 🚀 Features

### 🔐 Authentication
- Credential-based login at `/Account/Login`
- Supports separate **Employer** and **Job Seeker** roles
- Credentials verified directly against the local SQL Server database

---

### 👤 Job Seeker Features

#### Profile Management
- Edit personal info, career details, and upload documents/media
- Profile picture updates reflect instantly across the dashboard
- All changes are automatically persisted to the database

#### Skills
- Add/remove professional skills via **My Skills** page
- Skills are used as filters when browsing jobs
- Skills count is reflected in the **Activity Overview** dashboard widget

#### Browse & Save Jobs
- Browse live job listings posted by employers
- Save jobs for later — stored in the `SAVED_JOBS` table
- Track saved jobs from the **My Job Tracker** page

#### Apply for Jobs
- Apply directly from a job listing page
- Application status tracked: `PENDING → INTERVIEW SCHEDULED → APPROVED`

#### My Applications Panel
- View all submitted applications with current status
- See scheduled interview details (date, time, location/link, instructions)
- Chat with employer directly from the panel

#### Notifications
- Receive real-time notifications for:
  - Application approval
  - Interview invitations

---

### 🏢 Employer Features

#### Company Profile
- Update company information and upload company logo
- Logo appears on job listings and the employer dashboard

#### Post a Job
- Fill in job title, description, requirements, salary, location, and type
- Posted jobs are immediately visible to job seekers

#### Manage Jobs
- View all posted jobs with status (`ACTIVE`), post date, and expiry date
- Actions available: **Preview**, **Edit**, **View Applicants**, **Delete**

#### Review Applications
- View all applicants for a job listing
- Download applicant resumes (PDF, auto-retrieved from job seeker profile)
- Actions: **Approve**, **Reject**, **Schedule Interview**, **Message**

#### Schedule Interviews
- Set interview type (Online/Offline), date & time, interviewer name & email
- Provide meeting link and instructions for the applicant
- Scheduling details are pushed to the job seeker's application panel automatically

---

### 💬 Messaging
- Real-time chat between job seekers and employers
- Accessible from both sides (job seeker's application panel and employer's applicant view)

---

## 🔄 End-to-End Flow

```
Employer logs in
    └── Posts a job (Software Engineer .NET Developer)
            └── Job appears in Job Seeker's Browse Jobs

Job Seeker logs in
    └── Browses and saves/applies for the job
            └── Application status: PENDING

Employer reviews application
    └── Downloads resume PDF
    └── Schedules interview (Online, via meet.google/fake-link)
            └── Job Seeker receives interview details + notification

Employer approves candidate
    └── Application status changes to: APPROVED
    └── Job Seeker receives approval notification
```

---

## 🛠️ Tech Stack

| Layer        | Technology                          |
|--------------|-------------------------------------|
| Backend      | ASP.NET Core (C#)                   |
| Frontend     | Razor Views / MVC                   |
| Database     | SQL Server Express (Local)          |
| ORM          | Entity Framework Core               |
| DB Client    | SSMS (SQL Server Management Studio) |
| Dev Server   | IIS Express                         |

---

## ⚙️ Getting Started

### Prerequisites
- [SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- [SSMS](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
- [.NET SDK](https://dotnet.microsoft.com/download)
- Visual Studio (recommended)

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/fijob.git
   cd fijob
   ```

2. **Run the database script in SSMS**
   - Open SSMS and connect to your local SQL Server Express instance
   - Execute the provided `.sql` script to create `FiJobDB` and seed initial data

3. **Update connection string**
   - In `appsettings.json`, update the connection string to point to your local SQL Server instance

4. **Run the application**
   ```bash
   dotnet run
   ```
   Or press **F5** in Visual Studio.

5. **Open in browser**
   ```
   http://localhost:20383/Account/Login
   ```

### Default Credentials

| Role       | Username    | Password     |
|------------|-------------|--------------|
| Employer   | `farisali`  | `employer123`|
| Job Seeker | `shahzaib`  | `jobseeker123`|

---

## 👥 Team

| Name         | Role                    |
|--------------|-------------------------|
| Shahzaib Ali | Developer / Job Seeker Demo Account |
| Faris Ali    | Developer / Employer Demo Account   |

> Employer demo account represents **Contour Software** — a Karachi-based IT company.

---

## 📄 License

This project was built as an academic database project. All rights reserved. time slots, briefing notes, and automated participant invites.

⚡ Instant Messaging Gateway
Synchronous Communication: Powered by SignalR WebSockets, facilitating fluid, zero-latency dialogue between recruiters and talent without requiring manual browser reloads.
