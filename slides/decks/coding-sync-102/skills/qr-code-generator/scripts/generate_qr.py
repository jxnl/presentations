#!/usr/bin/env python3
"""Generate QR code with preferred settings."""

import qrcode
import typer
from pathlib import Path
from typing import Literal

app = typer.Typer()

@app.command()
def generate(
    url: str = typer.Argument(..., help="URL or text to encode in QR code"),
    output: str = typer.Option("assets/qr-codes/qr.png", "-o", "--output", help="Output file path"),
    size: int = typer.Option(200, "-s", "--size", help="Image size in pixels (default: 200)"),
    error_correction: Literal["L", "M", "Q", "H"] = typer.Option("M", "-e", "--error-correction", help="Error correction level: L (low), M (medium), Q (quartile), H (high)"),
    fill_color: str = typer.Option("black", "-f", "--fill-color", help="QR code fill color (default: black)"),
    back_color: str = typer.Option("white", "-b", "--back-color", help="Background color (default: white)"),
):
    """Generate QR code with preferred settings."""
    error_map = {
        "L": qrcode.constants.ERROR_CORRECT_L,
        "M": qrcode.constants.ERROR_CORRECT_M,
        "Q": qrcode.constants.ERROR_CORRECT_Q,
        "H": qrcode.constants.ERROR_CORRECT_H,
    }
    
    qr = qrcode.QRCode(
        version=1,
        error_correction=error_map[error_correction],
        box_size=10,
        border=4,
    )
    qr.add_data(url)
    qr.make(fit=True)
    
    img = qr.make_image(fill_color=fill_color, back_color=back_color)
    img = img.resize((size, size))
    
    Path(output).parent.mkdir(parents=True, exist_ok=True)
    img.save(output)
    typer.echo(f"QR code saved to: {output}")
    return output

if __name__ == "__main__":
    app()
