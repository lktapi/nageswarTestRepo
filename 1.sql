

DROP FUNCTION IF EXISTS create_gitlab_policy_violation_template();
CREATE OR REPLACE FUNCTION create_gitlab_policy_violation_template()
RETURNS integer AS $BODY$
DECLARE
-- variables for creating templates
newTemplateId integer;
templateName varchar;
formatTypeId integer;
templateTypeId integer;
templateFormat smallint;
isConfigurable char;
templateSubject varchar;
templateText text;
templateCategoryId integer;
plainFormat smallint;
-- template format variables
gitlabFormat integer;
BEGIN
RAISE NOTICE 'Started Policy Violation Template Creation';
gitlabFormat = 14;
plainFormat = 1;
-- Start Policy Violation Templates
templateName='Gitlab Policy Violation Template';
templateSubject='Security violation detected in merge Request';
templateTypeId = 116;
templateCategoryId=25003;
formatTypeId=gitlabFormat;
templateFormat=plainFormat;
isConfigurable='T';
templateText= 'The ${EventType} created by you contains content causing violation of IT policy ${PolicyName}. 
This issue is created and assigned to ${userEmail}.
';
select retTemplateId from dselsa01.tmp_not_create_default_template(templateName,formatTypeId,templateTypeId,templateFormat,isConfigurable,templateSubject,templateText,templateCategoryId) into newTemplateId;
update dselsa01.obs_notification_templates set template_text=templateText, created_user = 'system', updated_user = 'system' where id = newTemplateId;
-- END Policy Violation Templates
RAISE NOTICE 'Successfully Created Gitlab Policy Violation Templates';
RETURN 1;
END;
$BODY$ LANGUAGE plpgsql;
select create_gitlab_policy_violation_template();
-- DROPING The FUNCTION as task is completed
DROP FUNCTION IF EXISTS create_gitlab_policy_violation_template();
commit;