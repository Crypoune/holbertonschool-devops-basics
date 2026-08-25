# Baseline Observations

- Image size in bytes: 1026016584
- Largest non-base instruction and evidence: `RUN ... apt-get ...` — 588MB
- Configured runtime user: `""`
- Unnecessary copied file or directory 1: `tests/` — the running API does not import or require the test suite.
- Unnecessary copied file or directory 2: `docs/` — documentation is not required by the running API.

## Evidence-Based Optimization Targets

1. **Reduce image size** — the baseline image is 1026016584 bytes.
2. **Reduce the largest non-base layer** — the largest non-base instruction is an `apt-get` RUN layer of 588MB.
3. **Reduce unnecessary build context contents** — `COPY . .` copies `tests/` and `docs/`, which are not required by the runtime API.
