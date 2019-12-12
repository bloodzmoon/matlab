
function [ ] = inputPageUpdate( hObject, handles )
% Mouse click event in INPUT random page


switch handles.mouseSelect
    case "RANDOM"
        randomMatrix(hObject, handles);
        set(handles.random_button, 'BackgroundColor', [0.98 0.32 0.52], 'Value', 1);
        setfigptr('circle', handles.madlab);
        
    case "CAL"
        % CALCULATE!
        result = [];
        X = get(handles.matArand, 'Data');
        Y = get(handles.matBrand, 'Data');
        startL = tic;
        switch handles.operation
            case 0 % -- Add
                result = addMatrix(X,Y,handles.matrix_size);
            case 1 % -- Sub
                result = subMatrix(X,Y,handles.matrix_size);
            case 2 % -- Mul
                result = mulMatrix(X,Y,handles.matrix_size);
            case 3 % -- Inv
                result = invMatrix(X,handles.matrix_size);
        end
        set(handles.timeL, 'String', toc(startL));
        handles.matrixC = result;
        set(handles.matAresult, 'Data', get(handles.matArand, 'Data'));
        set(handles.matBresult, 'Data', get(handles.matBrand, 'Data'));
        set(handles.matC, 'Data', handles.matrixC);
        set(handles.P3, 'visible', 'off');
        handles.scene = "-RESULT-";
        set(handles.P5, 'visible', 'on');
        setfigptr('circle', handles.madlab);
        
    case "BACK"
        set(handles.P3, 'visible', 'off');
        handles.scene = "-MENU-";
        set(handles.P2, 'visible', 'on');
        setfigptr('circle', handles.madlab);
end

guidata(hObject, handles);