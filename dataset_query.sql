-- E-Commerce Sales Analysis: dataset for Portfolio Project 1
-- One row per session (or per ordered item, if the session has an order)

SELECT
  s.date                  AS session_date,
  s.ga_session_id         AS session_id,
  sp.continent,
  sp.country,
  sp.device,
  sp.browser,
  sp.mobile_model_name    AS device_model,
  sp.operating_system,
  sp.language             AS browser_language,
  sp.medium               AS traffic_source,
  sp.channel              AS traffic_channel,
  acs.account_id,
  a.is_verified           AS email_verified,
  a.is_unsubscribed,
  p.category              AS product_category,
  p.name                  AS product_name,
  p.short_description     AS product_description,
  p.price                 AS product_price
FROM `data-analytics-mate.DA.session` s
LEFT JOIN `data-analytics-mate.DA.session_params` sp
  ON s.ga_session_id = sp.ga_session_id
LEFT JOIN `data-analytics-mate.DA.account_session` acs
  ON s.ga_session_id = acs.ga_session_id
LEFT JOIN `data-analytics-mate.DA.account` a
  ON acs.account_id = a.id
LEFT JOIN `data-analytics-mate.DA.order` o
  ON s.ga_session_id = o.ga_session_id
LEFT JOIN `data-analytics-mate.DA.product` p
  ON o.item_id = p.item_id;
