
function [ ] = inputPage( hObject, handles )
% This is a INPUT random page. Update mouseSelect and hover here

% -- Random button
if checkHover(hObject, handles.random_button)
    handles.mouseSelect = "RANDOM";
    set(handles.random_button, 'BackgroundColor', [0.89 0.24 0.45]);
    setfigptr('coolpointer', handles.madlab);
    
% -- Calculate button
elseif checkHover(hObject, handles.cal)
    handles.mouseSelect = "CAL";
    set(handles.cal, 'BackgroundColor', [0.12 0.69 0.69]);
    setfigptr('coolpointer', handles.madlab);

% -- Back button
elseif checkHover(hObject, handles.back)
    handles.mouseSelect = "BACK";
    set(handles.back, 'BackgroundColor', [0.12 0.69 0.69]);
    setfigptr('coolpointer', handles.madlab);
    
% clear all button
else
    handles.mouseSelect = "NONE";
    % reset random button
    set(handles.random_button, 'BackgroundColor', [0.98 0.32 0.52]);
    % reset cal button
    set(handles.cal, 'BackgroundColor', [0.26 0.75 0.78]);
    % reset back button
    set(handles.back, 'BackgroundColor', [0.26 0.75 0.78]);
    
    setfigptr('circle', handles.madlab); 
end

guidata(hObject, handles);