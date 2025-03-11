from PIL import Image
from fpdf import FPDF

def merge_images(image1_path, image2_path, output_path):
    # Open the images
    image1 = Image.open(image1_path)
    image2 = Image.open(image2_path)

    # Assume both images have the same height for simplicity; adjust as needed
    width1, height1 = image1.size
    width2, height2 = image2.size

    # Create a new image with combined width and the same height
    merged_image = Image.new('RGB', (width1 + width2, max(height1, height2)))

    # Paste the two images side by side
    merged_image.paste(image1, (0, 0))
    merged_image.paste(image2, (width1, 0))

    # Save the merged image
    merged_image.save(output_path)
    print(f"Merged image saved as {output_path}")
    return output_path

def create_pdf_from_image(image_path, pdf_path):
    # Initialize FPDF instance
    pdf = FPDF(orientation='L', unit='mm', format='A4')  # 'L' for landscape mode
    pdf.add_page()

    # Add the image to the PDF
    pdf.image(image_path, x=0, y=0, w=pdf.w, h=pdf.h)  # Adjust x, y, w, h as needed

    # Output the PDF
    pdf.output(pdf_path)
    print(f"PDF file created: {pdf_path}")

def main():
    # Paths for the input images and the output files
    image1_path = '/home/ak/Desktop/desktop/202412__/IMG_1824.JPG'
    image2_path = '/home/ak/Desktop/desktop/202412__/IMG_1825.JPG'
    merged_image_path = 'merged_image.jpg'
    pdf_output_path = 'output.pdf'

    # Merge images and create PDF
    merged_image_file = merge_images(image1_path, image2_path, merged_image_path)
    create_pdf_from_image(merged_image_file, pdf_output_path)

if __name__ == "__main__":
    main()