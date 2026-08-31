import cv2
import matplotlib.pyplot as plt
import os

def display_images(images, titles, rows, cols):
    """Utility function to display multiple images using matplotlib"""
    fig = plt.figure(figsize=(12, 8))
    for i in range(len(images)):
        fig.add_subplot(rows, cols, i + 1)
        # Convert BGR to RGB for correct matplotlib display if it's a color image
        if len(images[i].shape) == 3 and images[i].shape[2] == 3:
            img_display = cv2.cvtColor(images[i], cv2.COLOR_BGR2RGB)
        else:
            img_display = images[i]
            
        # Display grayscale properly
        if len(images[i].shape) == 2:
            plt.imshow(img_display, cmap='gray')
        else:
            plt.imshow(img_display)
            
        plt.title(titles[i])
        plt.axis('off')
    
    plt.tight_layout()
    plt.show()

def main():
    # 1. Load the original image
    # Note: OpenCV loads images in BGR format by default, not RGB!
    img_path = os.path.join(os.path.dirname(__file__), '..', 'assets', 'sample.jpg')
    img_bgr = cv2.imread(img_path)
    
    if img_bgr is None:
        print(f"Error: Image not found at {img_path}")
        return

    # 2. Convert to various color spaces
    # RGB
    img_rgb = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2RGB)
    
    # Grayscale
    img_gray = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2GRAY)
    
    # HSV (Hue, Saturation, Value)
    img_hsv = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2HSV)
    
    # CIELAB (L*a*b*)
    img_lab = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2LAB)

    # 3. Visualize the results
    images = [img_bgr, img_rgb, img_gray, img_hsv, img_lab]
    titles = ['Original (BGR)', 'RGB', 'Grayscale', 'HSV', 'CIELAB (L*a*b*)']
    
    print("Displaying color space conversions...")
    print("Close the image window to exit the program.")
    display_images(images, titles, 2, 3)

if __name__ == "__main__":
    main()
