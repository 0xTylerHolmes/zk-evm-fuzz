# zk-evm-fuzz
A collection of projects and tools centered around automated fuzzing of zk-evm projects.

## Organization
Each top level dir represents the representation of the inputs under test. Each subdirectory contains the following dirs:
- input-generation: all the dependencies necessary in the workflow of creating and maintaining corpora.
- harnesses: projects with already defined stubs for fuzzing with input from the input-generation projects.

Each dir should have a brief README.md with descriptions of the projects and how to build and run them. Ideally with Dockerfiles and examples.

## Current Modules
TODO
