% Define parameters 
data = readMNISTData('data');
% dest = 'tex/graphics/im%d.png';
dest = fullfile(pwd, 'tex', 'graphics', '3f-img%d%s.png');
k = 15;

digit = 0:9;
M = length(digit);
N = 3;
[r,c,n] = size(data.image);

rng(0);

% PCA
k = 40;
[codeAll, sAll] = imagePCA(data.image, k);
[code, p] = digitPCA(data, k);
images = cell(M, N);

% Choose image for each d
for d=1:M
    imgs = data.image(:, :, data.label == digit(d));
    Id = datasample(imgs, 1, 3);
    % Using imagePCA
    Call = encode(Id, codeAll);
    Jall = decode(Call, codeAll);
    % Using digitPCA
    C = encode(Id, code{d});
    J = decode(C, code{d});
    % Save
    imwrite(Id, sprintf(dest, d, ''));
    imwrite(Jall, sprintf(dest, d, 'a'));
    imwrite(J, sprintf(dest, d, 'd'));
%     subplot(M, N, 3*(d-1) + 1), imshow(Id);
%     subplot(M, N, 3*(d-1) + 2), imshow(Jall);
%     subplot(M, N, 3*d), imshow(J);
end

% saveas(gcf, 'tex/graphics/3f-images.png');