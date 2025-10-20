import sys
import os
from pathlib import Path
import converter

def validate_input_file(input_path, expected_extensions):
    """Validate input file exists and has correct extension"""
    input_file = Path(input_path)
    
    if not input_file.exists():
        print(f"Error: File '{input_path}' does not exist")
        return False
    
    if input_file.suffix.lower() not in expected_extensions:
        print(f"Error: File must be one of {expected_extensions}")
        return False
    
    return True

def main():
    if len(sys.argv) < 3:
        print("Usage: background_launcher.exe <file_path> <conversion_type>")
        return

    input_path = sys.argv[1]
    conversion_type = sys.argv[2].lower().strip()
    input_file = Path(input_path)
    folder = input_file.parent

    # Define conversion mappings with validation
    conversion_map = {
        "pdf2text": {
            "function": converter.pdf_to_text,
            "input_ext": [".pdf"],
            "output_ext": ".txt"
        },
        "text2pdf": {
            "function": converter.text_to_pdf,
            "input_ext": [".txt", ".text"],
            "output_ext": ".pdf"
        },
        "image2pdf": {
            "function": converter.image_to_pdf,
            "input_ext": [".jpg", ".jpeg", ".png", ".bmp", ".gif", ".tiff"],
            "output_ext": ".pdf"
        },
        "pdf2docx": {
            "function": converter.pdf_to_docx,
            "input_ext": [".pdf"],
            "output_ext": ".docx"
        },
        "docx2pdf": {
            "function": converter.docx_to_pdf,
            "input_ext": [".docx"],
            "output_ext": ".pdf"
        },
        "docx2text": {
            "function": converter.docx_to_text,
            "input_ext": [".docx"],
            "output_ext": ".txt"
        },
        "text2docx": {
            "function": converter.text_to_docx,
            "input_ext": [".txt", ".text"],
            "output_ext": ".docx"
        },
        "pptx2text": {
            "function": converter.pptx_to_text,
            "input_ext": [".pptx"],
            "output_ext": ".txt"
        },
        "text2pptx": {
            "function": converter.text_to_pptx,
            "input_ext": [".txt", ".text"],
            "output_ext": ".pptx"
        }
    }

    if conversion_type not in conversion_map:
        print(f"Error: Unknown conversion type '{conversion_type}'")
        print(f"Available types: {list(conversion_map.keys())}")
        return

    config = conversion_map[conversion_type]
    
    # Validate input file
    if not validate_input_file(input_path, config["input_ext"]):
        return

    # Create output filename
    output_file = folder / (input_file.stem + "_converted" + config["output_ext"])

    print(f"Converting: {input_path}")
    print(f"Output: {output_file}")

    success = False
    try:
        success = config["function"](input_path, str(output_file))
    except Exception as e:
        print(f"Conversion error: {e}")
        success = False

    if success:
        print(f"✅ Conversion successful!")
        print(f"✅ Output file: {output_file}")
    else:
        print(f"❌ Conversion failed!")

if __name__ == "__main__":
    main()