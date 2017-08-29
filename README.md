# Misc.Random

This is a very thin wrapper around Erlang's `rand:uniform/1` function. It allows
you to create random strings or numbers.

Typical usages of this module is to generate random temporary file names, validation codes and stuff like that.

## Installation

Install from GitHub by adding `misc_random` to your list of dependencies in `mix.exs`

```elixir
def deps do
  [
    {:misc_random, github: "indyone/misc_random"}
  ]
end
```

## Usage

**Provided functions**

- `Misc.Random.string/0` - returns a random string with *8* characters which can be any of the a-z, A-Z & 0-9.
- `Misc.Random.string/1` - returns a random string with `length` characters which can be any of the a-z, A-Z & 0-9.
- `Misc.Random.string/2` - returns a random string with `length` characters which can be any of the ones of the string `characters`.
- `Misc.Random.number/0` - returns a random number with *8* digits.
- `Misc.Random.number/1` - returns a random number with `length` digits.

**Examples**

```elixir
# Generate a string with 10 random characters
Misc.Random.string(10)

# Generate a string with 8 random characters which can be any of the "A", "B", or "C".
Misc.Random.string("ABC", 8)

# Generate a number with 10 digits
Misc.Random.number(10)
```

## Notes

This is an fork of the [elixir-helper-random](https://github.com/gutschilla/elixir-helper-random) project.  
It is *almost* a complete re-write, can be used in-place (in most cases) and has the following changes:

- Works with latest Elixir (> v1.4) & Erlang (> v19) __*__.
- Use Erlang's `:rand.uniform/1` function. This function by default uses the `exrop`
algorithm which is not a secure PRNG, so for security stuff you may need to seed
before using something like `crypto:rand_seed/0`.
- Added documentation generated with `ex_doc` and static code analysis report with `credo` & `dialyzer`.
- Added `Misc.Random.string/2` which allows custom characters to be used instead of the default one (a-z, A-Z & 0-9).
- Fixed issue with `Misc.Random.number/1` which may return number shorter than `length`.
- Removed compiler warnings.
- Removed functions `Misc.Random.seed_random/0`, `Misc.Random.get_string/1` and `Misc.Random.get_number/1` as it seemed the usage was private __*__.
- Few code optimizations.

_ __*__ This change may break compatibility with original project. _

## LICENSE

MIT
