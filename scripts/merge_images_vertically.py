from PIL import Image
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4

def create_pdf_reportlab(image_path, pdf_path):
    # Create a PDF with reportlab
    c = canvas.Canvas(pdf_path, pagesize=A4)

    # Open the image file
    img = Image.open(image_path)

    # Get dimensions
    width, height = img.size

    # Calculate image scaling to fit A4 size without changing aspect ratio
    aspect = width / float(height)
    a4_width, a4_height = A4
    if aspect > 1:
        img_width = a4_width
        img_height = a4_width / aspect
    else:
        img_height = a4_height
        img_width = a4_height * aspect

    # Draw image on the PDF
    c.drawImage(image_path, 0, a4_height - img_height, width=img_width, height=img_height)

    # Finalize the PDF
    c.save()
    print(f"PDF file created: {pdf_path}")

def main():
    image1_path = '/home/ak/Desktop/desktop/202412__/IMG_1824.JPG'
    # image2_path = '/home/ak/Desktop/desktop/202412__/IMG_1825.JPG'

    # image1_path = 'merged_image.jpg'  # Ensure this is a JPEG file
    pdf_output_path = 'output.pdf'

    create_pdf_reportlab(image1_path, pdf_output_path)

if __name__ == "__main__":
    main()