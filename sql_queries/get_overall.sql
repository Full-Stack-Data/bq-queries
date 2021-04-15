-- TODO: add time partition constraints

SELECT
  client_id,
  EXTRACT(DATE from cur_time) date,
  EXTRACT(HOUR from cur_time) hour,
  device_type,
  COUNT(DISTINCT(uuid)) users,
  COUNT(DISTINCT(session_id)) sessions,
  COUNT(page_id) pageviews,
  COUNT(time_spent) pageviews_w_timespent,
  SUM(time_spent) tot_time,
  COUNT(affluence_index) pageviews_w_affluence,
  SUM(affluence_index) affluence_index,
  COUNT(CASE WHEN first_ever_session THEN 1 END) num_first_ever_sessions,
  COUNT(CASE WHEN session_referrer_type = 'Search' THEN 1 END) search_pageviews,
  COUNT(CASE WHEN session_referrer_type = 'Social' THEN 1 END) social_pageviews,
  COUNT(CASE WHEN session_referrer_type = 'Forum' THEN 1 END) forum_pageviews,
  COUNT(CASE WHEN session_referrer_type = 'Direct' THEN 1 END) direct_pageviews,
  COUNT(CASE WHEN session_referrer_type = 'Other' THEN 1 END) other_pageviews,
  COUNT(CASE WHEN first_ever_pageview THEN 1 END) first_pageviews,
  COUNT(DISTINCT(CASE WHEN first_ever_session THEN session_id END)) first_sessions,
  COUNT(CASE WHEN active_last_24hrs THEN 1 END) pageviews_active_last_day,
  COUNT(CASE WHEN active_last_7days THEN 1 END) pageviews_active_last_week
FROM
  `the-broadline.fsd.web_ingestion`
GROUP BY
  client_id, date, hour, device_type
;