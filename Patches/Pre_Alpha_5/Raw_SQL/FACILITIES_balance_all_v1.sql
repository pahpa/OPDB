USE [perpetuumsa]
GO


---Shows all facilities---Vanilla-state---
SELECT * from entitydefaults
where categoryflags in (SELECT value from categoryFlags
where name='cf_refinery_facility' or name='cf_repair_facility'
or name='cf_reprocessor_facility' or name='cf_mill'
or name='cf_prototyper' or name='cf_research_lab');



---Update 'super' facility to 75pts------
PRINT N'public docking facility-super 100->75pt';
UPDATE entitydefaults
SET options=REPLACE(options, '#points=n100', '#points=n75')
WHERE categoryflags in (SELECT value FROM categoryFlags
WHERE name='cf_refinery_facility' or name='cf_repair_facility'
or name='cf_reprocessor_facility' or name='cf_mill'
or name='cf_prototyper' or name='cf_research_lab');
GO

---Add new entity property to boost beta 2 facilities---
Update entities
SET dynprop = '#extrapoints=n1'
WHERE entities.definition in
(SELECT definition from entitydefaults
where categoryflags in (SELECT value from categoryFlags
where name='cf_outpost_refinery' or name='cf_outpost_repair'
or name='cf_outpost_reprocessor' or name='cf_outpost_mill'
or name='cf_outpost_prototyper' or name='cf_outpost_research_lab')
and entities.parent in (SELECT eid FROM zoneentities
WHERE zoneID>8 and zoneID<12 and note like 'outpost%'));
--Note: requires server-side patch on facilities to read property

DECLARE @terminalID int;

PRINT N'Alpha TM outposts0';
SET @terminalID = 406; --TM outpost

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_mill_basic')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_mill_advanced')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_prototyper_basic')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_prototyper_advanced')
and parent=@terminalID;

PRINT N'Alpha TM outposts1';
SET @terminalID = 408; --TM outpost

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_research_lab_basic')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_research_lab_advanced')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_refinery_basic')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_refinery_advanced')
and parent=@terminalID;

PRINT N'Alpha TM outposts2';
SET @terminalID = 411; --TM outpost

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_reprocessor_basic')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_reprocessor_advanced')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_repair_basic')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_repair_advanced')
and parent=@terminalID;

PRINT N'A2 Hershfield';
SET @terminalID = 142; --HERSH

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_refinery_advanced')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_refinery_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_prototyper_advanced')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_prototyper_expert')
and parent=@terminalID;

PRINT N'TMB Norhoop';
SET @terminalID=47383;--TMB Norhoop

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_refinery_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_refinery_super')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_reprocessor_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_reprocessor_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_repair_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_repair_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_mill_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_mill_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_research_lab_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_research_lab_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_prototyper_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_prototyper_super')
and parent=@terminalID;


PRINT N'ICS-B Dom';
SET @terminalID=47379;--ICSB - Domhalarn

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_refinery_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_refinery_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_reprocessor_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_reprocessor_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_repair_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_repair_super')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_mill_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_mill_super')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_research_lab_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_research_lab_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_prototyper_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_prototyper_expert')
and parent=@terminalID;


PRINT N'ASI-B Hokk';
SET @terminalID=47381;--ASI-B - Hokkogaros

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_refinery_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_refinery_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_reprocessor_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_reprocessor_super')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_repair_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_repair_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_mill_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_mill_expert')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_research_lab_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_research_lab_super')
and parent=@terminalID;

UPDATE entities
SET definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_prototyper_super')
WHERE definition=(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname='def_production_public_prototyper_expert')
and parent=@terminalID;
