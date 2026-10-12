<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./logo/kode-th-mark-light.svg">
  <img src="./logo/kode-th-mark.svg" alt="kode-th" width="96" height="96">
</picture>

# kode-th brand

Logo files for the kode-th organization and its products.

## Files

- `logo/kode-th-avatar.svg`, `logo/kode-th-avatar-512.png`: GitHub organization avatar. It is a plain square, because GitHub rounds the corners.
- `logo/kode-th-icon.svg`, `logo/kode-th-icon-1024.png`: app icon with rounded corners.
- `logo/kode-th-mark.svg`: mark for light backgrounds.
- `logo/kode-th-mark-light.svg`: mark for dark backgrounds.
- `logo/kode-th-mono.svg`: one-color mark.
- `logo/favicon.svg`, `logo/favicon-16.png`, `logo/favicon-32.png`, `logo/apple-touch-icon.png`: website icons, with a thicker stroke and a bigger dot so they stay readable at 16px.

## Colors

- Black `#0B0B0C`: tile background, mark on light backgrounds
- White `#F5F5F0`: mark on dark backgrounds
- Orange `#FF5A1F`: the dot only

## Usage

To show the logo in a README that follows the GitHub light and dark themes:

```html
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="logo/kode-th-mark-light.svg">
  <img src="logo/kode-th-mark.svg" alt="kode-th" width="96" height="96">
</picture>
```

## Build

`scripts/build-logo.sh` writes every file in `logo/`. To change a color, a stroke width, or the shape, edit the script and run it:

```bash
bash scripts/build-logo.sh
```

The script exports the PNG files with headless Chromium. By default it uses the Playwright copy in `~/.cache/ms-playwright`. To use a different browser, set `CHROME` to its path.

## License

The logo is not open source. All rights are reserved. Do not use the kode.th name or logo in a way that suggests your work comes from kode.th or is approved by kode.th, unless you have written permission. You can show the unchanged logo to refer to kode.th or its products.

The scripts in `scripts/` use the MIT License. See [LICENSE](./LICENSE) for both licenses.

Copyright © 2026 Pongsakorn Thipayanate
