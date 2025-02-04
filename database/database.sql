-- 1. Create database 'next_level' in your database manager.
-- 2. Copy, paste, and execute the below code into a new SQL query. 
-- 3. Register a user before executing the final query (Line 383).

-- Dummy data provided for all tables except "user" and "user_client"
--! Database name: "next_level"

CREATE TABLE "user" (
	"id" SERIAL PRIMARY KEY,
	"username" VARCHAR UNIQUE NOT NULL,
	"password" VARCHAR NOT NULL,
	"name" VARCHAR
);

CREATE TABLE "client" (
	"id" SERIAL PRIMARY KEY, 
	"company_name" VARCHAR,
	"contact_name" VARCHAR,
	"contact_email" VARCHAR
);

INSERT INTO "client" 
	("company_name", "contact_name", "contact_email")
VALUES 
	('Target', 'Brian Cornell', 'bc@gmail.com'),
	('3M', 'Mike Roman', 'mr@gmail.com'),
	('Best Buy', 'Corie Barry', 'cb@gmail.com'),
	('General Mills', 'Jeff Harmening', 'jh@gmail.com'),
	('Optum', 'Wyatt Decker', 'wd@gmail.com'),
	('Prime Digital Academy', 'Matt Black', 'matt@prime.com'),
	('Boise Paper Company', 'Greg', 'greg@gmail.com');

CREATE TABLE "client_assessments" (
	"id" SERIAL PRIMARY KEY,
	"client_id" INTEGER REFERENCES "client" ON DELETE CASCADE,
	"engagement_date" DATE,
	"status" VARCHAR,
	"next_steps" VARCHAR,
	"future_state" VARCHAR
);

INSERT INTO "client_assessments" 
	("client_id", "engagement_date", "status", "next_steps", "future_state")
VALUES 
	(1, '03-07-2023', 'Edit in Progress', null, null),
	(2, '03-08-2023', 'Active', null, null),
	(3, '03-09-2023', 'Archived', null, null),
	(4, '03-10-2023', 'Not Yet Started', null, null),
	(5, '03-11-2023', 'Edit in Progress', null, null),
	(6, '03-21-2023', 'Active', 'Careful steppin`!', 'Onwards and upwards!'),
	(7, '03-21-2023', 'Not Yet Started', null, null);

CREATE TABLE "buckets" (
	"id" SERIAL PRIMARY KEY,
	"bucket_index" INTEGER,
	"name" VARCHAR
);

INSERT INTO "buckets" 
	("bucket_index", "name")
VALUES
	(1, 'Organizational Effectiveness'),
	(2, 'Employee Engagement'),
	(3, 'Training & Development'),
	(4, 'Benefits & Compensation'),
	(5, 'Recruiting & Staffing'),
	(6, 'HRIS, Payroll & Compliance');

CREATE TABLE "functions" (
	"id" SERIAL PRIMARY KEY,
	"bucket_id" INTEGER REFERENCES "buckets",
	"function_index" INTEGER,
	"name" VARCHAR
);

INSERT INTO "functions" 
	("bucket_id", "function_index", "name")
VALUES
	(1, 1, 'Mission, Vision, Values'),
	(1, 2, 'Business Goals and Org Alignment'),
	(1, 3, 'Workflow, Procedures, Structures & Systems'),
	(1, 4, 'Succession Planning'),
	(2, 1, 'Employee Communication'),
	(2, 2, 'Measurement'),
	(2, 3, 'Problem Resolution'),
	(2, 4, 'Retention Planning & Analysis'),
	(2, 5, 'Recognition'),
	(2, 6, 'Charitable Giving'),
	(2, 7, 'Health & Wellness'),
	(2, 8, 'Diversity, Equity & Inclusion'),
	(3, 1, 'Company-Wide Compliance'),
	(3, 2, 'Employee Resources'),
	(3, 3, 'New Hire Orientation & Onboarding'),
	(3, 4, 'Training & Tools'),
	(3, 5, 'Assessment, Tracking, Measurement'),
	(4, 1, 'Compensation Plan/Philosophy'),
	(4, 2, 'Benefits Strategy'),
	(4, 3, 'Enrollment'),
	(4, 4, 'Employee Education'),
	(4, 5, 'Administer Benefit & Comp Plans'),
	(4, 6, 'Compliance'),
	(5, 1, 'Team Rationalization & Synergies'),
	(5, 2, 'Selection Process Design'),
	(5, 3, 'Staffing Execution/Admin'),
	(6, 1, 'Federal, State & Local Requirements'),
	(6, 2, 'Employee Handbook'),
	(6, 3, 'Employee Data'),
	(6, 4, 'Unemployment'),
	(6, 5, 'HR Legal & Risk Management'),
	(6, 6, 'Payroll'),
	(6, 7, 'Ethics/Corp Governance'),
	(6, 8, 'Safety & Workers Compensation'),
	(6, 9, 'Labor Relations'),
	(6, 10, 'Safety Policies');

CREATE TABLE "subfunctions" (
	"id" SERIAL PRIMARY KEY,
	"bucket_name" VARCHAR,
	"function_id" INTEGER REFERENCES "functions",
	"function_name" VARCHAR,
	"subfunction_index" INTEGER,
	"name" VARCHAR,
	"level_criteria_strong" VARCHAR,
	"level_criteria_adequate" VARCHAR,
	"level_criteria_weak" VARCHAR
);

INSERT INTO "subfunctions" 
	("subfunction_index","bucket_name","function_name","name", "level_criteria_strong", "level_criteria_adequate", "level_criteria_weak")
VALUES
	(1,'Organizational Effectiveness','Mission, Vision, Values','Mission, Vision, Values','Strong - Well known by all, easily accessible. Incorporated in communications throughout company on a regular basis. Drive daily work and performance.','Adequate - Mission, vision, values have been identified, but are referenced infrequently. Not well-known by all employees and difficult to find.','Weakness - Company has not fully identified mission, vision, values.'), 
	(2,'Organizational Effectiveness','Mission, Vision, Values','Culture/Values strategy & plans','Strong - Mission, vision, values have been identified for the organization and widely communicated to employees and external stakeholders. Values are incorporated into performance evaluations and used throughout the organization to recognize employee success.','Adequate - Some work has been done to identify the mission and vision. Values are not fully identified. Low level of communication to employees around these pieces.','Weakness - No work has been done to identify mission, vision, values.'), 
	(1,'Organizational Effectiveness','Business Goals and Org Alignment','Business Goals','Strong - Key business goals identified and communicated consistently to employees. Company is tightly aligned around what is most important right now. All employees are clear on chain of command and know where to look for additional guidance.','Adequate - Company aware of what is most important right now, but plans for how to attain need additional definition. Chain of command is clear, documented and easy to reference, but needs to be more widely communicated across the organization.','Weakness - Company has not clearly defined the one thing that is most important right now. Chain of command is unclear and not documented clearly.'),
	(2,'Organizational Effectiveness','Business Goals and Org Alignment','Organization Chart and Structure Design','Strong - Organization chart exists, is current, and has been approved by the leadership team. The chart is easily accessed by all employees.','Adequate - A high level chart exists but it is only for executive eyes. It does not include all positions in the organization and is not available to employees.','Weakness - No org chart exists.'), 
	(1,'Organizational Effectiveness','Workflow, Procedures, Structures & Systems','Team Structure','Strong - Company has clearly defined method that is widely communicated. Resources are easily accessible and readily documented.','Adequate - Company has identified method (formal or informal), but has not articulated to all staff. Few workflows, procedures, etc. are documented and accessible.','Weakness - Company does not use a consistent method (formal or informal) for workflow, procedures, structures & systems. Staff is confused; expectations unclear.'), 
	(2,'Organizational Effectiveness','Workflow, Procedures, Structures & Systems','Cross-function/work process design','Strong - Consistent format and methodology for documenting work processes across the organization. All departments have fully documented processes, they have been cross-referenced with other departments, verified, and shared in an easy to access location for quick reference.','Adequate - Some processes in the organization have been documented and are stored in a shared location for easy access.','Weakness - No company processes have been documented.'), 
	(3,'Organizational Effectiveness','Workflow, Procedures, Structures & Systems','Role Definition & Role Clarity','Strong - Job descriptions have been bumped up against the org chart and documented workflow processes to ensure roles do not overlap unnecessarily. Clear delineations have been made through the job description of where one role ends and another begins. Employees know where they can find clarifying documents if needed.','Adequate - Some job descriptions have been examined to ensure alignment with the org chart and documented workflow process, but not all. Communication to employees regarding delineation of duties is available or has been distributed, but some employees remain unclear.','Weakness - Job descriptions have not been checked against the org chart or workflow processes. Employee express concern and confusion around role clarity and definition.'), 
	(4,'Organizational Effectiveness','Workflow, Procedures, Structures & Systems','Systems to support workflow, procedures and structure','Strong - A centralized platform (ex: intranet, HRIS) exists where workflows and procedures are documented, with a clearly organized and searchable structure.','Adequate - Workflows and procedures are documented but not kept in a readily accessible location for employees to reference.','Weakness - Workflows and procedures are not documented.'), 
	(1,'Organizational Effectiveness','Succession Planning','Succession Planning','Strong - Company has multi-layer succession plan that is revisited annually and all senior leaders are aware.','Adequate - Company has succession plan, but it has not been revisited regularly and only goes one layer deep in the organization.','Weakness - Company does not have succession plan.'),
	(1,'Employee Engagement','Employee Communication','Visible resource for employees and managers','Strong - Company has identified a clear structure for communications. Employees know what to expect, when, where, and from whom.','Adequate - Company communicates often through various avenues. Employees are not sure where it will come from or when. Communications are informal, no structure in place.','Weakness - Company does not have clear communication structure in place. Company does not communicate with employees regularly. Employees are unsure when they will receive information or how it will be given to them.'), 
	(2,'Employee Engagement','Employee Communication','Employee involvement plans','Strong - Company has provided employees with the opportunity to join a planning committee (ex: company activities, process improvement, cross-departmental collaboration, charitable giving, etc.) as a way to be involved in the organization in a meaningful and contributing way above and beyond their day to day job duties.','Adequate - Company occasionally asks employees to volunteer to complete tasks or will coordinate an outing, gathering, or volunteer opportunity. Company may appoint employees to a committee.','Weakness - Company does not have opportunities for employees to be involved outside of day to day work duties.'), 
	(1,'Employee Engagement','Measurement','Employee opinion survey & action planning','Strong - Company conducts regularly scheduled engagement surveys. Questions are the same each time. Analysis is done each time and action items are identified. Results are shared with employees. Cross-functional teams work on action items and report back to employees.','Adequate - Company measures employee engagement, but it is not done regularly. Process differs each time which does not allow for consistent measurement. Results are not shared with employees. Some action items are identified from survey, but a thorough process for doing so is not in place.','Weakness - Company does not measure employee engagement.'), 
	(1,'Employee Engagement','Problem Resolution','Coaching employees','Strong - Company has a defined plan for problem resolution and follows it consistently. All supervisors have received training and have the skills necessary to resolve problems and handle difficult termination situations.','Adequate - Company has a defined plan for problem resolution, but it is not always followed. Not all supervisors have the skills needed to successfully resolve employee problems.','Weakness - Company does not have a clearly defined plan for problem resolution.'), 
	(1,'Employee Engagement','Retention Planning & Analysis','Employee relations','Strong - Company measures turnover and has established a retention goal. Stay interviews are used and reported on regularly to members of leadership. Efforts are undertaken to capitalize on stay reasons.','Adequate - Company measures turnover, but has not identified a retention goal. Uses exit interviews occasionally. No mechanism for recording trends in exit interviews.','Weakness - Company does not measure turnover or have formal plan in place to retain employees.'), 
	(2,'Employee Engagement','Retention Planning & Analysis','Employee household relations','Strong - Company has intentional practice of engaging the employee household through regular mailings, company merchandise, family gatherings, flu shots and wellness for family, activities for children, recognition of holidays and special life events.','Adequate - Company does send some items to the employee’s household (i.e.: cards), but they have minimal impact on the family.','Weakness - Company does not have intentional practice of engaging the employee’s household.'), 
	(1,'Employee Engagement','Recognition','Reward/recognition plan','Strong - Company has formal recognition program in place that is aligned and designed to drive demonstration of company values in employee behavior. Recognition is multi-layered (i.e.: in-person, written, in-public), is consistent in practice, and employees know what they need to do to receive it.','Adequate - Company recognizes employees informally, but does not leverage recognition through formal program, consistency, or formality.','Weakness - Company does not have formal recognition program in place.'), 
	(1,'Employee Engagement','Charitable Giving','Charitable Giving','Strong - Company has formal giving program in place with various components (i.e.: time off for volunteering, payroll deductions, donation matching, % of profit giving, partnerships with local organizations, giving committee). Program is leveraged for maximum exposure internally and externally.','Adequate - Company does give to charitable organizations from time to time, but employees may not know about it. Giving is not formalized or leveraged for employee morale, engagement, recruitment, or marketing purposes.','Weakness - Company does not have formal charitable giving plan in place.'), 
	(1,'Employee Engagement','Health & Wellness','Health & Wellness','Strong - Company has formal wellness program in place with resources for employees such as: gym membership reduction or reimbursement; regular communications with wellness tips; ergonomic information; regular wellness activities; flu shots; blood drive. Company works with benefits broker to gain insight into high utilization patterns of health plans in order to do targeted education with aim to reduce health premiums costs.','Adequate - Company does encourage wellness, but it is general in nature with no resources in place to support. No consideration of employee health as it relates to reduction of insurance costs.','Weakness - Company does not have formal health & wellness program in place.'), 
	(2,'Employee Engagement','Health & Wellness','Wellness initiatives','Strong - Wellness initiatives are robust, implemented, happen on a regular frequency, widely communicated to employees and measured to determine effectiveness.','Adequate - A few wellness activities happen during the year (ex: blood drive, flu shots).','Weakness - Company does not offer wellness activities or opportunities.'), 
	(1,'Employee Engagement','Diversity, Equity & Inclusion','Diversity, Equity & Inclusion','Strong - Company has documented DE&I  statement and plan is widely communicated to employees and external stakeholders. The DE&I commitment is  incorporated into key organizational processes and there is active involvement in this work thought the business.','Adequate - Some work has been done to identify the DE&I commitments. the DE&I strategy and associated processes are not fully identified. Low level of communication to employees around this work.',E'Weakness - No work has been done to identify the organization\'s approach to DE&I work.'), 
	(1,'Training & Development','Company-Wide Compliance','Company-Wide Compliance','Strong - Company is thorough and fully compliant with mandatory trainings. Attendance is well-documented and can be quickly reported.','Adequate - Some compliance training is in place, but not all. Ability to quickly pull data on attendance needs improvement.','Weakness - Compliance training is not in place.'), 
	(1,'Training & Development','Employee Resources','Senior Management Meeting','Strong - Company has a regular cadence and agenda for senior management meetings. Meetings are productive, informed by company values, and all agree on what is most important for the organization driving work through this lens.','Adequate - Regular senior management meetings are held but they are done so out of course of habit. They are reporting style meetings instead of opportunities for true engagement and progress as a team. Some members of the team feel they are a waste of time.','Weakness - No regular senior management meetings are held.'), 
	(2,'Training & Development','Employee Resources','Employee Meeting',E'Strong - Company has regularly scheduled all employee meetings whether it\'s in person, via video, etc. Employees know to expect these meetings on a regular cadence and know they will learn about the financial state of the company, major initiatives, and where the focus lies for the next period of time. They know employees will be recognized during these meetings for exhibiting behaviors that demonstrate the company\'s values.','Adequate - Company has all employee meetings but they are irregular and done on the fly. The content and message varies one to the next and employees do not feel it is important to attend.','Weakness - Company does not hold all employee meetings.'), 
	(3,'Training & Development','Employee Resources','Performance Improvement',E'Strong - Company has identified policy related to poor performance whether it\'s progressive discipline or something similar and it is clearly communicated in the employee handbook. Sample PIPs are available to managers and HR is working hand in hand with managers to ensure PIPs are documenting the concerns appropriately and setting achievable expectations and timelines.','Adequate - Company has a discipline policy but does not follow it consistently. Issues are handled in varying ways, some with written documentation and some without. Managers frequently discipline employees without HR knowledge or collaboration.','Weakness - Company does not have discipline policy. Issues are handled in a wide variety of ways and inconsistency creates risk for the organization and frustration for employees.'), 
	(1,'Training & Development','New Hire Orientation & Onboarding','New Hire Orientation & Onboarding','Strong - Company has thorough new hire onboarding with repeatable practices and measured success.','Adequate - Company has minimal, informal, and inconsistent orientation for new hires.','Weakness - Company does not have new hire orientation.'), 
	(1,'Training & Development','Training & Tools','Individual Centered Development','Strong - Company has written ICD information that is easy for employees to find and take full advantage of. High level of employee participation.','Adequate - Company has some ICD opportunities, but there is not a consistent practice and it is unclear to employees where to find information. Very little employee participation.','Weakness - Company does not offer individual centered development opportunities.'), 
	(2,'Training & Development','Training & Tools','OTJ Training','Strong - Company has consistent method for OTJ training. Well established buddy system and measured success.','Adequate - Company has informal OTJ training. No written documents. Inconsistent practice.','Weakness - Company has no OTJ training.'), 
	(3,'Training & Development','Training & Tools','Supervisory Training','Strong - Company requires supervisory training prior to employee management. Robust requirement of all 3 levels and progress assessment at regular intervals.','Adequate - Company makes or has supervisory training available, but it is not required.','Weakness - Company has no supervisory training.'), 
	(4,'Training & Development','Training & Tools','Leadership Development','Strong - Company has a training plan to ensure that identified leaders - and/or up and coming leaders - in the organization receive ongoing skill development. The curriculum is clearly outlined and communicated to participants. A mechanism for measuring outcomes is in place and results are reported back to executive team.','Adequate - Company provides training for identified leaders as requested. There is a not a formal or consistent methodology in place. No measurement of outcomes.','Weakness - Company does not provide leadership development.'), 
	(5,'Training & Development','Training & Tools','Career Pathing','Strong - Company has well-documented and communicated career path for all levels of employees.','Adequate - Company has informal career path for employees. Not broadly communicated. Unclear criteria.','Weakness - Company has no defined career path for employees.'), 
	(6,'Training & Development','Training & Tools','Business/Industry learnings','Strong - Company has a means by which to assess candidate or employee knowledge of business concepts and industry savvy.','Adequate - Company conducts informal verbal evaluation of skills.','Weakness - Company does not conduct evaluation of skills or knowledge.'), 
	(7,'Training & Development','Training & Tools','Effectiveness & basic skills','Strong - Company has a means by which to assess candidate or employee effectiveness and basic work skills.','Adequate - Company conducts informal verbal evaluation of skills.','Weakness - Company does not conduct evaluation of skills or knowledge.'), 
	(1,'Training & Development','Assessment, Tracking, Measurement','Performance review process','Strong - Has robust, regularly scheduled, widely communicated process for conducting employee reviews. Company has given great thought to the content and method used for reviews and whether or not performance is tied to compensation or lives apart.','Adequate - Employee reviews are done occasionally and inconsistently. Often they are done only if an employee requests it to be done. Management and employees are unclear if compensation is tied to employee performance reviews. There is great inconsistency in the practices of the organization.','Weakness - Company does not have process for doing employee reviews or simply just does not do them.'), 
	(2,'Training & Development','Assessment, Tracking, Measurement','Talent review tools','Strong - Company completes both Stack Rank, Nine Box exercises annually and uses it to inform staffing, training and development decisions.','Adequate - Company has completed one of the exercises (Stack Rank, Nine Box) but has not used it to inform staffing or training and development decisions.','Weakness - Company has not completed a nine box or stack rank exercise.'), 
	(3,'Training & Development','Assessment, Tracking, Measurement','Knowledge management','Strong - Company has a method for tracking the knowledge and skills of employees in the organization. All employees are able to easily reference this information drawing on the strengths of individuals on behalf of clients/customers or to serve as mentors and trainers.','Adequate - Company has some documentation of employee skills and abilities but it is not in a consolidated format easily referenced and is not available to all.','Weakness - Company does not track employees skills and abilities.'), 
	(1,'Benefits & Compensation','Compensation Plan/Philosophy','Pay strategy Compensation Plan','Strong - Company has a compensation plan document that aligns tightly with actual practice. It is referenced and adjusted regularly (as needed) and individuals involved in compensation decisions know where to find it.','Adequate - Company has a compensation plan document, but it does not get reviewed regularly. Document is not followed consistently.','Weakness - Company does not have a compensation plan.'), 
	(2,'Benefits & Compensation','Compensation Plan/Philosophy','Compensation Philosophy','Strong - Company has a compensation philosophy document that aligns tightly with actual practice. It is referenced and adjusted regularly (as needed) and individuals involved in compensation decisions know where to find it.','Adequate - Company has compensation philosophy, but it is not used to guide compensation decisions. Does not get reviewed regularly.','Weakness - Company does not have formal compensation philosophy.'), 
	(3,'Benefits & Compensation','Compensation Plan/Philosophy','Salary Range, Market Data & Comp Studies','Strong - Company has fully developed compensation ranges for all position that are informed by market data and compensation studies.','Adequate - Company has ranges for some positions but not all. They were developed some time ago and not informed by objective data.','Weakness - Company does not have compensation ranges and has not conducted a market analysis of compensation.'), 
	(4,'Benefits & Compensation','Compensation Plan/Philosophy','Variable pay plans','Strong - Company has variable pay plans in place and they are fully integrated with compensation philosophy & plan. Pay drives company values, is handled consistently, is well funded. Well documented. Employees are well educated on plans.','Adequate - Company has variable pay plans, but they are not integrated with compensation philosophy or compensation plan. Applied in ad hoc fashion. Not tied to company values.','Weakness - Company does not have variable pay plans.'), 
	(5,'Benefits & Compensation','Compensation Plan/Philosophy','Job Descriptions','Strong -  Company has job descriptions for all employees. Job descriptions are updated on a regular basis. They follow the same, best practice format. Employees have received a copy of their job description, signed it, and a copy is in the employee file.','Adequate - Company has some job descriptions. They are inconsistent in structure. Employees do not know where to find job descriptions.','Weakness - Company does not have job descriptions.'), 
	(6,'Benefits & Compensation','Compensation Plan/Philosophy','Executive/Board compensation','Strong - Company has well-informed (through research and expert comp advise) executive and board compensation plan. The plan is reviewed regularly - at least every two years and updated against market data.','Adequate - Company has broad or vague framework for executive and board comp based mostly on past practices. Has not been reviewed recently against market data; no input from outside expert.','Weakness - Company does not have a written practice or methodology for exec and board comp. Decisions are made by one or two individuals in the org on an ad hoc basis using subjective criteria.'), 
	(7,'Benefits & Compensation','Compensation Plan/Philosophy','Evaluation Systems','Strong - Company has robust evaluation system in place which is tied to company values. Cadence is on a regular basis and all employees know what to expect.','Adequate - Company has an evaluation system, but it is not tied to company values. Employees are not clear on system or process. Evaluations are not done in a timely manner.','Weakness - Company does not have a formal evaluation system.'), 
	(8,'Benefits & Compensation','Compensation Plan/Philosophy','Employee Agreements','Strong - Company uses Employee Agreements that have been reviewed by an attorney. EAs are used for all positions in the company, signed by incoming employee, and kept in the employee file.','Adequate - Company only uses EAs for some positions in the company, inconsistent use. EAs have not been attorney reviewed. Sometimes they are signed by employee, sometimes they are kept in the employee file.','Weakness - Company does not use EAs.'), 
	(9,'Benefits & Compensation','Compensation Plan/Philosophy','Retention Agreements','Strong - Company has a retention agreement template that can be used when needed that has been attorney reviewed. All retention arrangements are documented through this agreement, signed by all relevant parties, and kept in the employee file.','Adequate - Company occasionally uses a retention agreement that is outdated or not attorney reviewed.','Weakness - Company does not use retention agreements to document retention arrangements with employees.'), 
	(1,'Benefits & Compensation','Benefits Strategy','Benefits plan/Strategy and support','Strong - Company has strong brokerage relationship. Proactive and on-going review of benefits structure & cost is well documented.','Adequate - Company brings plans to market annually and closely reviews each year. Has broker relationship in place. Broker is reactive and not fully utilized.','Weakness - Company does not take plans to market annually.'), 
	(2,'Benefits & Compensation','Benefits Strategy','Benefits Offerings','Strong - Company offers above average benefits package and leverages for recruiting & retention.','Adequate - Company offers average benefits package. Potential for additional offerings that would enhance recruiting and retention.','Weakness - Company offers few benefits.'), 
	(1,'Benefits & Compensation','Enrollment','Unify broker and benefits','Strong - Company has good broker relations and  has a dedicated staff for benefits changes with back-up in place. Process in place for ensuring withholding accuracy. Easy reporting available. Process is documented.','Adequate - Company has dedicated staff for benefits changes. Minimal controls in place to ensure accuracy in payroll. Processes not documented.','Weakness - Company does not have dedicated staff for benefits changes. No process in place for ensuring accuracy of changes in payroll.'), 
	(1,'Benefits & Compensation','Employee Education','Employee Education','Strong - Company has regularly scheduled employee meetings related to benefits. Employees understand benefits offerings and know where to find additional information.','Adequate - Company provides employees with benefits related education upon hire, but not after. Benefits information is difficult for employees to find.','Weakness - Company does not provide employees with education regarding benefits.'), 
	(1,'Benefits & Compensation','Administer Benefit & Comp Plans','Administer Benefit & Comp Plans','Strong - Company has dedicated staff to oversee benefits administration and compensation plan oversight. Company has HRIS that allows for full electronic capture of benefits and comp data allowing for easy reporting.','Adequate - Company has varied staff that handles pieces of benefits and comp with no clear leader. Data for reporting is pulled from multiple systems and pieced together in Excel.','Weakness - Company relies solely on benefits broker or outside adviser to administer benefits comp. Data is not kept within the org.'), 
	(1,'Benefits & Compensation','Compliance','Benefits Compliance','Strong - An annual calendar of benefits compliance requirements is kept and monitored by a designated point person. This person serves as project manager ensuring all benefits compliance is in order, timely, and recorded for posterity.','Adequate - Benefits compliance is only dealt with as alerts are brought to the company such as emails from a broker to take care of a specific action or distribute a particular notice. The approach is reactive vs. proactive.','Weakness - Company does not have a sense for what is required in order to be in compliance as it relates to benefits.'), 
	(2,'Benefits & Compensation','Compliance','LOA','Strong - Company has clearly defined LOA & FMLA policies & procedures that are documented. Dedicated staff person in place with back-up. Reporting is done easily. Employees know where to find leave information.','Adequate - Company has dedicated staff person for tracking. Not a consistent process for distributing information upon request of leave. No documented process for LOA & FMLA.','Weakness - Company does not have a dedicated staff person for LOA & FMLA tracking.'), 
	(3,'Benefits & Compensation','Compliance','FLSA','Strong - Company has done a thorough FLSA audit and is in full compliance.','Adequate - Company has conducted an FLSA audit, but has not made changes as a result. Job descriptions have not been audited in relationship to FLSA.','Weakness - Company has not conducted an FLSA audit.'), 
	(4,'Benefits & Compensation','Compliance','Work Comp','Strong - Company carries work comp insurance. Leverages carrier for employee education. Employees are clear on where to find information about work comp and know how to report an injury. Regular training on reporting injuries. Reporting readily available.','Adequate - Company carries work comp insurance but does not have a close relationship with the carrier. Does minimal employee education (ex: posters are hanging up). Relies on employees to figure out what to do if they are injured.','Weakness - Company does not carry work comp insurance.'), 
	(1,'Recruiting & Staffing','Team Rationalization & Synergies','Timing and Approval','Strong - Company has fully integrated staffing forecast in the budget and tightly aligned process for approving positions and staying on pace.','Adequate - Company has staffing forecast, but no process for staying on-track with timing or budget. Approvals are ad hoc.','Weakness - Company does not have a formal process for determining timing and approval of positions. No formal staffing forecast.'), 
	(1,'Recruiting & Staffing','Selection Process Design','Sourcing','Strong - Company has well-established and documented sourcing strategy. Ensures diversity. System for tracking is robust and capable of regular reporting on timeliness of hires.','Adequate - Company has dedicated recruiting resource. Consistent practice, but not documented. System in place for tracking, but limited reporting capabilities. No strategy for ensuring diversity of candidates.','Weakness - Company does not have sourcing strategy. Lack of consistent practice. No dedicated resource. No tracking ability.'), 
	(2,'Recruiting & Staffing','Selection Process Design','Screening','Strong - Company has well documented and communicated screening process. Candidates and managers are clear on process and expectations.','Adequate - Company has somewhat consistent practice for screening. Practice is not documented. Hiring managers not clear on expectations. No training for managers on how to interview.','Weakness - Company does not have a consistent practice for screening candidates.'), 
	(3,'Recruiting & Staffing','Selection Process Design','Culture','Strong - Company has identified values and they are woven into the daily work of the business. Values are stated on website and spoken about during all stages of the recruiting process. Used to inform hiring decisions.','Adequate - Company has identified values, but does not leverage for recruiting.','Weakness - Company has not identified values for the organization.'), 
	(1,'Recruiting & Staffing','Staffing Execution/Admin','Background Checks','Strong - Company completes robust background check and reference check process which is well documented. Criminal check is repeated annually.','Adequate - Company completes only some parts of a full background check. Only does so upon hire.','Weakness - Company does not complete background or reference checks.'), 
	(2,'Recruiting & Staffing','Staffing Execution/Admin','Offers','Strong - Company has consistent and well documented process & practice for making candidate offers. Full legal compliance. Clean chain of command for hiring decisions.','Adequate - Company has legal approved templates. Offer amounts do not follow structured guidelines. Inconsistent practice re: who is providing offer to candidate and making final hiring decision.','Weakness - Company uses inconsistent offer letter templates that have not been reviewed by legal counsel.'), 
	(3,'Recruiting & Staffing','Staffing Execution/Admin','Benefits Enrollment','Strong - Company has well executed enrollment process which is documented, repeatable, and staff member has back-up for absences. On-line process with easy reporting.','Adequate - Company has dedicated staff for enrollments. Process is handled consistently, but not documented. No back-up is in place for staff. Manual process; no mechanism for easy reporting.','Weakness - Company does not have dedicated staff person handle enrollments. Process is ad hoc and undocumented.'), 
	(4,'Recruiting & Staffing','Staffing Execution/Admin','Executive recruiting process','Strong - Company has well-established and documented sourcing strategy for executive roles. Ensures diversity. System for tracking is robust and capable of regular reporting on timeliness of hires.','Adequate - Company pays closer attention to executive roles, treating candidates as VIPs, but does not have a unique strategy for sourcing exec candidates.','Weakness - Company does not handle exec recruiting any differently than all other recruiting.'), 
	(1,'HRIS, Payroll & Compliance','Federal, State & Local Requirements','EEO and Affirmative Action','Strong - Company knows they need to comply with one or both and is fully in compliance.','Adequate - Company knows they need to comply with one or both, but is not currently in compliance.','Weakness - Company is unaware of or unsure whether or not they are required to file an EEO-1 or be an Affirmative Action Employer.'), 
	(2,'HRIS, Payroll & Compliance','Federal, State & Local Requirements','Other Requirements','Strong - Company is well-versed in federal, state, and local payroll obligations and overall compliance items. Company has and follows a compliance calendar. Processes and procedures are in place to ensure compliance. On-going reviews are done pro-actively. Trusted and reliable sources are in place that the company can turn to for information about changes.  Industry specific compliance is addressed.','Adequate - Company is aware of and compliant with most federal, state, and local payroll requirements and general compliance items.','Weakness - Company is not aware of and/or non-compliant with federal, state, and local payroll and general compliance items.'), 
	(1,'HRIS, Payroll & Compliance','Safety Policies','Safety Policies','Strong - Company has appropriate safety policies including Intruder, Security, Web, etc.  Employees are given the policy documentation and trainings are held.','Adequate - Some policies exist but a review and update of policy language is needed.','Weakness - Safety policies do not exist or are outdated.'), 
	(2,'HRIS, Payroll & Compliance','Safety Policies','Pandemic Plans','Strong - Pandemic plans exists and are updated as needed with current scientific recommendations.','Adequate - Pandemic plans are sufficient for current needs.','Weakness - Lack of pandemic plans.'), 
	(1,'HRIS, Payroll & Compliance','Employee Handbook','Employee Handbook','Strong - Company has well written and thorough employee handbook that has been reviewed by an employment attorney.','Adequate - Company has employee handbook, but it is not thorough or up-to-date and needs to be revisited.','Weakness - Company does not have employee handbook.'), 
	(1,'HRIS, Payroll & Compliance','Employee Data','Audit HR and payroll files for compliance','Strong - Company has files organized in a compliant manner.  This includes I9s and payroll files.  The files are regularly audited for compliance.','Adequate - Company keeps files in compliant manner, but more organization would allow documents to be found quickly. Hard copy file structure and electronic file structure do not match.','Weakness - Company does not have files organized in a compliant manner.'), 
	(2,'HRIS, Payroll & Compliance','Employee Data','HRIS','Strong - Company has HRIS system that is highly effective for the needs of the organization. System can scale to meet growth demands. Strong relationship with vendor(s) with robust support. Confidence in reporting tools and staff are cross-trained to provide back-up for each task in the case of absence.','Adequate - Company does not have HRIS system in place, but has set up tools and processes that work effectively. May be opportunity for time savings if HRIS is implemented.','Weakness - Company does not have HRIS system in place. Has not been able to successfully set up manual tools and processes to fulfill needs.'), 
	(1,'HRIS, Payroll & Compliance','Unemployment','Unemployment claims and process','Strong - Company has dedicated staff monitoring unemployment claims and disputing them if appropriate. Company has clear sight line to unemployment costs and has strategy for minimizing the cost to the company.','Adequate - Company does not have a person within the org dedicated to the oversight of unemployment claims. Awareness of claims is minimal, only drawing attention if an individual is fired and then an unemployment request comes through.','Weakness - No visibility or attention paid to unemployment claims.'), 
	(1,'HRIS, Payroll & Compliance','HR Legal & Risk Management','Employment Law Compliance & Training','Strong - Company has ethics statement and policy in place. It is reviewed annually and employees receive training on it annually. A strong employment attorney relationship is present. Company receives regular legal updates to ensure pro-active adjustment to handbook, policies, and practices.','Adequate - Company has ethics statement and policy in place, but does not revisit it regularly or require employee training annually. Company has employment attorney to call, but not a strong relationship.','Weakness - Company does not have ethics statement and policy in place (sometimes called Ethics Code). Company knows of an employment attorney, but does not have a strong relationship in place.'), 
	(2,'HRIS, Payroll & Compliance','HR Legal & Risk Management','Retention planning & analysis','Strong - Company has clear visibility to top performers in the organization and a plan for retaining key staff. Key roles have been cross-trained to retain knowledge within the organization should a key individual leave. Methods are in place to regularly assess the engagement of key personnel and there is a system for assessing the reasons key staff choose to leave the organization. From learnings, Company continually evolves retention strategy.','Adequate - Company does exit interviews, reads them, mulls over them, speculates on what might result in better retention, but plans are not put in place or actualized to minimize additional loss of staff.','Weakness - No clear retention plan is identified or in place.'), 
	(1,'HRIS, Payroll & Compliance','Payroll','Payroll and benefits administration','Strong - Full integration of HR & payroll departments, source of truth identified.  Delineation of duties documented and workflows.  Approval of all entries. Payroll and HR are in lock-step with one another and communication is frequent and open. Tasks are clearly defined and workflow processes are documented and followed.','Adequate - Payroll and HR interact regularly but often duplicate efforts or action items are dropped due to miscommunication about ownership. Forms related to employee changes exist but are not comprehensive and are not used consistently. Some processes and workflow are documented, but are not kept up to date.','Weakness - Payroll and HR do not interact regularly. Delineation between payroll and HR duties is unclear. Processes and workflow are not documented.'), 
	(2,'HRIS, Payroll & Compliance','Payroll','Termination process, severance practices','Strong - HR and payroll are tightly aligned on the process for terminations, timing and final pay to employees. The rhythm for severance payments is consistent and payroll staff understands who will provide them with the necessary information to ensure accuracy of payments.',E'Adequate - Terminations usually follow the same pattern but surprises happen and in these instances communication falls apart. Payroll isn\'t sure who will provide them with the necessary information or when. Payroll needs to ask many questions to ensure final pay and/or severance are handling correctly.',E'Weakness - Each termination feels different. Payroll isn\'t sure who will provide them with the necessary information or when. For payroll it often comes as a surprise that someone needs a same day check and has been terminated. Payroll needs to ask many questions to ensure final pay and/or severance are handling correctly.'), 
	(1,'HRIS, Payroll & Compliance','Ethics/Corp Governance','Complaint investigation & documentation','Strong - Company has partnered with anonymous reporting service (ex. Ethics Point) to ensure employees, vendors and partners have a clear path for reporting ethical concerns. A clear policy exists explaining the how to report, what to report, and the investigation process. The policy is readily available to all parties and education is done within the org at least annually.','Adequate - Company has open door policy and standard language in the employee handbook but nothing above and beyond this.','Weakness - Company does not have employee handbook or any written process in place.'), 
	(1,'HRIS, Payroll & Compliance','Safety & Workers Compensation','OSHA','Strong - Company is fully OSHA compliant and has taken all best practice steps to proactively manage safety within the organization.','Adequate - Company has some of the OSHA compliance practices in place but not others. Needs to revisit practices and ensure full compliance.','Weakness - Company does not have OSHA compliance practices in place.'), 
	(1,'HRIS, Payroll & Compliance','Labor Relations','Labor Relations','Strong - Company has a qualified HR professional dedicated to labor relations. Company has robust partnership with labor relations outside counsel and is regularly reviewing policies and practices to ensure alignment with organizational goals.','Adequate - Company relies on staff that is not a labor relations qualified HR individual to handle union communications and compliance. Relationship with outside counsel exists but is only used when there is an urgent issue or something has become a "problem". Approach is reactive vs. proactive.','Weakness - Company does not have a clear point person within the organization to handle labor related items and either relies solely on outside counsel or does not have outside counsel at all.');

UPDATE "subfunctions"
	SET "function_id"="functions"."id"
	FROM "functions"
	WHERE "subfunctions"."function_name" = "functions"."name";

CREATE TABLE "buckets_headlines" (
	"id" SERIAL PRIMARY KEY,
	"assessment_id" INTEGER REFERENCES "client_assessments" ON DELETE CASCADE,
	"bucket_id" INTEGER REFERENCES "buckets",
	"headline_text" VARCHAR(255)
);

INSERT INTO "buckets_headlines"
	("assessment_id", "bucket_id", "headline_text")
VALUES
	(1,1,'Cheerleaders should start doing sad/interpretive dance when their team is losing.'),
	(2,2,'Did I “kill a plant” or did the plant not have what it takes to thrive in this fast-paced environment'),
	(3,3,'*at a job interview* “Can you perform under pressure?” *Me:* “Im not sure I know all the lyrics but here goes nothing.”'),
	(4,4,'[Masterchef] *Gordon Ramsay:* describe the dish *Me, proudly:* ceramic, chef'),
	(5,5, 'Mom, can you pick me up? im at a party and theres someone funnier than me here');

CREATE TABLE "assessment_items" (
	"id" SERIAL PRIMARY KEY,
	"assessment_id" INTEGER REFERENCES "client_assessments" ON DELETE CASCADE,
  "bucket_id" INTEGER REFERENCES "buckets",
	"function_id" INTEGER REFERENCES "functions",
	"subfunction_id" INTEGER REFERENCES "subfunctions",
	"level_rating" INTEGER,
	"findings" VARCHAR,
	"impact" VARCHAR,
	"recommendations" VARCHAR,
	"phase" INTEGER
);

INSERT INTO "assessment_items"
	("assessment_id", "bucket_id", "function_id", "subfunction_id", "level_rating", "findings", "impact", "recommendations", "phase")
VALUES
	(6,1,2,4,3,'Org chart exists and is accurate - however it is not shared with staff.  This is not a purposeful decision, but rather more of an oversight.','','',null),
	(6,1,2,3,2,E'The company\'s strategic plan is well documented and the process to build-out the plan is comprehensive in terms of gaining input and buy in from many stakeholders.  However, accountability for executing the strategic plan is very lacking and leadership is nervous to hold people accountable due to potential turnover. The plan is not part of anyone\'s job duties and it is unclear if/where it fits into the annual performance review process or goal-setting with staff members.','','Simplify the strategic plan and assign clear accountability to people at the outset of the new plan.  Align on how/where these expectations fit into the performance management efforts for responsible staff members.  Set clear expectations as to what staff will be coached on and held accountable to.  Create quarterly/monthly milestones to check-in on progress toward the intended outcomes.  Follow best practices in project management.',2),
	(6,1,3,8,3,'See 1.3.2.  Most processes are manual and use ""ad hoc"" tools as budget allows.  There is an ATS for the purpose of posting jobs and accepting applications.  Current tools are adequate for the needs of the company.','','',null),
	(6,1,3,7,3,E'Job descriptions are quite detailed and generally match the org chart.  There doesn\'t typically exist much overlap between roles/job duties, although some staff do ""wear multiple hats"". As no workflow processes are documented, the role definition is primarily based on the specific responsibilities of each role ""in a silo"".','','Ensure team members are clear on their key responsibilities and are held accountable to those responsibilities.',4),
	(6,1,3,5,0,'TBD','','',null),
	(6,1,3,6,1,'Very few processes have been documented and those that have are not generally stored in a common accessible location.  This is leading to significant anxiety on the part of leadership, in the event that someone should leave, all knowledge leaves ""with them"".','','Near term: Require current process owners to identify all processes they own and then create documentation to support the process.  Hold recorded calls where the staff member must ""walk through"" the process step-by-step, explaining any key details and sharing screens if applicable.  Store the recording in a common location that can then be shared as-needed. Long-term: Include documentation requirements in job descriptions and in annual performance reviews and/or regular check-in conversations.',1),
	(6,1,4,9,1,'No Succession plan exists for any leadership roles.','','Adopt a basic annual calibration process to identify possible successors to key roles.  Communicate with those people to understand their career aspirations and express support of their continued path at the company.  Ensure the company is supportive of their development.',3),
	(6,2,5,10,4,'Communications with staff are routine and planned on regular cadences and with various audiences.  Weekly emailed newsletters, weekly ""learning pod"" meetings and monthly all-staff updates are some of the communications opportunities.','','Continue with planned communications.  Incorporate a recognition item into each communication.  Re-evaluate the content/agenda to ensure they are a productive use of time for all participants.',3),
	(6,2,5,11,4,'Staff are given opportunities to engage on the strategic plan, as well as in social and charity-based committees.  The charity/community-focused options seem to get the most traction.','','',null),
	(6,2,6,12,1,'Employee opinion surveys are offered only when a salient issue has been identified.  Survey questions relate mostly to that specific issue and no two occurrences contain the same questions.','','Conduct regular basic staff feedback surveys each year (or each semester, if possible).  Use the same question set each time and ensure a dedicated effort to share results with the staff.  Measure improvements year-over-year.  Implement ideas/efficiencies as it makes sense.',2),
	(6,2,7,13,3,E'Within the collective bargaining agreements (CBA\'s) there is a clear process outlined in the event that a grievance would be filed.  However, in the last 2 years there have been no grievances and all issues have been able to be resolved with a manager conversation.  There is a general need to address accountability as a culture issue at the company - managers either don\'t have the skills or the desire to hold staff accountable (ex: on-time arrival, execution of the strat plan, etc.)','','Evaluate manager capability/readiness to hold staff accountable to clear expectations.  Conduct a focus group to identify barriers and address those barriers to accountability at a systemic level.',2),
	(6,2,8,15,3,'There are some activities that are made available for staff and family participation; they are somewhat infrequent and based on someone being willing to organize them.  When someone gets married or has a baby, there is staff recognition from the team to the individual.','','',null),
	(6,2,8,14,2,'The leadership is aware that turnover is a problem, but does not have a plan to measure it or a formal retention plan.','','Implement exit interviews when someone resigns or indicates they do not intend to return.  Capture and track the data; take action to resolve any major issues. Identify key ""backbone"" staff members and have managers conduct stay interviews.  Ensure staff are aware of the value they bring and take steps to help them feel recognized/ appreciated.',2),
	(6,2,9,16,1,'There are no formal recognition programs in place other than a 1x per year event hosted by the leadership.  It is unclear how much ""informal"" staff recognition occurs.','','Encourage recognition protocols within the various meeting cadences.  Add recognition as an agenda item and model the desired behavior.',1),
	(6,2,10,17,4,'Charitable giving is a large part of what staff ""rallies around"" within a given year - esp. with programs to help disadvantaged families.','','Keep it up - ensure the generosity of the staff is celebrated and acknowledged by the board and at appropriate meetings (i.e. share total $$ or total # of gifts that were donated by the staff).',null),
	(6,2,11,19,3,'Newsletters are emailed occasionally to encourage staff to prioritize their wellbeing.  There is a wellness budget established by the state - however this is limited.  Staff participation is encouraged but is generally sparse.','','Identify 2-3 wellness focus areas at the beginning of each school year and focus energy/efforts around those (i.e. step challenge for staff, healthy food potluck/ recipes, some recognition when people share/meet wellness goals, etc.); Make them competitive if that resonates.',4),
	(6,2,11,18,0,'See 2.7.2','','',null),
	(6,2,12,20,1,'The company does not participate in incentive programs around hiring diverse staff.  They do complete staff development around cultural competencies and staff are expected to be aware of and respectful of a variety of cultures.','','Adopt a position statement about DE&I that resonates with the type of diversity in your area.  This will help build staff awareness that there is at least a thoughtful approach.  Ensure that monthly celebrations (i.e. Black History Month) have a place on staff calendars.',3),
	(6,3,13,21,5,'The company uses a system for most compliance training.  They rely on a supplier for on-site training and certifications for custodians.  All is trackable and easily pulled.','','',null),
	(6,3,14,24,2,'CBAs cover much of this information so that issues are handled with consistency.  However the template and process for a PIP is not readily available and next steps are not always clear.','','Create an online repository of the current performance support processes and templates so that supervisors have access to the most updated materials and are handling issues consistently.',1),
	(6,3,14,23,0,'See 2.1.1.  Meetings cadence is regular and meetings occur as-expected.  TBD whether meetings are well-attended and productive.','','',1),
	(6,3,14,22,0,'Meetings do have agendas, are well-attended, and generally productive.  They are working on shoring up the meetings even further so that all topics correspond to either the strategic plan or to the graduate profile.','','',null),
	(6,3,15,25,3,E'NHO practices are adequate for their needs, however they are not documented.  There are likely opportunities to further engage the new hire and help him/her feel connected to the company\'s community.','','Document the NHO and on-boarding processes.  Assess the extent to which new hires feel truly engaged and connected to the company community after on-boarding and what could be done differently to help build more connection.',3),
	(6,3,16,29,0,'','','',null),
	(6,3,16,27,3,'OTJ training varies by role.  None of it is documented.  Would be good to at least provide a role-specific checklist of the information that needs to be covered with each new hire for OTJ.','','Provide a role-specific checklist of the information that needs to be covered with each new hire for OTJ.  This can be given to both the ""mentor"" and to the new hire to ensure everything is covered.',2),
	(6,3,16,28,3,'Management has access to training via external associations.  However, it is not required for them to attend.','',E'Ensure that supervisors have a clearer understanding of areas in which they could further grow their people-management skills.  Once those areas are identified, encourage them to participate in applicable learning experiences.  Then ensure accountability (via ICD or annual reviews) for applying the skills they\'re practicing.',3),
	(6,3,16,31,0,'','','',null),
	(6,3,16,26,2,'There is no ICD at the company.  However, people are supported in their choices to pursue additional certifications and degrees.  The leadership tries to ensure they give people exposure in their certification topics so they receive the required hours needed to complete the credential.','',E'Provide a written template that can be filled out by the staff member to identify skills/knowledge they wish to develop or grow into.  Encourage supervisors to have a recurring conversation about the contents of the template and ask how they can support the person\'s development.',null),
	(6,3,16,30,1,'No career paths.','','Build out experience maps for the most common roles.  Objective is to let people know what opportunities they have in their role - what committees and projects they could be involved in, what certifications they could pursue, what other jobs exist that might a logical change if they wanted a shift in their career.',2),
	(6,3,16,32,0,'','','',null),
	(6,3,17,33,2,'Performance reviews are done annually for staff.  It is a one-page self-evaluation and a one-page supervisor evaluation. Employees are observed 1-3 x per year by supervisors and given feedback.  Documentation is stored in personnel files. Compensation is not tied to reviews because it is tied to CBA terms.','','Evaluate the content and method used for staff performance reviews.  Incorporate values, expected behaviors and strengths/opportunities discussion.  As a follow-up, determine whether there is an appropriate development plan for the person to focus on learning a new skill or process, which would help build their engagement and help the company.',2),
	(6,3,17,34,1,'There is no talent review/calibration process that occurs with any regularity.','','Adopt a talent calibration conversation process as a method of identifying key ""backbone"" staff members, as well as providing recognition and alignment on development planning and potential successors for key roles.',3),
	(6,3,17,35,0,'','','',null),
	(6,4,18,36,4,E'Compensation is set by the CBA\'s.  Negotiations are the time at which changes can be made.  For staff, compensation is based on role and tenure - not performance.','','',1),
	(6,4,18,37,2,E'Compensation of non-CBA staff needs to be reviewed.  We don\'t know if it\'s aligned to market or not, based on skills, years of experience, etc.','','Need to review the compensation of jobs (non-CBA) against market.  Make any associated recommendations.',1),
	(6,4,18,38,2,'','','Current project in process to review pay ranges and provide recommendations based on objective data.',1),
	(6,4,18,39,1,'The unions bring forward ideas around variable pay, however they budget approval and administration process is cumbersome.  The funding is unclear.','','Explore what other companies have put in place in terms of incentives and variable pay opportunities.  Determine if something like this might make a significant positive impact for staff.',4),
	(6,4,18,40,3,'Job descriptions are quite detailed in many cases.','','Ensure staff members have access to their job descriptions at any time and communicate with them where to access them.  Use the conversation to help clarify and re-align expectations.',1),
	(6,4,18,41,0,'','','',null),
	(6,4,18,42,0,'','','',null),
	(6,4,18,43,4,'Most roles are union roles and, as such, have union agreements.  These are tracked and signed upon hire.','','',null),
	(6,4,18,44,0,'','','',null),
	(6,4,19,45,4,'Broker relationship is well-established and benefits are reviewed every other year.','','',null),
	(6,4,19,46,3,'','','Gather staff feedback about the benefits offerings and what staff members would appreciate.  Determine possible changes that might have a positive impact on staff experience and perception.',4),
	(6,4,20,47,4,'','','',null),
	(6,4,21,48,5,'Benefits info is provided upon hire and at OE.','','',null),
	(6,4,22,49,3,'Current systems are adequate to meet the needs of the company.','','',null),
	(6,4,23,50,4,'Broker is a critical partner in this process.  Staff member produces 195s with support from the systems.','','',null),
	(6,4,23,51,3,'This information is documented in the CBAs.','','',null),
	(6,4,23,52,3,'','','',null),
	(6,4,23,53,4,'','','',null),
	(6,5,24,54,0,'','','',null),
	(6,5,26,59,5,'Job offers are scripted.  Many details are dictated by the CBAs and not open for negotiation.','','',null),
	(6,5,26,60,3,'','','Ensure there is a clear back-up trained for benefits enrollment in case primary staff member is ever unexpectedly out of office.',1),
	(6,5,26,58,3,'','','',null),
	(6,5,26,61,0,'','','',null),
	(6,6,27,62,0,'','','',null),
	(6,6,27,63,3,'','','',null),
	(6,6,28,66,5,'Policies are present, thorough and updated.','','',null),
	(6,6,28,66,3,'A staff member is currently updating the handbook.  It has not been reviewed by an employment attorney, but that was not necessarily the intent.','','',null),
	(6,6,29,68,4,'The company has several systems in place that meet this need.','','',null),
	(6,6,29,67,4,'','','',null),
	(6,6,30,69,3,'','','',null),
	(6,6,31,71,1,'','','Implement a proactive approach to retention of key staff members by incorporating feedback loops with them.',1),
	(6,6,31,70,3,'','','',1),
	(6,6,32,72,3,'','','Document processes related to staff changes and ensure that there is a back-up person trained on how to handle these.',2),
	(6,6,32,73,3,'CBAs cover these situations.','','',null),
	(6,6,33,74,2,'','','Ensure all staff know the process and to whom they should be reporting any ethics or code of conduct violations.',1),
	(6,6,34,75,3,'The company partners with a 3rd party provider for this information.','','',null);

CREATE TABLE "tags" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR
);

INSERT INTO "tags"
	("name")
VALUES
	('🏆 Quick Win'),
	('🔥 Fire Drill'),
	('💪 Strength - Add to Slide'),
	('✍️ Opportunity - Add to Slide');

CREATE TABLE "tags_assessment_items" (
	"id" SERIAL PRIMARY KEY,
	"assessment_item_id" INTEGER REFERENCES "assessment_items" ON DELETE CASCADE,
	"tag_id" INTEGER REFERENCES "tags"
);
    
INSERT INTO "tags_assessment_items" ("assessment_item_id")
	SELECT "assessment_items"."id" FROM "assessment_items";

UPDATE "tags_assessment_items"
	SET "tag_id" = 3
	WHERE "assessment_item_id" = 59;

UPDATE "tags_assessment_items"
	SET "tag_id" = 3
	WHERE "assessment_item_id" = 15;

UPDATE "tags_assessment_items"
	SET "tag_id" = 3
	WHERE "assessment_item_id" = 8;

UPDATE "tags_assessment_items"
	SET "tag_id" = 1
	WHERE "assessment_item_id" = 14;

UPDATE "tags_assessment_items"
	SET "tag_id" = 1
	WHERE "assessment_item_id" = 54;

UPDATE "tags_assessment_items"
	SET "tag_id" = 4
	WHERE "assessment_item_id" = 6;

UPDATE "tags_assessment_items"
	SET "tag_id" = 4
	WHERE "assessment_item_id" = 13;

UPDATE "tags_assessment_items"
	SET "tag_id" = 4
	WHERE "assessment_item_id" = 10;

UPDATE "tags_assessment_items"
	SET "tag_id" = 2
	WHERE "assessment_item_id" = 64;

UPDATE "tags_assessment_items"
	SET "tag_id" = 2
	WHERE "assessment_item_id" = 68;

CREATE TABLE "user_client" (
	"id" SERIAL PRIMARY KEY,
	"user_id" INTEGER REFERENCES "user",
	"client_id" INTEGER REFERENCES "client" ON DELETE CASCADE
);

-------------- ** REGISTER A USER, THEN: **

--INSERT INTO "user_client"
	--("user_id","client_id")
--VALUES
	--(1, 1),
	--(1, 2),
	--(1, 3),
	--(1, 4),
	--(1, 5),
	--(1, 6),
	--(1, 7);