# Context Observations

- Before `.dockerignore` context size: 2.10MB
- Before runtime result: `context-contains-local-only-data`
- After `.dockerignore` context size: 424B
- After runtime result: `context-clean`

## Explanation

The `.dockerignore` file excludes files and directories from the build context before Docker processes the `COPY . .` instruction. Therefore, ignored files are not only excluded from the context transfer; they are also unavailable to `COPY` and cannot be included in the resulting image through that instruction.

In this lab, `.git`, `.env`, `local-only/`, `*.log`, and `reports/` are excluded. The reduced context changes what `COPY . .` can copy into the image, which is why the local-only data is absent from the optimized image.
