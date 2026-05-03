-- Created by GitHub Copilot in SSMS - review carefully before executing

-- VIEW 1: Active Job Listings with Employer Details
CREATE VIEW vw_active_jobs_with_employer AS
SELECT 
    j.job_id,
    j.job_title,
    j.job_description,
    j.salary_range,
    j.job_type,
    j.location,
    j.posted_date,
    j.expiry_date,
    e.company_name,
    e.industry,
    e.location AS employer_location,
    u.full_name AS contact_person,
    u.email
FROM dbo.JOBS j
INNER JOIN dbo.EMPLOYERS e ON j.employer_id = e.employer_id
INNER JOIN dbo.USERS u ON e.employer_id = u.UserId
WHERE j.status = 'Active'
AND j.expiry_date > GETDATE();
GO

-- VIEW 2: Job Seeker Application History and Status
CREATE VIEW vw_seeker_application_dashboard AS
SELECT 
    u.UserId,
    u.full_name,
    u.email,
    j.job_id,
    j.job_title,
    e.company_name,
    a.application_id,
    a.status,
    a.applied_date,
    DATEDIFF(DAY, a.applied_date, GETDATE()) AS days_since_applied
FROM dbo.USERS u
INNER JOIN dbo.JOB_SEEKER_PROFILE jsp ON u.UserId = jsp.seeker_id
INNER JOIN dbo.APPLICATIONS a ON jsp.seeker_id = a.seeker_id
INNER JOIN dbo.JOBS j ON a.job_id = j.job_id
INNER JOIN dbo.EMPLOYERS e ON j.employer_id = e.employer_id
WHERE u.role = 'JobSeeker';
GO

-- VIEW 3: Job Seeker Skills Profile
CREATE VIEW vw_seeker_skills_profile AS
SELECT 
    u.UserId,
    u.full_name,
    jsp.experience_level,
    jsp.education,
    STRING_AGG(s.skillName, ', ') AS skills
FROM dbo.USERS u
INNER JOIN dbo.JOB_SEEKER_PROFILE jsp ON u.UserId = jsp.seeker_id
LEFT JOIN dbo.USER_SKILLS us ON jsp.seeker_id = us.seeker_id
LEFT JOIN dbo.Skills s ON us.SkillID = s.SkillID
WHERE u.role = 'JobSeeker'
GROUP BY u.UserId, u.full_name, jsp.experience_level, jsp.education;
GO

-- VIEW 4: Job Postings with Required Skills
CREATE VIEW vw_job_skills_mapping AS
SELECT 
    j.job_id,
    j.job_title,
    e.company_name,
    STRING_AGG(s.skillName, ', ') AS required_skills,
    COUNT(s.SkillID) AS total_skills_required,
    j.posted_date,
    j.expiry_date
FROM dbo.JOBS j
INNER JOIN dbo.EMPLOYERS e ON j.employer_id = e.employer_id
LEFT JOIN dbo.JOB_SKILLS js ON j.job_id = js.job_id
LEFT JOIN dbo.Skills s ON js.skillID = s.SkillID
GROUP BY j.job_id, j.job_title, e.company_name, j.posted_date, j.expiry_date;
GO

-- VIEW 5: Employer Analytics - Job Postings and Applications
CREATE VIEW vw_employer_analytics AS
SELECT 
    e.employer_id,
    u.full_name,
    e.company_name,
    COUNT(DISTINCT j.job_id) AS total_jobs_posted,
    COUNT(DISTINCT a.application_id) AS total_applications_received,
    COUNT(CASE WHEN a.status = 'Under Review' THEN 1 END) AS pending_review,
    COUNT(CASE WHEN a.status = 'Accepted' THEN 1 END) AS accepted,
    COUNT(CASE WHEN a.status = 'Rejected' THEN 1 END) AS rejected
FROM dbo.EMPLOYERS e
INNER JOIN dbo.USERS u ON e.employer_id = u.UserId
LEFT JOIN dbo.JOBS j ON e.employer_id = j.employer_id
LEFT JOIN dbo.APPLICATIONS a ON j.job_id = a.job_id
GROUP BY e.employer_id, u.full_name, e.company_name;
GO