function [ ] = randomMatrix( hObject, handles )
% Random generate matrix!

% check input isNumber
mina = round(str2double(get(handles.minA, 'String')));
if isnan(mina)
    set(handles.minA, 'String', 'Min', 'Enable', 'inactive');
    warndlg('Input must be number');
    return
end
maxa = round(str2double(get(handles.maxA, 'String')));
if isnan(maxa)
    set(handles.maxA, 'String', 'Max', 'Enable', 'inactive');
    warndlg('Input must be number');
    return
end

if handles.operation ~= 3
    minb = round(str2double(get(handles.minB, 'String')));
    if isnan(minb)
        set(handles.minB, 'String', 'Min', 'Enable', 'inactive');
        warndlg('Input must be number');
        return
    end
    maxb = round(str2double(get(handles.maxB, 'String')));
    if isnan(maxb)
        set(handles.maxB, 'String', 'Min', 'Enable', 'inactive');
        warndlg('Input must be number');
        return
    end
end

% Generate matrix
for i = 0:matrix_size
    randi([mina maxa]);
end

guidata(hObject, handles);