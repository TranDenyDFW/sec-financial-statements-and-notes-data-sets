USE secfsds;
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

/*
(1) '0000320193-20-000096'
(2) '0000950170-23-035122'
(3) '0001564590-21-039151'
(4) '0000320193-23-000106'
*/

DECLARE @stmt VARCHAR(5) = 'BS'; -- CF/IS/BS

DECLARE @qtrs INT = IIF(@stmt='CF' OR @stmt='IS', 4, 0)
DECLARE @adsh VARCHAR(20) = '0000950170-23-035122';
DECLARE @form VARCHAR(20) = '10-K';
DECLARE @menucat VARCHAR(1) = 'S';
DECLARE @fp VARCHAR(2) = 'FY';
DECLARE @cfStart VARCHAR(50) = 'periodStartLabel';
DECLARE @cfEnd VARCHAR(50) = 'periodEndLabel';
DECLARE @inpth INT = 0; DECLARE @iprx INT = 0; DECLARE @value INT = 0;

SELECT [plabel],[uom] 
	, IIF(
		 NOT CHARINDEX('PerShare', [tag]) > 0
		,FORMAT([value], '#,##0')
		,FORMAT([value], '#,##0.00')
	) AS [value]
FROM (
	SELECT
	 dd.[ddate],
	 prn.[plabel] 
	 ,t.[tag]
	 ,n.[uom] 
	 ,IIF(
		 prn.[negating]=1,
		 n.[value]*-1,
		 n.[value]
	 ) AS [value]
	 ,prn.[report],prn.[line]
	FROM [secfsds].[dbo].[sub] s
	INNER JOIN [secfsds].[dbo].[num] n
	ON s.[subID]=n.[subID]
	INNER JOIN  (
		SELECT 
			 p.[subID] ,p.[report] ,p.[line] ,p.[tagID] 
			,p.[fsndsID] ,p.[inpth] ,p.[negating] 
			,p.[prole] ,p.[plabel] ,p.[stmt] 
			,r.[ultparentrpt] ,r.[parentreport]
			,r.[longname] ,r.[menucat] ,r.[parentroleuri]
		FROM [secfsds].[dbo].[pre] p
		INNER JOIN  [secfsds].[dbo].[ren] r
		ON r.[subID]=p.[subID] AND r.[report]=p.[report]
		WHERE p.[inpth]=@inpth
		AND p.[stmt]=@stmt
	) AS prn
	ON prn.[subID]=n.[subID] AND prn.[tagID]=n.[tagID]
	INNER JOIN [secfsds].[dbo].[ddate] dd
	ON dd.[ddateID]=n.[ddateID]
	INNER JOIN [secfsds].[dbo].[dim] d
	ON d.[dimID]=n.[dimID]
	INNER JOIN [secfsds].[dbo].[tag] t
	ON t.[tagID]=n.[tagID]
	WHERE prn.[menucat]=@menucat
	AND d.[dimh]='0x00000000' AND s.[adsh]=@adsh
	AND n.[iprx]=@iprx AND s.[fp]=@fp AND s.[form]=@form
	AND [value] IS NOT NULL AND [value] != @value
	AND (n.[qtrs]=@qtrs OR prn.[prole] IN (@cfStart, @cfEnd))
	AND dd.[ddate] = CONCAT(s.[fy],RIGHT(CONCAT('0', s.[fye]), 4))
) subquery
ORDER BY [ddate],[report],[line];