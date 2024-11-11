ABC Corp is a mid-sized insurer in the US and in the recent past their fraudulent claims have increased significantly for their personal auto insurance portfolio. They have developed a ML based predictive model to identify propensity of fraudulent claims. Now, they assign highly experienced claim adjusters for top 5 percentile of claims identified by the model.
Your objective is to identify the top 5 percentile of claims from each state. Your output should be policy number, state, claim cost, and fraud score.

How it Works:
Calculate State-Specific Thresholds: The CTE (percentiles) finds the 5th percentile fraud score per state. I find the fraud score threshold that only 5% of policies fall below in each state.

Filter for High-Risk Policies: The main query then filters out policies with fraud scores above or equal to this 5th percentile, giving us policies with the highest fraud risk per state.
  
solution
--------
WITH percentiles AS (
    SELECT state,
           percentile_cont(0.05) WITHIN GROUP (ORDER BY fraud_score DESC) AS percentile
    FROM fraud_score
    GROUP BY state
)
SELECT policy_num,
       f.state,
       claim_cost,
       fraud_score
FROM fraud_score f
JOIN percentiles p ON f.state = p.state
WHERE fraud_score >= percentile;
