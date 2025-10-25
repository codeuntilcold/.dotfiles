## RESPONDING TO PR COMMENTS

When asked to reply to PR comments on your behalf:

### 1. Fetch PR Information and Comments

```bash
# Get PR details
gh pr view

# Get all review comments with structured output
gh api /repos/:org/:repo/pulls/:id/comments | jq '.[] | { url, diff_hunk, user: .user.login, comment: .body, created_at, updated_at }'
```

### 2. Reply Using Correct API Endpoint

```
gh api \
 --method POST \
 /repos/{owner}/{repo}/pulls/{pr_number}/comments \
 -f body="Your reply text here" \
 -F in_reply_to={comment_id}
```

Key points:
- Use /pulls/{pr_number}/comments endpoint (NOT /pulls/comments/{id}/replies)
- Use -F in_reply_to={comment_id} to thread the reply
- Use -f body="text" for the message content

### 3. Tone and Style

Avoid:
- Excessive exclamation marks
- Overly enthusiastic language
- Unnecessary pleasantries

Include:
- Technical reasoning for decisions
- Openness to alternative approaches
- Specific tradeoffs considered

4. Common Response Patterns

For code style suggestions:
"Good point. I went with [approach] because [technical reason]. Happy to change to [alternative] if you think it's clearer."

For architectural questions:
"The intent was [goal/purpose]. [Explain tradeoff]. We can [alternative] if you'd prefer [different outcome] though."

For questions about missing features:
"I considered [feature] but opted not to include it because [reason]. We can add it if [condition]."

5. Before Sending

- List out the replies for the human to verify.
- Ensure technical accuracy
- Keep responses concise (2-3 sentences max)
- Offer alternatives when appropriate
- Match the reviewer's level of formality
