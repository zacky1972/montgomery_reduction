# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2025-07-19

### Dependencies
- Bump binary_extended_gcd and modular_inverse from 1.0.0 to 1.0.1

---

## [1.0.0] - 2025-07-19

### Fixed & Changed
- **Error Semantics**: Improved error handling by using `ArithmeticError` instead of `RuntimeError` for invalid mathematical inputs
- **Documentation**: Updated error documentation to reflect the new exception type
- **Code Quality**: Enhanced error handling semantics for modular arithmetic operations

### Added
- **Initial Release**: Complete Montgomery reduction implementation
- **Core Functionality**: `MontgomeryReduction.of/2` function with configurable radix
- **Input Validation**: Comprehensive error handling for invalid moduli and inputs
- **Bitwise Optimizations**: Efficient implementation using bitwise operations
- **Pattern Matching**: Proper function clauses with guard conditions
- **Documentation**: Complete module and function documentation with examples
- **Type Specifications**: Full type specs for better development experience
- **Project Setup**: Initial project setup with comprehensive development tooling

### Features
- Support for custom Montgomery radix sizes (default: 256 bits)
- Efficient modular arithmetic without expensive division operations
- Optimized for cryptographic applications with large numbers
- Comprehensive error messages for debugging
- Mathematical background and performance considerations in documentation

### Technical Details
- Uses `ModularInverse` for efficient n_prime calculation
- Implements proper Montgomery reduction algorithm with bitwise operations
- Supports odd modulus requirement with validation
- Handles overflow conditions with appropriate error messages
- Returns function closure for repeated reduction operations

### Documentation
- Comprehensive README with usage examples and mathematical background
- Complete API documentation with parameter descriptions
- Performance considerations for cryptographic applications
- Academic references and citations
- Contributing guidelines and license information

### Development
- Full development tooling setup with code quality checks
- Comprehensive test suite
- Documentation generation with ExDoc
- Static analysis with Dialyzer
- Spell checking and code formatting

### Dependencies
- Added `binary_gcd` for efficient GCD calculations
- Added `modular_inverse` for modular multiplicative inverse operations
- Added `nstandard` for development tooling
- Added `ex_doc` for documentation generation
- Added `dialyxir` for static analysis
- Added `credo` for code quality checks
- Added `spellweaver` for spell checking

---

## Version History

### 1.0.0 (Initial Release)
- Complete Montgomery reduction implementation
- Comprehensive documentation and examples
- Full development tooling setup
- Ready for production use in cryptographic applications

---

## Contributing

When contributing to this project, please update this changelog to reflect your changes. Follow the format established above and include:

- **Added**: for new features
- **Changed**: for changes in existing functionality
- **Deprecated**: for soon-to-be removed features
- **Removed**: for now removed features
- **Fixed**: for any bug fixes
- **Security**: in case of vulnerabilities

## Links

- [GitHub Repository](https://github.com/your-username/montgomery_reduction)
- [Hex Package](https://hex.pm/packages/montgomery_reduction)
- [Documentation](https://hexdocs.pm/montgomery_reduction)
