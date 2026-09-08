# GstarCAD Object Snap Tools

Switch running object snap modes with one command and toggle osnap off and back on without losing your settings.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Snapping to the wrong reference point is the classic source of sloppy geometry. These commands set the running object snap to the mode you actually need, endpoint only, midpoint plus endpoint, intersections, everything, or nothing, and let you toggle osnap off and back on without losing your previous mode.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/osnap-presets.lsp` | ;; osnap-presets.lsp - Running object snap presets
;; Commands: OSEND / OSMID / OSINT / OSALL / OSNONE
;; Usage: APPLOAD -> run the preset you need before picking
(defun c:OSEND ( )
  (setvar "OSMODE" 1)
  (princ "\nOsnap: ENDpoint only.")
  (princ)
)
(defun c:OSMID ( )
  (setvar "OSMODE" 3)
  (princ "\nOsnap: ENDpoint + MIDpoint.")
  (princ)
)
(defun c:OSINT ( )
  (setvar "OSMODE" 33)
  (princ "\nOsnap: ENDpoint + INTersection.")
  (princ)
)
(defun c:OSALL ( )
  (setvar "OSMODE" 767)
  (princ "\nOsnap: all running modes.")
  (princ)
)
(defun c:OSNONE ( )
  (setvar "OSMODE" 0)
  (princ "\nOsnap: off.")
  (princ)
)
 |
| `scripts/osnap-toggle.lsp` | ;; osnap-toggle.lsp - Toggle running object snap on and off
;; Command: OSTG
(defvar *ostg-prev* 0)
(defun c:OSTG ( / cur )
  (setq cur (getvar "OSMODE"))
  (if (= cur 0)
    (progn
      (setvar "OSMODE" *ostg-prev*)
      (princ (strcat "\nOsnap restored (mode " (itoa *ostg-prev*) ")."))
    )
    (progn
      (setq *ostg-prev* cur)
      (setvar "OSMODE" 0)
      (princ "\nOsnap off. Run OSTG again to restore.")
    )
  )
  (princ)
)
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
