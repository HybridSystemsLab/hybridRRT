function [odeFcn,thresholdNonNegative] = odenonnegative(ode,y0,threshold,idxNonNegative)  
%ODENONNEGATIVE  Helper function for handling nonnegative solution constraints
%   Modify the derivative function to prevent the solution from crossing zero.
%
%   See also ODE113, ODE15S, ODE23, ODE23T, ODE23TB, ODE45.

%   Jacek Kierzenka
%   Copyright 1984-2020 The MathWorks, Inc.

neq = numel(y0);
if any( (idxNonNegative < 1) | (idxNonNegative > neq) )
  error(message('MATLAB:odenonnegative:NonNegativeIndicesInvalid'));
end
if any(y0(idxNonNegative) < 0)
  error(message('MATLAB:odenonnegative:NonNegativeViolatedAtT0'));
end  
if length(threshold) == 1
  thresholdNonNegative = threshold(ones(size(idxNonNegative)));
else
  thresholdNonNegative = threshold(idxNonNegative);
end
thresholdNonNegative = thresholdNonNegative(:);
odeFcn = @local_odeFcn_nonnegative;   

% -----------------------------------------------------------
% Nested function: ODE with nonnegativity constraints imposed
%
  function yp = local_odeFcn_nonnegative(t,y,varargin)
    yp = feval(ode,t,y,varargin{:}); 
    ndx = idxNonNegative( find(y(idxNonNegative) <= 0) ); %#ok<FNDSB>
    yp(ndx) = max(yp(ndx),0);
  end  % local_odeFcn_nonnegative
% -----------------------------------------------------------

end  % odenonnegative

