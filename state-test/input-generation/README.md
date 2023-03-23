# Input-Generation

We use several already established tools to generate our inputs. There are slight modifications to them in order to generate outputs that can be used for the harnesses.

## Workflows
- [FuzzyVM](https://github.com/MariusVanDerWijden/FuzzyVM) generates the evm state-tests.
- [goevmlab](https://github.com/holiman/goevmlab) with some modifications to take the state-tests and generate output for the fuzzing harnesses.

### FuzzyVM
FuzzyVM takes as input a random sequence of bytes and generates a [Program](https://github.com/holiman/goevmlab/blob/master/program/program.go#L29) that is then converted into a [GeneralStateTest](https://github.com/holiman/goevmlab/blob/master/fuzzing/copypasta.go#L90). It uses [go-fuzz/go-fuzz-build](https://github.com/dvyukov/go-fuzz) in order to use coverage to generate new inputs.
#### Usage
Either use the provided Dockerfile or:
```bash
# Clone the repo to a place of your liking using
git clone git@github.com:MariusVanDerWijden/FuzzyVM.git
# Enter the repo
cd FuzzyVM
# Build the binary
go build
# Create the fuzz-test generator as follows:
./FuzzyVM build
# Create an initial corpus
./FuzzyVM corpus --count 100  
# Run the fuzzer
./FuzzyVM run
```
The general state tests are generated in the `out` directory.

Lastly we do post-processing to create the input for the fuzzing harnesses.
TODO
