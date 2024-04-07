-- Solution 1
SELECT ROUND(CASE
    WHEN (SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted) AS a) = 0 THEN 0
    ELSE (SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted) AS a) * 1.0 /
    (SELECT COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id FROM FriendRequest) AS b)
END, 2) AS accept_rate
