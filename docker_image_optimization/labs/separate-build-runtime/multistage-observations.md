# Multistage Observations

## Single-Stage Image

The single-stage image uses `golang:1.25-alpine` for the entire runtime image.

It builds and runs successfully:

`{"service":"greeter","status":"ok"}`

Its image size is 270575129 bytes.

Because the compiler, Go toolchain, source tree, tests, and build environment remain in the same image, the runtime image is much larger than necessary.

## Multistage Image

The multistage build uses a named `golang:1.25-alpine` build stage and a final `scratch` stage.

The build stage copies `go.mod` first, runs `go mod download`, then copies the source tree, runs `go test ./...`, and builds a statically linked binary with `CGO_ENABLED=0`.

The final stage copies only the built `/greeter` binary and configures:

`USER 65532:65532`

The optimized image runs successfully and produces:

`{"service":"greeter","status":"ok"}`

Its image size is 2254847 bytes.

The optimized image is:

270575129 - 2254847 = 268320282 bytes

smaller than the single-stage image.

## Scratch Shell Test

Attempting to override the entrypoint with `/bin/sh` fails with:

`exec: "/bin/sh": stat /bin/sh: no such file or directory`

This failure is expected because the final image uses `scratch`, which contains no shell or other runtime utilities.

The failed shell test does not replace functional application testing. The application binary was tested directly and returned the expected health response. The purpose of the `scratch` image is to contain only what the application needs at runtime, not to provide an interactive debugging environment.
