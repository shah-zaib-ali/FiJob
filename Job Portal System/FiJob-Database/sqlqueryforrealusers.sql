USE FiJobDB
GO

-- =============================================
-- STEP 1: DELETE ALL DEPENDENT DATA FIRST
-- (Order matters due to foreign key constraints)
-- =============================================

-- Remove applications (FK to JOB_SEEKER_PROFILE and JOBS)
DELETE FROM APPLICATIONS;

-- Remove saved jobs (FK to JOB_SEEKER_PROFILE and JOBS)
DELETE FROM SAVED_JOBS;

-- Remove user skills (FK to JOB_SEEKER_PROFILE)
DELETE FROM USER_SKILLS;

-- Remove notifications (FK to USERS)
DELETE FROM NOTIFICATIONS;

-- Remove job skills (FK to JOBS)
DELETE FROM JOB_SKILLS;

-- Remove all jobs (FK to EMPLOYERS)
DELETE FROM JOBS;

-- Remove all employer profiles
DELETE FROM EMPLOYERS;

-- Remove all job seeker profiles
DELETE FROM JOB_SEEKER_PROFILE;

-- Remove all users (employers and job seekers)
DELETE FROM USERS;

-- =============================================
-- STEP 2: INSERT NEW EMPLOYER (Faris Ali)
-- =============================================

INSERT INTO USERS (full_name, email, password_hash, role, username)
VALUES ('Faris Ali', 'faris@contour-software.com', 'employer123', 'Employer', 'farisali');

-- Capture the auto-generated UserId for Faris Ali
DECLARE @EmployerUserId INT = SCOPE_IDENTITY();

INSERT INTO EMPLOYERS (employer_id, company_name, industry, company_description, website, location)
VALUES (
    @EmployerUserId,
    'Contour Software',
    'IT',
    'Contour Software is a Karachi-based technology company specializing in delivering innovative software solutions and IT services. With a focus on quality and client satisfaction, Contour partners with businesses to design, develop, and deploy scalable applications that drive growth and efficiency.',
    'https://contour-software.com/',
    'Karachi'
);

-- =============================================
-- STEP 3: INSERT NEW JOB SEEKER (Shahzaib Ali)
-- =============================================

INSERT INTO USERS (full_name, email, password_hash, role, username)
VALUES ('Shahzaib Ali', 'shahzaib@example.com', 'jobseeker123', 'Job Seeker', 'shahzaib');

-- Capture the auto-generated UserId for Shahzaib Ali
DECLARE @SeekerUserId INT = SCOPE_IDENTITY();

INSERT INTO JOB_SEEKER_PROFILE (seeker_id)
VALUES (@SeekerUserId);

-- =============================================
-- STEP 4: VERIFY THE RESULTS
-- =============================================

SELECT 'USERS' AS TableName, * FROM USERS;
SELECT 'EMPLOYERS' AS TableName, * FROM EMPLOYERS;
SELECT 'JOB_SEEKER_PROFILE' AS TableName, * FROM JOB_SEEKER_PROFILE;