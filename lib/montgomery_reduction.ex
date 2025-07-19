defmodule MontgomeryReduction do
  @moduledoc """
  A library for efficient modular arithmetic using Montgomery reduction.

  Montgomery reduction is a technique for efficiently computing modular arithmetic
  operations, particularly useful in cryptographic applications where large modular
  multiplications are performed frequently.

  ## Overview

  Montgomery reduction allows for efficient computation of modular arithmetic by
  transforming the problem into a different domain where modular reduction is
  performed using simple bit shifts and additions instead of expensive division
  operations.

  ## Key Features

  * **Efficient modular arithmetic**: Perform modular operations without expensive division
  * **Cryptographic applications**: Optimized for large number operations common in cryptography
  * **Configurable radix**: Support for different Montgomery radix sizes
  * **Error handling**: Comprehensive validation and error reporting

  ## Mathematical Background

  Montgomery reduction computes $tR^{-1} \\mod n$ where:
  - $R = 2^{r\\_bits}$ is the Montgomery radix (typically a power of 2)
  - $R^{-1}$ is the modular multiplicative inverse of R modulo n
  - $n$ is the modulus (must be odd)

  This transformation allows modular multiplication to be performed using only
  additions, multiplications, and bit shifts, making it much more efficient
  than traditional modular arithmetic for large numbers.

  ## Usage

      iex> reducer = MontgomeryReduction.of(17)
      iex> reducer.(100)
      15

      iex> reducer = MontgomeryReduction.of(23, 8)
      iex> reducer.(50)
      9

  ## Performance

  Montgomery reduction is particularly beneficial when:
  - Working with large numbers (typically 256+ bits)
  - Performing many modular operations
  - Implementing cryptographic algorithms like RSA or elliptic curve cryptography

  ## Dependencies

  This library depends on:
  - `binary_gcd` for efficient GCD calculations
  - `nstandard` for development tooling

  ## References

  * [Montgomery, P.L. (1985). Modular multiplication without trial division](https://doi.org/10.1090/S0025-5718-1985-0777282-X)
  * [Handbook of Applied Cryptography - Chapter 14](https://cacr.uwaterloo.ca/hac/)
  """

  @doc """
  Creates a Montgomery reduction function for the given modulus `n`.

  Montgomery reduction is a technique for efficiently computing modular arithmetic
  operations. This function returns a closure that can perform Montgomery reduction
  on values.

  ## Parameters

    * `n` - The modulus (must be odd)
    * `r_bits` - The number of bits for the Montgomery radix (default: 256)

  ## Returns

  A function that takes a value `t` and returns the Montgomery reduction of `t` modulo `n`.

  ## Examples

      iex> reducer = MontgomeryReduction.of(17)
      iex> reducer.(100)
      15

      iex> reducer = MontgomeryReduction.of(23, 8)
      iex> reducer.(50)
      9

  ## Error Cases

  The function will raise a `ArithmeticError` if:

    * The modulus `n` is even (Montgomery reduction requires odd moduli)
    * The input value `t` is greater than or equal to $n 2^{r_{bits}}$

  ## Mathematical Background

  Montgomery reduction computes $tR^{-1} \\mod n$ where:
  - $R = 2^{r\\_bits}$ is the Montgomery radix
  - $R^{-1}$ is the modular multiplicative inverse of R modulo n

  This is useful for efficient modular arithmetic, especially in cryptographic applications.
  """
  @spec of(non_neg_integer(), non_neg_integer()) :: (non_neg_integer() -> non_neg_integer())
  def of(n, r_bits \\ 256)

  def of(n, _) when Bitwise.band(n, 1) == 0 do
    raise ArithmeticError, "MontgomeryReduction.of(#{n}) should be odd number."
  end

  def of(n, r_bits) do
    r = Bitwise.bsl(1, r_bits)
    rm = r - 1
    n_prime = Bitwise.band(-ModularInverse.of(n, r), rm)

    fn
      t when t < Bitwise.bsl(n, r_bits) ->
        m = (Bitwise.band(t, rm) * n_prime) |> Bitwise.band(rm)

        case (t + m * n) |> Bitwise.bsr(r_bits) do
          t when t >= n -> t - n
          t -> t
        end

      t ->
        raise ArithmeticError, "MontgomeryReduction #{t} should be less than #{n} * 2^#{r_bits}."
    end
  end
end
