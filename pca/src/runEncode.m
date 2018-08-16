load Im
% [c, s] = imagePCA(Im(:,:,1:2), 4);
[c, s] = imagePCA(Im, 4);
C = encode(Im, c);