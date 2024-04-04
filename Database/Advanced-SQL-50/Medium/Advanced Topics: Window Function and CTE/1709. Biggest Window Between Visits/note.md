# Note

- for each `user_id`, we need to sort the `visit_date` in an ascending order to later identify the next `visit_date`
- today's date(`'2021-1-1'`) needs to be added as the last `visit_date` for each `user_id`
- for each `user_id`, wee need to calculate the differences between the current `visit_date` and the next `visit_date`, which is the window of days between each visit
- from all windows of days, we need to identify the maximum window for each `user_id`
