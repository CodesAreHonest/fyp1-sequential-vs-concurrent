DELETE FROM leo WHERE TRUE;

----------------------------------------
-- LEO TABLE INSERTION 
-- ROW COUNTS: 32706		<- SAME COUNT WITH RAWDATA
----------------------------------------

INSERT INTO leo (leo_detail_id, leo_grads_id, leo_match_id, leo_uncaptured_id, leo_sust_emp_id, leo_earning_id, leo_polar_id, leo_pr_att_id)
	SELECT leo_detail_id, leo_grads_id, leo_match_id, leo_uncaptured_id, leo_sust_emp_id, leo_earning_id, leo_polar_id, leo_pr_att_id
	FROM leo_rawdata AS rawdata
	JOIN leo_detail     AS detail 
		ON      detail.leo_ukprn = rawdata.ukprn 
		AND 	detail.leo_providername = rawdata.providername
		AND 	detail.leo_region = rawdata.region
		AND 	detail.leo_subject = rawdata.subject
		AND 	detail.leo_sex = rawdata.sex
		AND 	detail.leo_yearaftergraduation = rawdata.yearaftergraduation
	JOIN leo_graduation AS grad 
		ON 	grad.leo_grad = rawdata.grads
	JOIN leo_match	    AS match 
		ON 	match.leo_unmatched = rawdata.unmatched
		AND    	match.leo_matched   = rawdata.matched
	JOIN leo_uncaptured AS uncaptured 
		ON      uncaptured.leo_activitynotcaptured = rawdata.activitynotcaptured
		AND     uncaptured.leo_no_sust_dest        = rawdata.nosustdest
	JOIN leo_sustain_employment       AS sustemp 
		ON      sustemp.leo_sust_emp_only 	= rawdata.sustemponly
		AND     sustemp.leo_sust_emp      	= rawdata.sustemp
		AND     sustemp.leo_sust_emp_fs_or_both = rawdata.sustempfsorboth
	JOIN leo_earning    AS earning 
		ON      earning.leo_earning_include 	= rawdata.earningsinclude
		AND     earning.leo_lower_ann_earn      = rawdata.lowerannearn
		AND     earning.leo_median_ann_earn     = rawdata.medianannearn
		AND     earning.leo_upper_ann_earn      = rawdata.upperannearn
	JOIN leo_polar      AS polar 
		ON      polar.leo_polar_grp_one 	= rawdata.polargrpone
		AND     polar.leo_polar_grp_included    = rawdata.polargrponeincluded
	JOIN leo_prior_attainment     AS pa 
		ON      pa.leo_pr_att_band 		= rawdata.prattband
		AND     pa.leo_pr_att_included          = rawdata.prattincluded;






 	 

