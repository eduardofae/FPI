function out = bicubic_resize_RGB(img, p, q)
       R = img(:, :, 1);
      G = img(:, :, 2);
      B = img(:, :, 3);

      out_R = bicubic_resize(R, p, q);
      out_G = bicubic_resize(G, p, q);
      out_B = bicubic_resize(B, p, q);
    
    out = cat(3, out_R, out_G, out_B);

end