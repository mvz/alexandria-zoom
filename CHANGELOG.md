# Changelog

## 0.6.1 / 2025-03-21

* Support Ruby 3.1 through 3.4 ([#6] and [#8] by [mvz])
* Update pkg-config to version 1.6.0 ([#9] by [mvz])
* Replace deprecated license code in the gemspec ([#10] by [mvz])

[#6]: https://github.com/mvz/alexandria-zoom/pull/6
[#8]: https://github.com/mvz/alexandria-zoom/pull/8
[#9]: https://github.com/mvz/alexandria-zoom/pull/9
[#10]: https://github.com/mvz/alexandria-zoom/pull/10

## 0.6.0 / 2023-04-28

* Use pkg-config instead of yaz-config to get compiler and linker flags for YAZ
  ([e5749f54] by [mvz])
* Update gem infrastructure ([75bb5736] by [mvz])
* Create forked gem 'alexandria-zoom' ([#1] by [mvz])
* Support Ruby 2.7 through 3.2 ([#1] by [mvz])
* Use rake-compiler to compile extension ([#3] by [mvz])
* Silence warnings regarding allocator functions for `T_DATA` classes on Ruby 3.2
  ([#4] by [mvz])

[mvz]: https://github.com/mvz

[e5749f54]: https://github.com/mvz/alexandria-zoom/commit/e5749f54df0761555692d11ba81515278fb139d6
[75bb5736]: https://github.com/mvz/alexandria-zoom/commit/75bb573633f16c35cd2ea31607d3813aa41efcc3
[#1]: https://github.com/mvz/alexandria-zoom/pull/1
[#3]: https://github.com/mvz/alexandria-zoom/pull/3
[#4]: https://github.com/mvz/alexandria-zoom/pull/4

Note: For the changelog of the original 'zoom' gem, see ChangeLog.old
