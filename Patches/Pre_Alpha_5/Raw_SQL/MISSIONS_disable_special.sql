USE [perpetuumsa]
GO


-----------Diable Special Missions-------------------
PRINT N'Turn off special missions -- sends to inactive islands';
UPDATE missions
SET listable=0
WHERE missiontype=(SELECT id from missiontypes where name like 'missiontype_storyline');
GO