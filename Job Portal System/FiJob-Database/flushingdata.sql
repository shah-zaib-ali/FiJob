-- Created by GitHub Copilot in SSMS - review carefully before executing

-- ========================================
-- STEP 1: DELETE ALL EXISTING DATA (respecting foreign keys)
-- ========================================

DELETE FROM dbo.APPLICATIONS;
DELETE FROM dbo.SAVED_JOBS;
DELETE FROM dbo.USER_SKILLS;
DELETE FROM dbo.NOTIFICATIONS;
DELETE FROM dbo.JOB_SKILLS;
DELETE FROM dbo.JOBS;
DELETE FROM dbo.JOB_SEEKER_PROFILE;
DELETE FROM dbo.EMPLOYERS;
DELETE FROM dbo.USERS;
DELETE FROM dbo.Skills;

-- Reset identity seeds
DBCC CHECKIDENT ('dbo.USERS', RESEED, 0);
DBCC CHECKIDENT ('dbo.EMPLOYERS', RESEED, 0);
DBCC CHECKIDENT ('dbo.JOB_SEEKER_PROFILE', RESEED, 0);
DBCC CHECKIDENT ('dbo.JOBS', RESEED, 0);
DBCC CHECKIDENT ('dbo.APPLICATIONS', RESEED, 0);
DBCC CHECKIDENT ('dbo.NOTIFICATIONS', RESEED, 0);
DBCC CHECKIDENT ('dbo.JOB_SKILLS', RESEED, 0);
DBCC CHECKIDENT ('dbo.USER_SKILLS', RESEED, 0);
DBCC CHECKIDENT ('dbo.Skills', RESEED, 0);
GO

-- ========================================
-- STEP 2: ADD NEW USERS
-- ========================================

-- 1. ADD EMPLOYER: Faris Altaf with Contour Softwares
INSERT INTO dbo.USERS (full_name, email, password_hash, role, username)
VALUES (N'Faris Altaf', N'faris.altaf@contour.com', N'password123', N'Employer', N'faris_altaf')
GO

DECLARE @EmployerUserId INT = (SELECT TOP 1 UserId FROM dbo.USERS WHERE username = 'faris_altaf' ORDER BY UserId DESC)

INSERT INTO dbo.EMPLOYERS (employer_id, company_name, industry, company_description, website, location)
VALUES (@EmployerUserId, N'Contour Softwares', N'IT', N'Software development and consulting', N'https://contour-softwares.com', N'Karachi')
GO

-- 2. ADD JOB SEEKER: Shahzaib Ali
INSERT INTO dbo.USERS (full_name, email, password_hash, role, username)
VALUES (N'Shahzaib Ali', N'shahzaib.ali@email.com', N'password123', N'JobSeeker', N'shahzaib_ali')
GO

DECLARE @SeekerId1 INT = (SELECT TOP 1 UserId FROM dbo.USERS WHERE username = 'shahzaib_ali' ORDER BY UserId DESC)

INSERT INTO dbo.JOB_SEEKER_PROFILE (seeker_id)
VALUES (@SeekerId1)
GO

-- 3. ADD JOB SEEKER: Ali Raza
INSERT INTO dbo.USERS (full_name, email, password_hash, role, username)
VALUES (N'Ali Raza', N'ali.raza@email.com', N'password123', N'JobSeeker', N'ali_raza')
GO

DECLARE @SeekerId2 INT = (SELECT TOP 1 UserId FROM dbo.USERS WHERE username = 'ali_raza' ORDER BY UserId DESC)

INSERT INTO dbo.JOB_SEEKER_PROFILE (seeker_id)
VALUES (@SeekerId2)
GO

-- ========================================
-- STEP 3: VERIFY NEW DATA
-- ========================================

SELECT 'USERS' AS ObjectType, UserId, full_name, email, role, username 
FROM dbo.USERS
UNION ALL
SELECT 'EMPLOYERS', employer_id, company_name, NULL, NULL, NULL 
FROM dbo.EMPLOYERS;
GO