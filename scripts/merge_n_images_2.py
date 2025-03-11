from PIL import Image
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4

def create_pdf_from_images(image_paths, pdf_path):
    c = canvas.Canvas(pdf_path, pagesize=A4)

    for image_path in image_paths:
        # Open the image as RGB
        img = Image.open(image_path).convert('RGB')

        # Save as a temporary JPEG to ensure compatibility with correct colors
        temp_image_path = 'temp_corrected.jpg'
        img.save(temp_path := "temp_corrected.jpg", format='JPEG')

        # Adjusting size to fit A4 page preserving aspect ratio
        width, height = img.size
        aspect = width / float(height)

        # A4 size
        a4_width, a4_height = A4

        # Reportlab uses points (1/72 inch), Pillow uses pixels, we need to convert the scale
        # Assuming standard 72 DPI for Pillow images (if high DPI, you may need scaling)
        if aspect > (a4_width / a4_height):
            # Image is wider relative to page
            img_width = a4_width
            img_height = a4_width / aspect
        else:
            img_height = a4_height
            img_width = img_height * aspect

        # insert image at top-left corner (adjust y position accordingly)
        c.drawImage(image_path, 0, a4_height - img_height, width=img_width, height=img_height)

        c.showPage()  # Proceed to next page

    c.save()
    print(f"PDF file created: {pdf_path}")

def main():
    image_paths = [
        '/home/ak/Desktop/desktop/Docs/ak-docs/IMG_E2154.JPG',
        '/home/ak/Desktop/desktop/Docs/ak-docs/IMG_E2154.JPG',
        ]  # Replace these with your image paths
    output_pdf_path = 'output.pdf'
    create_pdf_from_images(image_paths, output_pdf_path)
    print("Done.")


if __name__ == "__main__":
    main()