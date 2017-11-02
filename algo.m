function x=algo(a)
   I=imread(a);
   I2=rgb2gray(I);
   
   I3=imnoise(I2,'salt & pepper',0.01);
   
   imtool(I3,[])
   disp 'SNR with noisy image and original image'
   peaksnr = psnr(I3,I2)
   imwrite(I3,'noisyimage.jpg');
   
   I4= nlfilter(I3,[5 5],@roughset);
   imtool(I4,[])
   imwrite(I4,'roughset_denoise.jpg');
   disp 'SNR with denoised image and original image'
   peaksnr = psnr(I4,I2)
   
   I5=colfilt(I3,[5 5],'sliding',@mean);   
    disp 'SNR with denoised image using mean and original image'
    I5=uint8(I5);
    imtool(I5,[])
    peaksnr = psnr(I5,I2)
    imwrite(I5,'mean_denoise.jpg');
     
    I6=colfilt(I3,[5 5],'sliding',@median);    
    disp 'SNR with denoised image using median and original image'
    I6=uint8(I6);
    imtool(I6,[])
    peaksnr = psnr(I6,I2)
     imwrite(I6,'median_denoise.jpg');
     
    I7=colfilt(I3,[5 5],'sliding',@mode);    
    disp 'SNR with denoised image using mode and original image'
    I7=uint8(I7);
    imtool(I7,[])
    peaksnr = psnr(I7,I2)
     imwrite(I7,'mode_denoise.jpg');
    x='Complete'
    