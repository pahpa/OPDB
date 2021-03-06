USE [perpetuumsa]
GO


--Add Mining and Harvesting missions to Beta2
--Creates new agents
--Sets them to be agents at missionlocations on Beta2s
--Insert missiontoagent relations for mining/harvest missions only

PRINT N'BETA2 MISSIONS: STAGE 1 - ADD HARVEST AND MINING TO OUTPOSTS';
DECLARE @MaxLevel int;
SET @MaxLevel = 7;

DECLARE @ASI bigint;
DECLARE @ICS bigint;
DECLARE @TM bigint;

DECLARE @ASIname varchar(128);
DECLARE @ICSname varchar(128);
DECLARE @TMname varchar(128);

DECLARE @ASIagentName varchar(128);
DECLARE @ICSagentName varchar(128);
DECLARE @TMagentName varchar(128);

--names of agents
SET @ASIagentName = 'outpost_asi_beta2';
SET @ICSagentName = 'outpost_ics_beta2';
SET @TMagentName = 'outpost_tm_beta2';

--Megacorps and allianceEids
SET @ASIname = 'megacorp_ASI';
SET @ICSname = 'megacorp_ICS';
SET @TMname = 'megacorp_TM';

SET @ASI = (SELECT TOP 1 [allianceEID] FROM dbo.alliances WHERE name=@ASIname);
SET @ICS = (SELECT TOP 1 [allianceEID] FROM dbo.alliances WHERE name=@ICSname);
SET @TM = (SELECT TOP 1 [allianceEID] FROM dbo.alliances WHERE name=@TMname);

PRINT N'INSERT NEW AGENTS';

INSERT INTO [dbo].[missionagents]
           ([agentname],[owner],[ownername])
     VALUES
           (@ASIagentName,@ASI,@ASIname),
		   (@ICSagentName,@ICS,@ICSname),
		   (@TMagentName,@TM,@TMname);

--Newly inserted IDs of agents
DECLARE @ASIagent int;
DECLARE @ICSagent int;
DECLARE @TMagent int;

SET @ASIagent = (SELECT TOP 1 id FROM dbo.missionagents WHERE agentname=@ASIagentName);
SET @ICSagent = (SELECT TOP 1 id FROM dbo.missionagents WHERE agentname=@ICSagentName);
SET @TMagent = (SELECT TOP 1 id FROM dbo.missionagents WHERE agentname=@TMagentName);

PRINT N'UPDATE MISSION LOCATIONS -> ASSIGN WITH NEW AGENTS';
--Put new agents in missionlocations in each beta2 outpost
UPDATE dbo.missionlocations
SET agentid=@ASIagent,
	maxmissionlevel=@MaxLevel
WHERE zoneid=(SELECT TOP 1 id FROM zones WHERE note='kentagura');

UPDATE dbo.missionlocations
SET agentid=@ICSagent,
	maxmissionlevel=@MaxLevel
WHERE zoneid=(SELECT TOP 1 id FROM zones WHERE note='novastrov');

UPDATE dbo.missionlocations
SET agentid=@TMagent,
	maxmissionlevel=@MaxLevel
WHERE zoneid=(SELECT TOP 1 id FROM zones WHERE note='alsbale');

--Only 2 harvest mission templates
DECLARE @harvest1 int;
DECLARE @harvest2 int;
--Mining missions
DECLARE @mining1 int;
DECLARE @mining2 int;
DECLARE @mining3 int;

SET @harvest1 = (SELECT TOP 1 id FROM missions WHERE title='missiontemplate_random_harvesting_01');
SET @harvest2 = (SELECT TOP 1 id FROM missions WHERE title='missiontemplate_random_harvesting_02');

SET @mining1 = (SELECT TOP 1 id FROM missions WHERE title='missiontemplate_random_mining_01');
SET @mining2 = (SELECT TOP 1 id FROM missions WHERE title='missiontemplate_random_mining_02');
SET @mining3 = (SELECT TOP 1 id FROM missions WHERE title='missiontemplate_random_mining_03');

PRINT N'INSERT MISSION-TO-AGENT RELATIONS -- ADDS HARVEST AND MINING TEMPLATES';
--Add missions to each agent
INSERT INTO [dbo].[missiontoagent]
           ([missionid],[agentid])
     VALUES
           (@mining1,@ASIagent),
		   (@mining2,@ASIagent),
		   (@mining3,@ASIagent),
		   (@harvest1,@ASIagent),
		   (@harvest2,@ASIagent),
		   (@mining1,@ICSagent),
		   (@mining2,@ICSagent),
		   (@mining3,@ICSagent),
		   (@harvest1,@ICSagent),
		   (@harvest2,@ICSagent),
		   (@mining1,@TMagent),
		   (@mining2,@TMagent),
		   (@mining3,@TMagent),
		   (@harvest1,@TMagent),
		   (@harvest2,@TMagent);


DECLARE @alsbale1 int;
DECLARE @alsbale2 int;
DECLARE @kent1 int;
DECLARE @kent2 int;
DECLARE @nova1 int;
DECLARE @nova2 int;

SET @alsbale1 = (SELECT TOP 1 id FROM missionlocations WHERE locationname='outpost_tm_1_exp1');
SET @alsbale2 = (SELECT TOP 1 id FROM missionlocations WHERE locationname='outpost_tm_2_exp1');

SET @kent1 = (SELECT TOP 1 id FROM missionlocations WHERE locationname='outpost_asi_1_exp1');
SET @kent2 = (SELECT TOP 1 id FROM missionlocations WHERE locationname='outpost_asi_2_exp1');

SET @nova1 = (SELECT TOP 1 id FROM missionlocations WHERE locationname='outpost_ics_1_exp1');
SET @nova2 = (SELECT TOP 1 id FROM missionlocations WHERE locationname='outpost_ics_2_exp1');

--Insert missiontolocation "missionresolveinfo" objects -- produced from a testing pipeline--required for each mission at each location!!
--TODO figure out how to generate records using commands!!
PRINT N'INSERT MISSION-TO-LOCATION OBJECTS -- TODO use missionTestResolve command to produce these and test missions!';
INSERT INTO [dbo].[missiontolocation]
           ([missionid],[locationid],[attempts],[success],[uniquecases],[rewardaverage])
     VALUES
           (@mining1,@alsbale1,100,100,0,0),
		   (@mining2,@alsbale1,100,100,0,0),
		   (@mining3,@alsbale1,100,100,0,0),
		   (@harvest1,@alsbale1,100,100,0,0),
		   (@harvest2,@alsbale1,100,100,0,0),

           (@mining1,@alsbale2,100,100,0,0),
		   (@mining2,@alsbale2,100,100,0,0),
		   (@mining3,@alsbale2,100,100,0,0),
		   (@harvest1,@alsbale2,100,100,0,0),
		   (@harvest2,@alsbale2,100,100,0,0),

		   (@mining1,@kent1,100,100,0,0),
		   (@mining2,@kent1,100,100,0,0),
		   (@mining3,@kent1,100,100,0,0),
		   (@harvest1,@kent1,100,100,0,0),
		   (@harvest2,@kent1,100,100,0,0),

		   (@mining1,@kent2,100,100,0,0),
		   (@mining2,@kent2,100,100,0,0),
		   (@mining3,@kent2,100,100,0,0),
		   (@harvest1,@kent2,100,100,0,0),
		   (@harvest2,@kent2,100,100,0,0),

		   (@mining1,@nova1,100,100,0,0),
		   (@mining2,@nova1,100,100,0,0),
		   (@mining3,@nova1,100,100,0,0),
		   (@harvest1,@nova1,100,100,0,0),
		   (@harvest2,@nova1,100,100,0,0),

		   (@mining1,@nova2,100,100,0,0),
		   (@mining2,@nova2,100,100,0,0),
		   (@mining3,@nova2,100,100,0,0),
		   (@harvest1,@nova2,100,100,0,0),
		   (@harvest2,@nova2,100,100,0,0);

GO