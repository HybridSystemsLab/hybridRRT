function o = odeget(options,name,default,flag)
%ODEGET Get ODE OPTIONS parameters.
%   VAL = ODEGET(OPTIONS,'NAME') extracts the value of the named property
%   from integrator options structure OPTIONS, returning an empty matrix if
%   the property value is not specified in OPTIONS. It is sufficient to type
%   only the leading characters that uniquely identify the property. Case is
%   ignored for property names. [] is a valid OPTIONS argument.
%   
%   VAL = ODEGET(OPTIONS,'NAME',DEFAULT) extracts the named property as
%   above, but returns VAL = DEFAULT if the named property is not specified
%   in OPTIONS. For example
%   
%       val = odeget(opts,'RelTol',1e-4);
%   
%   returns val = 1e-4 if the RelTol property is not specified in opts.
%   
%   See also ODESET, ODE45, ODE23, ODE113, ODE15S, ODE23S, ODE23T, ODE23TB.

%   Mark W. Reichelt and Lawrence F. Shampine, 3/1/94
%   Copyright 1984-2020 The MathWorks, Inc.

% undocumented usage for fast access with no error checking
if (nargin == 4) && isequal(char(flag),'fast')
   o = getknownfield(options,name,default);
   return
end

if nargin < 2
  error(message('MATLAB:odeget:NotEnoughInputs'));
end
if nargin < 3
  default = [];
end
if ~isempty(options) && ~isa(options,'struct')
  error(message('MATLAB:odeget:Arg1NotODESETstruct'));
end

if isempty(options)
  o = default;
  return;
end

Names = [
    "AbsTol"
    "BDF"
    "Events"
    "InitialStep"
    "Jacobian"
    "JConstant"
    "JPattern"
    "Mass"
    "MassSingular"
    "MaxOrder"
    "MaxStep"
    "NonNegative"  
    "NormControl"
    "OutputFcn"
    "OutputSel"
    "Refine"
    "RelTol"
    "Stats"
    "Vectorized"
    "MStateDependence"
    "MvPattern"
    "InitialSlope"    
    ];

j = startsWith(Names,name,'IgnoreCase',true);
if ~any(j)               % if no matches
  error(message('MATLAB:odeget:InvalidPropName', name));
elseif sum(j) > 1            % if more than one match
  % Check for any exact matches (in case any names are subsets of others)
  k = strcmpi(Names,name);
  if sum(k) == 1
    j = k;
  else
    matches = join(Names(j),', ');
    error(message('MATLAB:odeget:AmbiguousPropName',name,matches));
  end
end

if any(strcmp(fieldnames(options),Names(j)))
  o = options.(Names(j));
  if isempty(o)
    o = default;
  end
else
  o = default;
end

% --------------------------------------------------------------------------
function v = getknownfield(s, f, d)
%GETKNOWNFIELD  Get field f from struct s, or else yield default d.

if isfield(s,f)   % s could be empty.
  v = s.(f);
  if isempty(v)
    v = d;
  end
else
  v = d;
end

