
--Remove All pelistal Syndicate shop items from NV and Hersh
SELECT * FROM [perpetuumsa].[dbo].[itemshop]
JOIN entitydefaults on targetdefinition=definition
WHERE presetid=1 and ( definitionname like '%pelistal%' or definitionname like '%rocket%' or definitionname like '%missile%');

DELETE item FROM [perpetuumsa].[dbo].[itemshop] as item
Join entitydefaults on targetdefinition=entitydefaults.definition
where presetid=1 and definitionname like '%pelistal%' or definitionname like '%rocket%' or definitionname like '%missile%'


SELECT * FROM [perpetuumsa].[dbo].[itemshop]
JOIN entitydefaults on targetdefinition=definition
WHERE presetid=1 

--Clear other token costs for syndicate bots
UPDATE items
SET tmcoin=NULL, icscoin=NULL, asicoin=NULL
FROM itemshop as items
JOIN entitydefaults on targetdefinition=definition
WHERE (categoryflags & 65535)=3841;

--def_vektor_bot
UPDATE itemshop SET unicoin=60 WHERE targetdefinition=5504;
--def_locust_bot
UPDATE itemshop SET unicoin=150 WHERE targetdefinition=5512;
--def_ikarus_bot
UPDATE itemshop SET unicoin=30 WHERE targetdefinition=5528;
--def_echelon_bot
UPDATE itemshop SET unicoin=750 WHERE targetdefinition=5516;
--def_daidalos_bot
UPDATE itemshop SET unicoin=1050 WHERE targetdefinition=5540;
--def_cronus_bot
UPDATE itemshop SET unicoin=180 WHERE targetdefinition=5532;
--def_hermes_bot
UPDATE itemshop SET unicoin=180 WHERE targetdefinition=5536;

---inserts---
--5508	def_helix_bot
INSERT INTO [dbo].[itemshop]
([presetid],[targetdefinition],[targetamount],[tmcoin],[icscoin],[asicoin],[credit],[unicoin],[globallimit],[purchasecount],[standing])
VALUES(1,5508,1,NULL,NULL,NULL,800000,240,NULL,1,NULL)
--5520	def_callisto_bot
INSERT INTO [dbo].[itemshop]
([presetid],[targetdefinition],[targetamount],[tmcoin],[icscoin],[asicoin],[credit],[unicoin],[globallimit],[purchasecount],[standing])
VALUES(1,5520,1,NULL,NULL,NULL,8000000,2100,NULL,1,NULL)
--5524	def_legatus_bot
INSERT INTO [dbo].[itemshop]
([presetid],[targetdefinition],[targetamount],[tmcoin],[icscoin],[asicoin],[credit],[unicoin],[globallimit],[purchasecount],[standing])
VALUES(1,5524,1,NULL,NULL,NULL,20000000,6000,NULL,1,NULL)
--5544	def_metis_bot
INSERT INTO [dbo].[itemshop]
([presetid],[targetdefinition],[targetamount],[tmcoin],[icscoin],[asicoin],[credit],[unicoin],[globallimit],[purchasecount],[standing])
VALUES(1,5544,1,NULL,NULL,NULL,40000000,12000,NULL,1,NULL)

