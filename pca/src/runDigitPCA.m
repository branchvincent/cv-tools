data = readMNISTData('data');
k = 15;

[~, sAll] = imagePCA(data.image, 4);
pAll = variancePercentage(sAll);

[code, p] = digitPCA(data, k);
showP(pAll, p)
saveas(gcf, 'tex/graphics/3e-dpca.png');