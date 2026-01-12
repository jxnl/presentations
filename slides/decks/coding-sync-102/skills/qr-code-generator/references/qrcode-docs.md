# QR Code Generator Reference

## Installation
```bash
pip install qrcode[pil] typer
```

## Usage
```bash
python scripts/generate_qr.py <url> [OPTIONS]
```

## Command-Line Flags

### Required
- `<url>` - URL or text to encode in QR code

### Optional Flags
- `-o, --output PATH` - Output file path (default: `assets/qr-codes/qr.png`)
- `-s, --size SIZE` - Image size in pixels (default: 200)
- `-e, --error-correction LEVEL` - Error correction level (default: M)
  - `L`: Low (~7% error correction) - Smallest QR codes
  - `M`: Medium (~15% error correction) - Recommended for most use cases
  - `Q`: Quartile (~25% error correction) - Better damage tolerance
  - `H`: High (~30% error correction) - Maximum damage tolerance, largest codes
- `-f, --fill-color COLOR` - QR code fill color (default: black)
- `-b, --back-color COLOR` - Background color (default: white)

## Examples
```bash
# Basic usage
python scripts/generate_qr.py https://example.com

# Custom output path and size
python scripts/generate_qr.py https://example.com -o qr.png -s 300

# High error correction for damaged codes
python scripts/generate_qr.py https://example.com -e H

# Custom colors
python scripts/generate_qr.py https://example.com -f blue -b white
```

## Best Practices
- Use medium error correction (`-e M`) for most use cases
- Test QR codes at intended display size
- Ensure sufficient contrast between code and background
- Higher error correction = larger QR codes but better damage tolerance
