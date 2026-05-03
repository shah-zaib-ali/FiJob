

-- First, create the AuditLog table that Trigger 1 depends on
CREATE TABLE dbo.AuditLog (
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    table_name VARCHAR(128) NOT NULL,
    record_id INT NOT NULL,
    old_value VARCHAR(MAX),
    new_value VARCHAR(MAX),
    changed_at DATETIME NOT NULL,
    action VARCHAR(50) NOT NULL
);
GO

-- TRIGGER 1 (Fixed): Audit Job Applications
CREATE TRIGGER trg_log_application_status_change
ON dbo.APPLICATIONS
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(status)
    BEGIN
        INSERT INTO dbo.AuditLog (table_name, record_id, old_value, new_value, changed_at, action)
        SELECT 
            'APPLICATIONS',
            i.application_id,
            d.status,
            i.status,
            GETDATE(),
            'UPDATE'
        FROM inserted i
        INNER JOIN deleted d ON i.application_id = d.application_id
        WHERE i.status <> d.status;
    END
END;
GO



-- TRIGGER 2: Auto-create Job Seeker Profile when User Created as Seeker
CREATE TRIGGER trg_auto_create_seeker_profile
ON dbo.USERS
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.JOB_SEEKER_PROFILE (seeker_id)
    SELECT UserId
    FROM inserted
    WHERE role = 'JobSeeker'
    AND NOT EXISTS (
        SELECT 1 FROM dbo.JOB_SEEKER_PROFILE 
        WHERE seeker_id = inserted.UserId
    );
END;
GO

-- TRIGGER 3: Auto-create Employer Profile when User Created as Employer
CREATE TRIGGER trg_auto_create_employer_profile
ON dbo.USERS
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.EMPLOYERS (employer_id)
    SELECT UserId
    FROM inserted
    WHERE role = 'Employer'
    AND NOT EXISTS (
        SELECT 1 FROM dbo.EMPLOYERS 
        WHERE employer_id = inserted.UserId
    );
END;
GO

-- TRIGGER 4: Validate Job Expiry Date is After Posted Date
CREATE TRIGGER trg_validate_job_dates
ON dbo.JOBS
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1 FROM inserted
        WHERE expiry_date < posted_date
    )
    BEGIN
        RAISERROR ('Job expiry date must be after posted date.', 16, 1);
        ROLLBACK;
    END
END;
GO

-- TRIGGER 5: Prevent Duplicate Skill Assignments for Same Job Seeker
CREATE TRIGGER trg_prevent_duplicate_seeker_skills
ON dbo.USER_SKILLS
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1 FROM inserted i
        WHERE EXISTS (
            SELECT 1 FROM dbo.USER_SKILLS us
            WHERE us.seeker_id = i.seeker_id
            AND us.SkillID = i.SkillID
            AND us.JobSeekerSkillID <> i.JobSeekerSkillID
        )
    )
    BEGIN
        RAISERROR ('Job seeker already has this skill assigned.', 16, 1);
        ROLLBACK;
    END
END;
GO