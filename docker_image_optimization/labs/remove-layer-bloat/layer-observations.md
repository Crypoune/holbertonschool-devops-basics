# Layer Observations

## Unoptimized Image

The unoptimized image size is 14581975 bytes.

Its layer history shows that the first `RUN` instruction copies `/mnt/build-payload.bin` to `/tmp/build-payload.bin` and retains 6.29MB in that layer.

The following `RUN` instruction calculates the SHA-256 checksum, and the final `RUN rm -f /tmp/build-payload.bin` removes the file from the merged filesystem.

However, the `rm` instruction does not remove the bytes stored in the earlier immutable layer. The file is therefore absent from the final merged filesystem, while the payload remains part of the image's layer storage.

## Optimized Image

The optimized image size is 8290519 bytes.

The copy, checksum, and removal operations are performed in the same `RUN` instruction. The temporary payload therefore does not remain in a previous image layer.

The optimized image is:

14581975 - 8290519 = 6291456 bytes

smaller than the unoptimized image, which is exactly 6 MiB and exceeds the required minimum reduction of 5242880 bytes.

## Runtime Validation

Both images produce the same SHA-256 checksum:

`a0e8bdd8a312de8e45d2cea454dee228ede781730bfc321d96a6fced1b634090`

This confirms that the optimization preserves the application output while removing the unnecessary layer bloat.
