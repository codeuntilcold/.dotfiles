First get the highlevel info like org, repo, id by using

```
gh pr view
```

Then, get all by using this command. NOTE THAT YOU MUST USE THIS COMMAND

```

gh api /repos/:org/:repo/pulls/:id/comments | jq '.[] | { url, diff_hunk, user: .user.login, commment: .body, created_at, updated_at }'
```

