# Ruby JSON library comparison

## Сonclusion
Use `Oj` with `compact` ot `strict` mode depending on your preferences.
```ruby
Oj.default_options = { mode: :compat }
# or
Oj.default_options = { mode: :strict }

Oj.dump(data)
Oj.load(data)
```

## Don't use
```Oj.add_to_json``` - Encode objects as `object` mode, ruby segfault on exception encode

```Oj.mimic_JSON``` - SystemStackError on Complex and Rational encode

```Oj.optimize_rails``` - Can encode Number as String

## Benchmark
```
           OjCompact:      820.9 i/s
            OjObject:      803.8 i/s - 1.02x  slower
               OjWab:      788.6 i/s - 1.04x  slower
               OjAdd:      788.2 i/s - 1.04x  slower
            OjStrict:      785.3 i/s - 1.05x  slower
          OjMimicAdd:      779.3 i/s - 1.05x  slower
        JsonMimicAdd:      720.8 i/s - 1.14x  slower
           JsonMimic:      591.8 i/s - 1.39x  slower
             OjMimic:      551.5 i/s - 1.49x  slower
             OjRails:      467.0 i/s - 1.76x  slower
                Json:      384.7 i/s - 2.13x  slower
             JsonAdd:      378.1 i/s - 2.17x  slower
```

## Usage
run `run_all.sh` to generate encode / decode examples and benchmark

run `ruby compare.rb` to see benchmark results
