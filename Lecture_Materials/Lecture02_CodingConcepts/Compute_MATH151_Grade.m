%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute_MATH151_Grade.m
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 8/5/2023
%--------------------------------------------------------------------------
% This script can be used to calculate a grade for the Fall 2023 semester
% MATH-151 course. But it is also intended to be used as a quick demo into
% how Matlab works and some processing concepts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% I usually start scripts with this, it basically wipes Matlab clean
% close plot windows; forget all variables in memory; clear the command window;
close all; clear all; clc;

% Grading Scheme. Also note, I like to align = signs for readability
journal_pct = 0.05;
lab_pct     = 0.80;
final_pct   = 0.15;

% Student Grades
journal_score = 94;
lab_score     = 86;
final_score   = 100;

% Calculate the student's total grade
grade = journal_score*journal_pct + lab_score*lab_pct + final_score*final_pct;
display(grade)

% Oh! My lab grading was a bit hard. Lets apply a curve!
lab_score = lab_score + 5;

% When statements get long we can use ... to split it to multiple lines
scaled_grade = journal_score*journal_pct + ...
               lab_score*lab_pct +         ...
               final_score*final_pct;
display(scaled_grade)

% Finally, remember all variable named are case sensitive
journal_grade = Journal_score*journal_pct; % This will give an error message because J is capitalized

% Lastly lets calculate the average grade in the class
student_grades = [91, 88, 99, 96, 87]; % lolwut is this?
average_grade  = mean(student_grades); % mean? What is that doing?
display(average_grade)
