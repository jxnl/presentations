---
name: qr-code-generator
description: Generate QR codes for blog posts, presentations, and resources. Use when user requests QR codes or needs to share links visually.
---

# QR Code Generator Skill

Generate QR codes for blog posts, presentations, and resources.

## Usage

When user requests a QR code, generate it using the qrcode library with these preferences:
- Size: 200x200 pixels
- Error correction: Medium
- Format: PNG
- Save to: `assets/qr-codes/`

## Examples

- Blog post URLs
- Presentation slide links
- Resource pages
