# Base Image Decision

| Candidate   | Base reference   | Image size (bytes) | Runtime                                   |
| ----------- | ---------------- | -----------------: | ----------------------------------------- |
| Ubuntu      | `ubuntu:24.04`   |           78156602 | `{"runtime":"posix-shell","status":"ok"}` |
| Debian Slim | `debian:12-slim` |           74829562 | `{"runtime":"posix-shell","status":"ok"}` |
| Alpine      | `alpine:3.22`    |            8290528 | `{"runtime":"posix-shell","status":"ok"}` |

## Selected Base

`alpine:3.22`

Alpine is selected because it is the smallest provided candidate that satisfies all stated runtime requirements. The application requires a Linux environment and a POSIX-compatible `/bin/sh`, which Alpine provides. The requirements also state that the application has no glibc-specific native extension, so Alpine's libc implementation is compatible with this application.

## When Debian Slim Would Be Safer

Debian slim would be safer for an application that requires `glibc`-specific native extensions or a vendor-supported Debian package. In that situation, Alpine's smaller size would not outweigh the compatibility requirements.

## Versioned Tags and Digests

A versioned tag such as `alpine:3.22` provides better control than `latest` because it identifies a specific Alpine release line. However, a tag is still mutable and can point to a different image over time. A digest identifies an exact image content and is therefore required when an immutable base reference is needed.
