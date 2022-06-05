SELECT
    MIN(subscription_value) AS faturamento_minimo,
    MAX(subscription_value) AS faturamento_maximo,
    ROUND(AVG(subscription_value), 2) AS faturamento_medio,
    SUM(subscription_value) AS faturamento_total
FROM
    subscriptions
    JOIN user ON subscription_id = user.subscriptions_subscription_id;