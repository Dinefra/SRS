function modelRotated = applyRotation3xN(model,centerRotation,matrixRotation)

% applyRotation3xN apply a rotation matrix to a model, taking a center of
% rotation named centerRotation
% Input:
%    - model: original model to be rotated (3xN)
%    - centerRotation: center of rotation (3x1)
%    - matrixRotation: matrix of rotation (3x3)

modelRotated = matrixRotation*(model-repmat(centerRotation,size(model,1),1));
modelRotated = modelRotated + repmat(centerRotation,size(model,1),1);
end