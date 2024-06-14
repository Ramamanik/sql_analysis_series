select policy_num,
state,
claim_cost,
fraud_score
from

(select policy_num,
state,
claim_cost,
fraud_score,
ntile(100) over(partition by state order by fraud_score desc) as fraud_tile
from fraud_score) x

where fraud_tile <= 5
