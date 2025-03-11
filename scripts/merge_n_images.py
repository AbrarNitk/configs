from PIL import Image
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4


def convert_to_black_and_white(image_path):
    # Open the image
    image = Image.open(image_path)

    # Convert to black and white
    return image.convert('L')


def create_pdf_reportlab(image_paths, pdf_path):
    # Create a PDF with reportlab
    c = canvas.Canvas(pdf_path, pagesize=A4)

    for image_path in image_paths:
        # Convert image to black and white
        bw_image = convert_to_black_and_white(image_path)

        # Save it temporarily in memory
        bw_image.save("temp_bw.jpg")

        # Get dimensions
        width, height = bw_image.size

        # Calculate image scaling to fit A4 size without changing aspect ratio
        aspect = width / float(height)
        a4_width, a4_height = A4
        if aspect > 1:
            img_width = a4_width
            img_height = a4_width / aspect
        else:
            img_height = a4_height
            img_width = a4_height * aspect

        # Draw image on the PDF (on a new page)
        c.drawImage("temp_bw.jpg", 0, a4_height - img_height, width=img_width, height=img_height)
        c.showPage()  # End the current page and start a new one

    # Finalize the PDF
    c.save()
    print(f"PDF file created: {pdf_path}")


def main():
    image_paths = [
        '/home/ak/Desktop/desktop/202412__/IMG_1824.JPG',
        '/home/ak/Desktop/desktop/202412__/IMG_1825.JPG',
        # Add more image paths as needed
    ]
    pdf_output_path = 'output.pdf'

    # Create PDF from images
    create_pdf_reportlab(image_paths, pdf_output_path)


if __name__ == "__main__":
    main()