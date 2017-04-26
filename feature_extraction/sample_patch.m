function resized_patch = sample_patch(im, pos, sample_sz, output_sz)

if nargin < 4
    output_sz = [];
end

%make sure the size is not to small
sample_sz = max(sample_sz, 2);

xs = floor(pos(2)) + (1:sample_sz(2)) - floor(sample_sz(2)/2);
ys = floor(pos(1)) + (1:sample_sz(1)) - floor(sample_sz(1)/2);

%check for out-of-bounds coordinates, and set them to the values at
%the borders
xs(xs < 1) = 1;
ys(ys < 1) = 1;
xs(xs > size(im,2)) = size(im,2);
ys(ys > size(im,1)) = size(im,1);

%extract image
im_patch = im(ys, xs, :);

if isempty(output_sz) || isequal(sample_sz(:), output_sz(:))
    resized_patch = im_patch;
else
    try
        resized_patch = mexResize(im_patch, output_sz, 'auto');
    catch
        warning('ECO:sample_patch', 'Error when using the mexResize function. Using Matlab''s interpolation function instead, which is slower.');
        resized_patch = imresize(im_patch, output_sz, 'bilinear', 'Antialiasing',false);
    end
end

end

