First get the highlevel info like org, repo, id by using

```
gh pr view
```

Then, get all by using this command. NOTE THAT YOU MUST USE THIS COMMAND

```

gh api /repos/:org/:repo/pulls/:id/comments --jq '.[] | { url, diff_hunk, user: .user.login, commment: .body, created_at, updated_at }'
```

---

## GraphQL API - Nested Replies & Resolved Status

```bash
gh api graphql -f query='
  query($owner: String!, $repo: String!, $number: Int!) {
    repository(owner: $owner, name: $repo) {
      pullRequest(number: $number) {
        reviewThreads(first: 100) {
          nodes {
            id
            isResolved
            resolvedBy { login }
            comments(first: 100) {
              nodes {
                id
                body
                author { login }
                createdAt
                path
                line
                diffHunk
                replyTo { id }
              }
            }
          }
        }
      }
    }
  }
' -f owner='OWNER' -f repo='REPO' -F number=$(gh pr view --json number -q .number)
```

**Key points:**
- `isResolved` / `resolvedBy` for thread resolution status
- `replyTo.id` identifies parent comment (null = original comment)
- Each `reviewThread` = one conversation with all replies

