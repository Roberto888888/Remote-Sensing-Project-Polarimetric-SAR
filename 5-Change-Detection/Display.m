function [ ] = Display( C, name )
    RI = imref2d([1024 1024]);
    figure()
    imshow(C, RI)
    title(name)
end

