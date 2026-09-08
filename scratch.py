import cv2
import numpy as np

for path in ['assets/banana_unripe.jpg', 'assets/banana_ripe.jpg', 'assets/banana_overripe.jpg']:
    img = cv2.imread(path)
    
    lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)
    l, a, b = cv2.split(lab)
    
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    h, s, v = cv2.split(hsv)
    
    # Bucket 1: Green (from LAB)
    _, green_mask = cv2.threshold(a, 120, 255, cv2.THRESH_BINARY_INV)
    
    # Bucket 2: Yellow (from HSV)
    # Hue 15-40, Saturation > 80, L > 80 (not dark)
    lower_yellow = np.array([15, 80, 80])
    upper_yellow = np.array([40, 255, 255])
    yellow_mask_hsv = cv2.inRange(hsv, lower_yellow, upper_yellow)
    
    # Bucket 3: Dark spots (from LAB)
    _, dark_mask = cv2.threshold(l, 80, 255, cv2.THRESH_BINARY_INV)
    
    # Combine to find the "Total Banana Pixels" detected across all 3 buckets
    total_banana_mask = cv2.bitwise_or(green_mask, yellow_mask_hsv)
    total_banana_mask = cv2.bitwise_or(total_banana_mask, dark_mask)
    
    # We apply convex hull to connect them together
    contours, _ = cv2.findContours(total_banana_mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    hull_mask = np.zeros_like(total_banana_mask)
    if contours:
        c = max(contours, key=cv2.contourArea)
        cv2.drawContours(hull_mask, [cv2.convexHull(c)], -1, 255, -1)
        
    tot = cv2.countNonZero(hull_mask)
    
    g_cnt = cv2.countNonZero(cv2.bitwise_and(green_mask, hull_mask))
    y_cnt = cv2.countNonZero(cv2.bitwise_and(yellow_mask_hsv, hull_mask))
    d_cnt = cv2.countNonZero(cv2.bitwise_and(dark_mask, hull_mask))
    
    print(f"--- {path} ---")
    print(f"Tot: {tot}, Green: {g_cnt/tot*100:.1f}%, Yellow: {y_cnt/tot*100:.1f}%, Dark: {d_cnt/tot*100:.1f}%")

