# Changelog

---
## [1.0.0-beta.1](https://github.com/AnimeNow-Team/AnimeNow/releases/tag/1.0.0-beta.1) - (2023-02-14)

### Bug Fixes
- Subtitles now persist on changes ([#65](https://github.com/AnimeNow-Team/AnimeNow/issues/65)) [`62e835e`](https://github.com/AnimeNow-Team/AnimeNow/commit/62e835e984c390f212d1194a052070ad0ccb8910)
- Fixes ui padding for macOS and iPadOS [`3c792fc`](https://github.com/AnimeNow-Team/AnimeNow/commit/3c792fc2ac01d65c824e2405710cf15fca97b069)

**AnimeDetailFeature**
- Episode sorting now persist properly [`1bcd06b`](https://github.com/AnimeNow-Team/AnimeNow/commit/1bcd06b7d54f80770653d21997cd2cc4cad8ad2d)

**SearchView**
- Remove duplicates and activate keyboard onappear ([#71](https://github.com/AnimeNow-Team/AnimeNow/issues/71)) [`b6136f8`](https://github.com/AnimeNow-Team/AnimeNow/commit/b6136f86dd48347b1a52f9ffa90b20151a0c8bd3)
- Fixes building textfield for macOS [`1e1ccd2`](https://github.com/AnimeNow-Team/AnimeNow/commit/1e1ccd2bb22c7b1f4bd5b16a37482f53625a4e6f)

**Build**
- Fixed app versioning when building [`ac2e8f9`](https://github.com/AnimeNow-Team/AnimeNow/commit/ac2e8f9a1ef8a0766b8d0b6ddd506908f494d9bb)

### Continuous Integration
- Update to latest image [`6701dbd`](https://github.com/AnimeNow-Team/AnimeNow/commit/6701dbd9c22f5b92381c0c997da049b5738e4e88)
- Improve ci testing structure [`87eec08`](https://github.com/AnimeNow-Team/AnimeNow/commit/87eec08a5db6fef03e51d3bca87ed105f9eac241)
- Use semantic versioning upon new builds [`20b756b`](https://github.com/AnimeNow-Team/AnimeNow/commit/20b756b5c445dbc004cd57b0b96dc3b3525ccf9e)
- Fixed linter error [`0cc890f`](https://github.com/AnimeNow-Team/AnimeNow/commit/0cc890fc993083a572cfe8897c4504e6db4a4431)

**Cd**
- Fixes workflow error [`e8fe4ba`](https://github.com/AnimeNow-Team/AnimeNow/commit/e8fe4ba2faed1bcf61f67c0b310efbe0e7e3c46f)

**Lint**
- Added swiftformat to linting ci [`b8b36a4`](https://github.com/AnimeNow-Team/AnimeNow/commit/b8b36a4765eb893f8424f0deacf4e2274ce7db54)

### Documentation
- Prepare CHANGELOG.md [`edf46f2`](https://github.com/AnimeNow-Team/AnimeNow/commit/edf46f2733d612b2d0bf4ccf726dbc90f5233b0d)

### Features

**AnimePlayerFeature**
- Double tap to seek forward/back now supported [`6916cf7`](https://github.com/AnimeNow-Team/AnimeNow/commit/6916cf7947f71d7d8f3e96e2885c4ac1a76ec651)

### Miscellaneous Tasks

**Build**
- Build version now updates [`77d7440`](https://github.com/AnimeNow-Team/AnimeNow/commit/77d7440757dc770a47cd8da697cd1bf72971f329)

### Performance
- Improves loading multiple images [`6de76a4`](https://github.com/AnimeNow-Team/AnimeNow/commit/6de76a4696d95078194ff7ec57c4be302cb2e25a)

**CacheAsyncImage**
- Using custom async image loading [`81ceaf3`](https://github.com/AnimeNow-Team/AnimeNow/commit/81ceaf3c16e664b348ba033d8ec78934f290921b)

**Cacheasyncimage**
- Now images are cached in memory and disk [`7cfa867`](https://github.com/AnimeNow-Team/AnimeNow/commit/7cfa867b3daff33eb6b5e5cf2408e74c4e214e0d)

### Refactor

**DS_Store**
- Remove unecessary DS_Store [`06c4675`](https://github.com/AnimeNow-Team/AnimeNow/commit/06c46754ea9638a0dda2e3f4d0eb1a9bd75a2b02)

### Styling
- Fixed most of swiftlint issues [`79e6d6f`](https://github.com/AnimeNow-Team/AnimeNow/commit/79e6d6ff0b5368779f2be6f67a7d13def9846554)
- Fix minor file not following syntax structure [`0ea2860`](https://github.com/AnimeNow-Team/AnimeNow/commit/0ea28607b915f6ffedcd1d3129deaf0fbdca658e)

**Swiftlint**
- Partially formats to swiftlint specs [`e9fee67`](https://github.com/AnimeNow-Team/AnimeNow/commit/e9fee678768ab39e9d0336970e9a06fb15214ced)

### Build
- Forces swiftlint builds and adds logs [`26fb07c`](https://github.com/AnimeNow-Team/AnimeNow/commit/26fb07cbbce2efb5f11e95f839f5a90a77301a02)
- Fix and improve semver builds [`98d2fcb`](https://github.com/AnimeNow-Team/AnimeNow/commit/98d2fcb8330261fa2955d8ba859529353e2a201c)
- Create changelog for releases [`606fb0a`](https://github.com/AnimeNow-Team/AnimeNow/commit/606fb0ac69a369ab4593f6ed9cfa2effd14245a6)

<!-- generated by git-cliff -->
