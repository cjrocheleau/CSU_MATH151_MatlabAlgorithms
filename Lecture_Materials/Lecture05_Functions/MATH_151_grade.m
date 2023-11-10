%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATH_151_grade.m
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 8/22/2023
%--------------------------------------------------------------------------
% This function will be used to compute a student's grade in the Fall 2023
% semester of MATH 151 - Mathematical Algorithms in Matlab.
%--------------------------------------------------------------------------
% INPUTS
%       journal_grade: Vector containing score (out of 100) for students
%           on journal assignments
%       lab_grade: Vector containing score (out of 100) for students
%           on lab assignments
%       final_grade: Vector containing score (out of 100) for students
%           on final lab assignment
%--------------------------------------------------------------------------
% OUTPUTS
%       number_grade: Vector the same size as the input scores. Represents
%           the numerical grade out of 100 for student based on input scores 
%       letter_grade: (Optional) Cell array the same size as input scores.
%           Outputs letter grade equivalent of number_grade. 
%--------------------------------------------------------------------------
% REVISION HISTORY
% 8/22/23: C Rocheleau, Original Version
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [number_grade, letter_grade] = MATH_151_grade(journal_grade, lab_grade, final_grade)

% It is usually good practice to do some exception handling, in this case
% we want to make sure our inputs are the same size
if length(journal_grade) ~= length(lab_grade) || length(journal_grade) ~= length(final_grade)
    beep; disp('Grade Vectors not same size!');
    number_grade = [];      % This creates an empty matrix/vector
    letter_grade = {};      % This creates an empty cell array
    return;
end

% Lets preallocate our vector and cell array (vector of strings or whatever)
number_grade = zeros(size(journal_grade));
letter_grade = cell(size(journal_grade));

% Set up class grading scheme
journal_comp = 0.05;
lab_comp     = 0.80;
final_comp   = 0.15;

% Calculate Student grades using vectors!
number_grade = journal_comp*journal_grade + ...
               lab_comp*lab_grade         + ...
               final_comp*final_grade;

% Now let's cycle through the number grades and fill with letter grades
for iStudent = 1:length(number_grade)
    grade = number_grade(iStudent);
    % Trust me, there's a more efficient way to do this, but this is
    % demonstrative!
    if grade >= 93
        letter_grade{iStudent} = 'A'; % Curly brackets are used for cell arrays!
    elseif grade >= 90
        letter_grade{iStudent} = 'A-'; 
    elseif grade >= 86.67
        letter_grade{iStudent} = 'B+'; 
    elseif grade >= 83
        letter_grade{iStudent} = 'B'; 
    elseif grade >= 80 
        letter_grade{iStudent} = 'B-'; 
    elseif grade >= 76.67
        letter_grade{iStudent} = 'C+'; 
    elseif grade >= 70
        letter_grade{iStudent} = 'C';
    elseif grade > 60
        letter_grade{iStudent} = 'D';
    else
        letter_grade{iStudent} = 'F';
    end
end