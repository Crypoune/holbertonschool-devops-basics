# Cache Observations

## Unoptimized Build

The unoptimized Dockerfile copies the entire build context before running `npm ci`.

After adding a comment to `src/server.js`, the `COPY . .` layer was rebuilt and the `npm ci --omit=dev` step ran again instead of using the cache. The dependency installation therefore took about 4.1 seconds again.

## Cached Build

The optimized Dockerfile copies `package.json`, `package-lock.json`, and the local `packages/message-format/` dependency before running `npm ci --omit=dev`.

Application source and tests are copied only after the dependency installation.

After the source-only comment change, the dependency installation step reported:

`RUN npm ci --omit=dev && node -e "setTimeout(() => {}, 3000)" CACHED`

This preserves the dependency layer when application source changes.

## Runtime Validation

The cached image was started through Docker and its `/health` endpoint returned:

`{"service":"cache-lab","status":"ok"}`

## Cache Invalidation

A change to `src/server.js` should invalidate the source `COPY` layer while preserving the dependency installation layer.

Changes to `package.json`, `package-lock.json`, or `packages/message-format/` would invalidate the dependency installation layer because those files are inputs to `npm ci`.
