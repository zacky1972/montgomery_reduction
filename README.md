# Montgomery Reduction

A high-performance Elixir library for efficient modular arithmetic using Montgomery reduction.

[![Hex.pm](https://img.shields.io/hexpm/v/montgomery_reduction.svg)](https://hex.pm/packages/montgomery_reduction)
[![Hex.pm](https://img.shields.io/hexpm/dt/montgomery_reduction.svg)](https://hex.pm/packages/montgomery_reduction)
[![Documentation](https://img.shields.io/badge/docs-hexpm-blue.svg)](https://hexdocs.pm/montgomery_reduction)

## Overview

Montgomery reduction is a technique for efficiently computing modular arithmetic operations, particularly useful in cryptographic applications where large modular multiplications are performed frequently. This library provides a clean, efficient implementation of Montgomery reduction in Elixir.

## Features

- **Efficient modular arithmetic**: Perform modular operations without expensive division
- **Cryptographic applications**: Optimized for large number operations common in cryptography
- **Configurable radix**: Support for different Montgomery radix sizes
- **Error handling**: Comprehensive validation and error reporting
- **Type specifications**: Full type specs for better development experience

## Installation

Add `montgomery_reduction` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:montgomery_reduction, "~> 1.0"}
  ]
end
```

## Usage

### Basic Usage

```elixir
# Create a Montgomery reducer for modulus 17
reducer = MontgomeryReduction.of(17)

# Perform Montgomery reduction
result = reducer.(100)
# => 15
```

### Custom Radix

```elixir
# Create a reducer with 8-bit radix
reducer = MontgomeryReduction.of(23, 8)
result = reducer.(50)
# => 9
```

### Error Handling

The library provides comprehensive error handling:

```elixir
# This will raise an error - modulus must be odd
MontgomeryReduction.of(16)

# This will raise an error - input too large
reducer = MontgomeryReduction.of(17)
reducer.(1000000)  # Input exceeds n * 2^r_bits
```

## Mathematical Background

Montgomery reduction computes `(t * R^(-1)) mod n` where:
- `R = 2^r_bits` is the Montgomery radix (typically a power of 2)
- `R^(-1)` is the modular multiplicative inverse of R modulo n
- `n` is the modulus (must be odd)

This transformation allows modular multiplication to be performed using only additions, multiplications, and bit shifts, making it much more efficient than traditional modular arithmetic for large numbers.

## Performance

Montgomery reduction is particularly beneficial when:
- Working with large numbers (typically 256+ bits)
- Performing many modular operations
- Implementing cryptographic algorithms like RSA or elliptic curve cryptography

## Dependencies

This library depends on:
- `binary_gcd` for efficient GCD calculations
- `nstandard` for development tooling

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

Copyright (c) 2025 University of Kitakyushu

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## References

- [Montgomery, P.L. (1985). Modular multiplication without trial division](https://doi.org/10.1090/S0025-5718-1985-0777282-X)

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc) and published on [HexDocs](https://hexdocs.pm). Once published, the docs can be found at <https://hexdocs.pm/montgomery_reduction>.

