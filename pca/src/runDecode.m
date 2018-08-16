load Im
[c, s] = imagePCA(Im, 4);
C = encode(Im, c);
J = decode(C, c);