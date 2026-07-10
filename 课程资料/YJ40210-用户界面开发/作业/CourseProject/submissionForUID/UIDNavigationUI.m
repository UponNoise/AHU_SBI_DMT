function UIDNavigationUI(varargin)
% UIDNavigationUI  Intelligent navigation UI for the UID course project.
%
% Run main.m to launch the UI.  Run UIDNavigationUI('selftest') to check
% the road extraction and distance engine without opening the UI.

    if nargin > 0 && strcmpi(varargin{1}, 'selftest')
        runSelfTest();
        return;
    end

    pixelScale = 1.7;              % meters per pixel
    roadTolerancePixels = 20;      % allowed click distance to the road skeleton
    ivLengthPixels = (8 / pixelScale) * 8;
    ivWidthPixels = (3 / pixelScale) * 8;

    projectDir = fileparts(mfilename('fullpath'));
    mapPath = fullfile(projectDir, 'MapForUI.jpg');
    if ~exist(mapPath, 'file')
        error('MapForUI.jpg was not found in the project folder.');
    end

    mapImage = imread(mapPath);
    mapHeight = size(mapImage, 1);
    mapWidth = size(mapImage, 2);
    road = buildRoadData(projectDir, mapHeight, mapWidth);

    ivs = struct('id', {}, 'x', {}, 'y', {}, 'angle', {}, ...
                 'patch', {}, 'nose', {}, 'label', {});
    nextIvId = 1;
    currentMode = 'normal';
    skeletonVisible = false;
    magnifierRadiusPixels = 75;
    magnifierHandles = [];
    magnifierIvId = [];
    streetViewPitchDegrees = 15;
    streetViewHeightMeters = 10;
    streetViewWidthPixels = 420;
    streetViewHeightPixels = 280;
    streetViewFocalPixels = 180;
    measurePoints = struct('x', {}, 'y', {}, 'roadX', {}, 'roadY', {}, ...
                           'roadId', {}, 'offRoadPixels', {});
    measureMarks = [];
    pathPlanPoints = struct('x', {}, 'y', {}, 'roadX', {}, 'roadY', {}, ...
                            'roadId', {}, 'offRoadPixels', {});
    pathPlanTempHandles = [];
    plannedPathHandles = [];
    plannedPathCount = 0;
    pathPlanCurrentColor = [0.90 0.12 0.12];

    screenSize = get(0, 'ScreenSize');
    figureWidth = min(1320, screenSize(3) - 80);
    figureHeight = min(820, screenSize(4) - 100);
    if figureWidth < 980
        figureWidth = 980;
    end
    if figureHeight < 620
        figureHeight = 620;
    end

    fig = figure('Name', 'UID Intelligent Navigation UI', ...
                 'NumberTitle', 'off', ...
                 'MenuBar', 'none', ...
                 'ToolBar', 'none', ...
                 'Resize', 'off', ...
                 'Color', [0.94 0.94 0.94], ...
                 'Units', 'pixels', ...
                 'Position', [60 60 figureWidth figureHeight]);

    margin = 18;
    panelWidth = 270;
    axesWidth = figureWidth - panelWidth - 3 * margin;
    axesHeight = figureHeight - 2 * margin;

    ax = axes('Parent', fig, ...
              'Units', 'pixels', ...
              'Position', [margin margin axesWidth axesHeight]);
    imageHandle = imshow(mapImage, 'Parent', ax);
    set(imageHandle, 'ButtonDownFcn', @onMapClick, ...
                     'HitTest', 'on', ...
                     'PickableParts', 'all');
    set(ax, 'YDir', 'reverse', ...
            'XLim', [1 mapWidth], ...
            'YLim', [1 mapHeight], ...
            'XTick', [], ...
            'YTick', []);
    hold(ax, 'on');

    skeletonLayer = zeros(mapHeight, mapWidth, 3, 'uint8');
    skeletonLayer(:, :, 2) = 255;
    skeletonAlpha = 0.70 * double(road.mask);
    skeletonOverlay = image(ax, ...
                            'CData', skeletonLayer, ...
                            'XData', [1 mapWidth], ...
                            'YData', [1 mapHeight], ...
                            'AlphaData', skeletonAlpha, ...
                            'Visible', 'off', ...
                            'HitTest', 'off');

    controlPanel = uipanel('Parent', fig, ...
                           'Title', 'Control Panel', ...
                           'Units', 'pixels', ...
                           'Position', [axesWidth + 2 * margin, margin, ...
                                        panelWidth, axesHeight]);

    y = axesHeight - 58;
    uicontrol(controlPanel, 'Style', 'pushbutton', ...
              'String', 'Add IV', ...
              'FontSize', 10, ...
              'Units', 'pixels', ...
              'Position', [22 y 226 34], ...
              'Callback', @startAddIv);

    y = y - 52;
    uicontrol(controlPanel, 'Style', 'text', ...
              'String', 'Current IV', ...
              'HorizontalAlignment', 'left', ...
              'Units', 'pixels', ...
              'Position', [22 y + 26 226 20]);
    ivPopup = uicontrol(controlPanel, 'Style', 'popupmenu', ...
                        'String', {'No IV'}, ...
                        'FontSize', 10, ...
                        'Units', 'pixels', ...
                        'Position', [22 y 226 28]);

    y = y - 48;
    uicontrol(controlPanel, 'Style', 'pushbutton', ...
              'String', 'Rotate Current IV', ...
              'FontSize', 10, ...
              'Units', 'pixels', ...
              'Position', [22 y 226 34], ...
              'Callback', @rotateCurrentIv);

    y = y - 42;
    uicontrol(controlPanel, 'Style', 'pushbutton', ...
              'String', 'Delete Current IV', ...
              'FontSize', 10, ...
              'Units', 'pixels', ...
              'Position', [22 y 226 34], ...
              'Callback', @deleteCurrentIv);

    y = y - 52;
    uicontrol(controlPanel, 'Style', 'pushbutton', ...
              'String', 'Show All IV Positions', ...
              'FontSize', 10, ...
              'Units', 'pixels', ...
              'Position', [22 y 226 34], ...
              'Callback', @showAllIvPositions);

    y = y - 42;
    uicontrol(controlPanel, 'Style', 'pushbutton', ...
              'String', 'Measure Path Distance', ...
              'FontSize', 10, ...
              'Units', 'pixels', ...
              'Position', [22 y 226 34], ...
              'Callback', @startDistanceMeasure);

    y = y - 42;
    skeletonButton = uicontrol(controlPanel, 'Style', 'pushbutton', ...
                               'String', 'Show Road Skeleton', ...
                               'FontSize', 10, ...
                               'Units', 'pixels', ...
                               'Position', [22 y 226 34], ...
                               'Callback', @toggleRoadSkeleton);

    y = y - 42;
    uicontrol(controlPanel, 'Style', 'pushbutton', ...
              'String', 'Local Magnifier', ...
              'FontSize', 10, ...
              'Units', 'pixels', ...
              'Position', [22 y 226 34], ...
              'Callback', @startMagnifier);

    y = y - 42;
    uicontrol(controlPanel, 'Style', 'pushbutton', ...
              'String', 'Heading-Up View', ...
              'FontSize', 10, ...
              'Units', 'pixels', ...
              'Position', [22 y 226 34], ...
              'Callback', @showCurrentIvHeadingView);

    y = y - 42;
    uicontrol(controlPanel, 'Style', 'pushbutton', ...
              'String', 'Plan Path', ...
              'FontSize', 10, ...
              'Units', 'pixels', ...
              'Position', [22 y 226 34], ...
              'Callback', @startPathPlanning);

    y = y - 42;
    uicontrol(controlPanel, 'Style', 'pushbutton', ...
              'String', 'Clear Paths', ...
              'FontSize', 10, ...
              'Units', 'pixels', ...
              'Position', [22 y 226 34], ...
              'Callback', @clearAllPlannedPaths);

    y = y - 42;
    uicontrol(controlPanel, 'Style', 'pushbutton', ...
              'String', 'Street View', ...
              'FontSize', 10, ...
              'Units', 'pixels', ...
              'Position', [22 y 128 34], ...
              'Callback', @startStreetView);
    uicontrol(controlPanel, 'Style', 'text', ...
              'String', 'Pitch', ...
              'HorizontalAlignment', 'center', ...
              'Units', 'pixels', ...
              'Position', [158 y + 7 34 18]);
    streetViewPitchEdit = uicontrol(controlPanel, 'Style', 'edit', ...
                                    'String', '15', ...
                                    'FontSize', 10, ...
                                    'Units', 'pixels', ...
                                    'Position', [198 y + 3 50 28]);

    y = y - 68;
    uicontrol(controlPanel, 'Style', 'text', ...
              'String', 'Clicked Position', ...
              'HorizontalAlignment', 'left', ...
              'Units', 'pixels', ...
              'Position', [22 y + 30 226 20]);
    coordText = uicontrol(controlPanel, 'Style', 'text', ...
                          'String', 'No map click yet', ...
                          'HorizontalAlignment', 'left', ...
                          'Units', 'pixels', ...
                          'Position', [22 y 226 34]);

    statusText = uicontrol(controlPanel, 'Style', 'text', ...
                           'String', 'Map loaded. Click the map to show real coordinates.', ...
                           'HorizontalAlignment', 'left', ...
                           'Units', 'pixels', ...
                           'Position', [22 34 226 130]);

    function startAddIv(~, ~)
        currentMode = 'addIV';
        measurePoints = struct('x', {}, 'y', {}, 'roadX', {}, 'roadY', {}, ...
                               'roadId', {}, 'offRoadPixels', {});
        clearMeasureMarks();
        clearPathPlanTempHandles();
        closeMagnifier(false);
        setStatus('Click a road point on the map to add an IV.');
    end

    function startDistanceMeasure(~, ~)
        currentMode = 'measure';
        measurePoints = struct('x', {}, 'y', {}, 'roadX', {}, 'roadY', {}, ...
                               'roadId', {}, 'offRoadPixels', {});
        clearMeasureMarks();
        clearPathPlanTempHandles();
        closeMagnifier(false);
        setStatus('Click the first point on the map.');
    end

    function startPathPlanning(~, ~)
        currentMode = 'pathPlan';
        clearMeasureMarks();
        clearPathPlanTempHandles();
        closeMagnifier(false);
        pathPlanPoints = struct('x', {}, 'y', {}, 'roadX', {}, 'roadY', {}, ...
                                'roadId', {}, 'offRoadPixels', {});
        pathPlanCurrentColor = plannedPathColor(plannedPathCount + 1);
        setStatus('Click the path start point on the map.');
    end

    function startStreetView(~, ~)
        pitchText = strtrim(get(streetViewPitchEdit, 'String'));
        pitchValue = str2double(pitchText);
        if isnan(pitchValue) || pitchValue < 0 || pitchValue > 90 || ...
           abs(pitchValue - round(pitchValue)) > 0.0001
            errordlg('Pitch must be an integer from 0 to 90.', 'Invalid Pitch');
            setStatus('Pitch must be an integer from 0 to 90.');
            return;
        end

        streetViewPitchDegrees = round(pitchValue);
        set(streetViewPitchEdit, 'String', num2str(streetViewPitchDegrees));
        currentMode = 'streetView';
        clearMeasureMarks();
        clearPathPlanTempHandles();
        closeMagnifier(false);
        setStatus('Click a road point for the virtual street-view camera.');
    end

    function clearAllPlannedPaths(~, ~)
        clearPathPlanTempHandles();
        for k = 1:numel(plannedPathHandles)
            if ishandle(plannedPathHandles(k))
                delete(plannedPathHandles(k));
            end
        end
        plannedPathHandles = [];
        plannedPathCount = 0;
        pathPlanPoints = struct('x', {}, 'y', {}, 'roadX', {}, 'roadY', {}, ...
                                'roadId', {}, 'offRoadPixels', {});
        if strcmp(currentMode, 'pathPlan')
            currentMode = 'normal';
        end
        setStatus('All planned paths have been cleared.');
    end

    function toggleRoadSkeleton(~, ~)
        skeletonVisible = ~skeletonVisible;
        if skeletonVisible
            set(skeletonOverlay, 'Visible', 'on');
            set(skeletonButton, 'String', 'Hide Road Skeleton');
            setStatus('Extracted road skeleton is now visible.');
        else
            set(skeletonOverlay, 'Visible', 'off');
            set(skeletonButton, 'String', 'Show Road Skeleton');
            setStatus('Road skeleton display has been hidden.');
        end
    end

    function startMagnifier(~, ~)
        idx = selectedIvIndex();
        if idx == 0
            setStatus('There is no IV to magnify.');
            warndlg('There is no IV to magnify.', 'Local Magnifier');
            return;
        end

        labels = {'100%', '125%', '150%', '175%', '200%'};
        scales = [1.00 1.25 1.50 1.75 2.00];
        choice = menu('Select Magnification Scale', labels{:});
        if choice == 0
            return;
        end

        currentMode = 'normal';
        measurePoints = struct('x', {}, 'y', {}, 'roadX', {}, 'roadY', {}, ...
                               'roadId', {}, 'offRoadPixels', {});
        clearMeasureMarks();
        clearPathPlanTempHandles();
        showMagnifier(idx, scales(choice), labels{choice});
    end

    function showMagnifier(idx, scale, scaleLabel)
        closeMagnifier(false);

        centerX = ivs(idx).x;
        centerY = ivs(idx).y;
        [cropImage, cropAlpha] = circularMapCrop( ...
            mapImage, centerX, centerY, magnifierRadiusPixels);
        cropImage = drawIvsOnMagnifierCrop(cropImage, cropAlpha, ivs, ...
                                           centerX, centerY, ...
                                           magnifierRadiusPixels, ...
                                           ivLengthPixels, ivWidthPixels);
        magnifiedImage = resizeImageNearest(cropImage, scale);
        magnifiedAlpha = resizeMatrixNearest(cropAlpha, scale);

        displayRadius = magnifierRadiusPixels * scale;
        displayCenterX = clampValue(centerX, 1 + displayRadius, ...
                                    mapWidth - displayRadius);
        displayCenterY = clampValue(centerY, 1 + displayRadius, ...
                                    mapHeight - displayRadius);

        xData = [displayCenterX - displayRadius, displayCenterX + displayRadius];
        yData = [displayCenterY - displayRadius, displayCenterY + displayRadius];

        magnifierImage = image(ax, ...
                               'CData', magnifiedImage, ...
                               'XData', xData, ...
                               'YData', yData, ...
                               'AlphaData', magnifiedAlpha, ...
                               'HitTest', 'off');

        theta = linspace(0, 2 * pi, 181);
        border = line(ax, ...
                      displayCenterX + displayRadius * cos(theta), ...
                      displayCenterY + displayRadius * sin(theta), ...
                      'Color', [0.04 0.04 0.04], ...
                      'LineWidth', 1.8, ...
                      'HitTest', 'off');

        buttonRadius = max(8, min(13, displayRadius * 0.14));
        closeX = displayCenterX + displayRadius * 0.56;
        closeY = displayCenterY - displayRadius * 0.56;
        closeButton = rectangle('Parent', ax, ...
                                'Position', [closeX - buttonRadius, ...
                                             closeY - buttonRadius, ...
                                             2 * buttonRadius, ...
                                             2 * buttonRadius], ...
                                'Curvature', [1 1], ...
                                'FaceColor', [0.82 0.10 0.10], ...
                                'EdgeColor', [1 1 1], ...
                                'LineWidth', 1.2, ...
                                'HitTest', 'on', ...
                                'ButtonDownFcn', @closeMagnifierFromButton);
        closeText = text(ax, closeX, closeY, 'X', ...
                         'Color', [1 1 1], ...
                         'FontWeight', 'bold', ...
                         'FontSize', 9, ...
                         'HorizontalAlignment', 'center', ...
                         'VerticalAlignment', 'middle', ...
                         'HitTest', 'on', ...
                         'ButtonDownFcn', @closeMagnifierFromButton);

        magnifierHandles = [magnifierImage border closeButton closeText];
        magnifierIvId = ivs(idx).id;
        setStatus(['Showing a 75-pixel circular local map around IV' ...
                   num2str(ivs(idx).id) ' at ' scaleLabel '.']);
    end

    function closeMagnifierFromButton(~, ~)
        closeMagnifier(true);
    end

    function closeMagnifier(showMessage)
        for k = 1:numel(magnifierHandles)
            if ishandle(magnifierHandles(k))
                delete(magnifierHandles(k));
            end
        end
        magnifierHandles = [];
        magnifierIvId = [];
        if showMessage
            setStatus('Magnifier mode has been closed.');
        end
    end

    function showCurrentIvHeadingView(~, ~)
        idx = selectedIvIndex();
        if idx == 0
            setStatus('There is no IV for the heading-up view.');
            warndlg('There is no IV for the heading-up view.', 'Heading-Up View');
            return;
        end

        viewRadius = 220;
        [viewImage, viewAlpha] = buildHeadingUpViewImage( ...
            mapImage, ivs, idx, viewRadius, ivLengthPixels, ivWidthPixels);

        viewFigure = figure('Name', ['IV' num2str(ivs(idx).id) ' Heading-Up View'], ...
                            'NumberTitle', 'off', ...
                            'MenuBar', 'none', ...
                            'ToolBar', 'none', ...
                            'Resize', 'off', ...
                            'Color', [0.94 0.94 0.94], ...
                            'Units', 'pixels', ...
                            'Position', [140 90 520 570]);
        viewAxes = axes('Parent', viewFigure, ...
                        'Units', 'pixels', ...
                        'Position', [38 84 444 444]);
        image(viewAxes, ...
              'CData', viewImage, ...
              'XData', [1 size(viewImage, 2)], ...
              'YData', [1 size(viewImage, 1)], ...
              'AlphaData', viewAlpha);
        set(viewAxes, 'YDir', 'reverse', ...
                      'XLim', [1 size(viewImage, 2)], ...
                      'YLim', [1 size(viewImage, 1)], ...
                      'XTick', [], ...
                      'YTick', []);
        axis(viewAxes, 'image');

        uicontrol(viewFigure, 'Style', 'text', ...
                  'String', ['IV' num2str(ivs(idx).id) ' Heading Up'], ...
                  'FontSize', 11, ...
                  'FontWeight', 'bold', ...
                  'HorizontalAlignment', 'center', ...
                  'Units', 'pixels', ...
                  'Position', [38 42 444 24]);
        uicontrol(viewFigure, 'Style', 'pushbutton', ...
                  'String', 'Close', ...
                  'FontSize', 10, ...
                  'Units', 'pixels', ...
                  'Position', [210 14 100 28], ...
                  'Callback', @(source, event) close(viewFigure));

        setStatus(['Heading-up view for IV' num2str(ivs(idx).id) ' has been generated.']);
    end

    function showStreetViewWindow(streetViewImage, cameraX, cameraY, ...
                                  headingAngle, pitchAngle)
        viewFigure = figure('Name', 'Virtual Street View', ...
                            'NumberTitle', 'off', ...
                            'MenuBar', 'none', ...
                            'ToolBar', 'none', ...
                            'Resize', 'off', ...
                            'Color', [0.94 0.94 0.94], ...
                            'Units', 'pixels', ...
                            'Position', [120 80 560 430]);
        viewAxes = axes('Parent', viewFigure, ...
                        'Units', 'pixels', ...
                        'Position', [44 94 472 315]);
        image(viewAxes, streetViewImage);
        set(viewAxes, 'XTick', [], 'YTick', []);
        axis(viewAxes, 'image');

        infoText = ['Position (' formatNumber(cameraX) ', ' formatNumber(cameraY) ...
                    ') m  Height 10 m  Pitch ' num2str(pitchAngle) ...
                    ' deg  Heading ' formatNumber(headingAngle) ' deg'];
        uicontrol(viewFigure, 'Style', 'text', ...
                  'String', infoText, ...
                  'FontSize', 10, ...
                  'HorizontalAlignment', 'center', ...
                  'Units', 'pixels', ...
                  'Position', [34 52 492 24]);
        uicontrol(viewFigure, 'Style', 'pushbutton', ...
                  'String', 'Close', ...
                  'FontSize', 10, ...
                  'Units', 'pixels', ...
                  'Position', [230 16 100 28], ...
                  'Callback', @(source, event) close(viewFigure));
    end

    function onMapClick(~, ~)
        clickedPoint = get(ax, 'CurrentPoint');
        x = clickedPoint(1, 1);
        y = clickedPoint(1, 2);
        if x < 1 || x > mapWidth || y < 1 || y > mapHeight
            return;
        end

        updateClickedCoordinate(x, y);

        if strcmp(currentMode, 'addIV')
            [~, ~, distancePixels, roadId] = nearestRoadPoint(x, y, road);
            if distancePixels > roadTolerancePixels
                setStatus('Clicked position is not on a road. Please click a road position.');
                errordlg('Clicked position is not on a road.', 'Invalid Position');
                return;
            end
            addIvAt(x, y, roadId);
            currentMode = 'normal';
            setStatus(['IV' num2str(ivs(end).id) ...
                       ' has been added and aligned with the road.']);
            return;
        end

        if strcmp(currentMode, 'measure')
            [roadX, roadY, offRoadPixels, roadId] = nearestRoadPoint(x, y, road);
            pointIndex = numel(measurePoints) + 1;
            measurePoints(pointIndex).x = x;
            measurePoints(pointIndex).y = y;
            measurePoints(pointIndex).roadX = roadX;
            measurePoints(pointIndex).roadY = roadY;
            measurePoints(pointIndex).roadId = roadId;
            measurePoints(pointIndex).offRoadPixels = offRoadPixels;
            drawMeasureMark(x, y, roadX, roadY, pointIndex);

            if pointIndex == 1
                setStatus(['The first point has been recorded. Distance to nearest road: ' ...
                           formatMeters(offRoadPixels * pixelScale) ...
                           '. Click the second point.']);
                return;
            end

            setStatus('Calculating the road path distance between the two points...');
            drawnow;
            roadDistancePixels = shortestRoadDistancePixels( ...
                road, measurePoints(1).roadId, measurePoints(2).roadId);
            totalMeters = (measurePoints(1).offRoadPixels + ...
                           measurePoints(2).offRoadPixels + ...
                           roadDistancePixels) * pixelScale;
            roadMeters = roadDistancePixels * pixelScale;
            off1Meters = measurePoints(1).offRoadPixels * pixelScale;
            off2Meters = measurePoints(2).offRoadPixels * pixelScale;
            message = {['Point 1 to nearest road: ' formatMeters(off1Meters)], ...
                       ['Distance along roads: ' formatMeters(roadMeters)], ...
                       ['Point 2 to nearest road: ' formatMeters(off2Meters)], ...
                       ['Total path distance: ' formatMeters(totalMeters)]};
            msgbox(message, 'Two-Point Real Distance');
            setStatus(['Total path distance is ' formatMeters(totalMeters) '.']);
            currentMode = 'normal';
            measurePoints = struct('x', {}, 'y', {}, 'roadX', {}, 'roadY', {}, ...
                                   'roadId', {}, 'offRoadPixels', {});
        end

        if strcmp(currentMode, 'pathPlan')
            [roadX, roadY, offRoadPixels, roadId] = nearestRoadPoint(x, y, road);
            pointIndex = numel(pathPlanPoints) + 1;
            pathPlanPoints(pointIndex).x = x;
            pathPlanPoints(pointIndex).y = y;
            pathPlanPoints(pointIndex).roadX = roadX;
            pathPlanPoints(pointIndex).roadY = roadY;
            pathPlanPoints(pointIndex).roadId = roadId;
            pathPlanPoints(pointIndex).offRoadPixels = offRoadPixels;

            if pointIndex == 1
                pathPlanTempHandles = drawPathPointSet( ...
                    pathPlanPoints(1), 'S', pathPlanCurrentColor);
                setStatus('Path start point has been recorded. Click the path end point.');
                return;
            end

            setStatus('Planning the shortest path...');
            drawnow;
            [roadDistancePixels, pathIds] = shortestRoadPathPixels( ...
                road, pathPlanPoints(1).roadId, pathPlanPoints(2).roadId);
            totalMeters = (pathPlanPoints(1).offRoadPixels + ...
                           pathPlanPoints(2).offRoadPixels + ...
                           roadDistancePixels) * pixelScale;

            completedHandles = drawPlannedPath(pathPlanPoints(1), ...
                                               pathPlanPoints(2), ...
                                               pathIds, ...
                                               pathPlanCurrentColor);
            plannedPathHandles = [plannedPathHandles completedHandles];
            plannedPathCount = plannedPathCount + 1;
            pathPlanTempHandles = [];

            message = {['Start point to nearest road: ' ...
                        formatMeters(pathPlanPoints(1).offRoadPixels * pixelScale)], ...
                       ['Shortest distance along roads: ' ...
                        formatMeters(roadDistancePixels * pixelScale)], ...
                       ['End point to nearest road: ' ...
                        formatMeters(pathPlanPoints(2).offRoadPixels * pixelScale)], ...
                       ['Total path distance: ' formatMeters(totalMeters)]};
            msgbox(message, 'Path Planning Result');
            setStatus(['Path ' num2str(plannedPathCount) ...
                       ' has been planned. Total distance: ' formatMeters(totalMeters) '.']);
            currentMode = 'normal';
            pathPlanPoints = struct('x', {}, 'y', {}, 'roadX', {}, 'roadY', {}, ...
                                    'roadId', {}, 'offRoadPixels', {});
        end

        if strcmp(currentMode, 'streetView')
            [roadX, roadY, distancePixels, roadId] = nearestRoadPoint(x, y, road);
            if distancePixels > roadTolerancePixels
                setStatus('Clicked position is not on a road. Please click a road position.');
                errordlg('Clicked position is not on a road.', 'Invalid Position');
                return;
            end

            [cameraX, cameraY] = imageToWorld(roadX, roadY, mapHeight, pixelScale);
            headingAngle = estimateRoadHeadingDegrees(road, roadId, 35);
            setStatus('Generating virtual street view...');
            drawnow;
            streetViewImage = buildVirtualStreetViewImage( ...
                mapImage, mapHeight, pixelScale, cameraX, cameraY, ...
                headingAngle, streetViewPitchDegrees, streetViewHeightMeters, ...
                streetViewWidthPixels, streetViewHeightPixels, ...
                streetViewFocalPixels);
            showStreetViewWindow(streetViewImage, cameraX, cameraY, ...
                                 headingAngle, streetViewPitchDegrees);
            currentMode = 'normal';
            setStatus(['Virtual street view has been generated. Pitch: ' ...
                       num2str(streetViewPitchDegrees) ' deg, height: 10 m.']);
        end
    end

    function addIvAt(x, y, roadId)
        iv.id = nextIvId;
        iv.x = x;
        iv.y = y;
        iv.angle = estimateRoadHeadingDegrees(road, roadId, 35);
        [vx, vy] = ivVertices(iv.x, iv.y, iv.angle, ...
                              ivLengthPixels, ivWidthPixels);
        [nx, ny] = ivNoseVertices(iv.x, iv.y, iv.angle, ...
                                  ivLengthPixels, ivWidthPixels);
        iv.patch = patch('Parent', ax, ...
                         'XData', vx, ...
                         'YData', vy, ...
                         'FaceColor', [1.00 0.82 0.20], ...
                         'EdgeColor', [0.05 0.05 0.05], ...
                         'LineWidth', 1.3, ...
                         'FaceAlpha', 0.88, ...
                         'HitTest', 'off');
        iv.nose = patch('Parent', ax, ...
                        'XData', nx, ...
                        'YData', ny, ...
                        'FaceColor', [0.08 0.10 0.12], ...
                        'EdgeColor', [1 1 1], ...
                        'LineWidth', 0.8, ...
                        'HitTest', 'off');
        iv.label = text(ax, iv.x, iv.y, num2str(iv.id), ...
                        'HorizontalAlignment', 'center', ...
                        'VerticalAlignment', 'middle', ...
                        'FontWeight', 'bold', ...
                        'FontSize', 9, ...
                        'Color', [0 0 0], ...
                        'HitTest', 'off');
        ivs(end + 1) = iv;
        nextIvId = nextIvId + 1;
        updateIvPopup(numel(ivs));
    end

    function rotateCurrentIv(~, ~)
        idx = selectedIvIndex();
        if idx == 0
            setStatus('There is no IV to rotate.');
            return;
        end
        ivs(idx).angle = mod(ivs(idx).angle + 45, 360);
        [vx, vy] = ivVertices(ivs(idx).x, ivs(idx).y, ivs(idx).angle, ...
                              ivLengthPixels, ivWidthPixels);
        [nx, ny] = ivNoseVertices(ivs(idx).x, ivs(idx).y, ivs(idx).angle, ...
                                  ivLengthPixels, ivWidthPixels);
        set(ivs(idx).patch, 'XData', vx, 'YData', vy);
        set(ivs(idx).nose, 'XData', nx, 'YData', ny);
        set(ivs(idx).label, 'Position', [ivs(idx).x ivs(idx).y 0]);
        closeMagnifier(false);
        setStatus(['IV' num2str(ivs(idx).id) ' has been rotated clockwise by 45 degrees.']);
    end

    function deleteCurrentIv(~, ~)
        idx = selectedIvIndex();
        if idx == 0
            setStatus('There is no IV to delete.');
            return;
        end
        answer = questdlg('Confirm deletion of the current IV?', 'Delete Current IV', ...
                          'Confirm', 'Cancel', 'Cancel');
        if ~strcmp(answer, 'Confirm')
            return;
        end
        deletedId = ivs(idx).id;
        if ~isempty(magnifierIvId) && magnifierIvId == deletedId
            closeMagnifier(false);
        end
        if ishandle(ivs(idx).patch)
            delete(ivs(idx).patch);
        end
        if ishandle(ivs(idx).nose)
            delete(ivs(idx).nose);
        end
        if ishandle(ivs(idx).label)
            delete(ivs(idx).label);
        end
        ivs(idx) = [];
        if isempty(ivs)
            updateIvPopup(1);
        else
            updateIvPopup(min(idx, numel(ivs)));
        end
        setStatus(['IV' num2str(deletedId) ' has been deleted.']);
    end

    function showAllIvPositions(~, ~)
        if isempty(ivs)
            msgbox('There is no IV.', 'All IV Positions');
            setStatus('There is no IV.');
            return;
        end
        lines = cell(1, numel(ivs));
        for i = 1:numel(ivs)
            [worldX, worldY] = imageToWorld(ivs(i).x, ivs(i).y, ...
                                            mapHeight, pixelScale);
            lines{i} = ['IV' num2str(ivs(i).id) ' position is (' ...
                        formatNumber(worldX) ', ' formatNumber(worldY) ') m'];
        end
        msgbox(lines, 'All IV Positions');
        setStatus(joinLines(lines));
    end

    function updateClickedCoordinate(x, y)
        [worldX, worldY] = imageToWorld(x, y, mapHeight, pixelScale);
        set(coordText, 'String', ['x=' formatNumber(worldX) ...
                                  ' m, y=' formatNumber(worldY) ' m']);
    end

    function updateIvPopup(selectedIndex)
        if isempty(ivs)
            set(ivPopup, 'String', {'No IV'}, 'Value', 1);
            return;
        end
        items = cell(1, numel(ivs));
        for i = 1:numel(ivs)
            items{i} = ['IV' num2str(ivs(i).id)];
        end
        if selectedIndex < 1
            selectedIndex = 1;
        end
        if selectedIndex > numel(ivs)
            selectedIndex = numel(ivs);
        end
        set(ivPopup, 'String', items, 'Value', selectedIndex);
    end

    function idx = selectedIvIndex()
        if isempty(ivs)
            idx = 0;
            return;
        end
        idx = get(ivPopup, 'Value');
        if idx < 1 || idx > numel(ivs)
            idx = 1;
            set(ivPopup, 'Value', 1);
        end
    end

    function drawMeasureMark(x, y, roadX, roadY, pointIndex)
        pointColor = [0.92 0.12 0.15];
        roadColor = [0.10 0.25 0.95];
        h1 = plot(ax, x, y, 'o', ...
                  'MarkerEdgeColor', [0 0 0], ...
                  'MarkerFaceColor', pointColor, ...
                  'MarkerSize', 7, ...
                  'LineWidth', 1.1, ...
                  'HitTest', 'off');
        h2 = plot(ax, roadX, roadY, 's', ...
                  'MarkerEdgeColor', [0 0 0], ...
                  'MarkerFaceColor', roadColor, ...
                  'MarkerSize', 7, ...
                  'LineWidth', 1.1, ...
                  'HitTest', 'off');
        h3 = line(ax, [x roadX], [y roadY], ...
                  'Color', [0.15 0.15 0.15], ...
                  'LineStyle', '--', ...
                  'LineWidth', 1.0, ...
                  'HitTest', 'off');
        h4 = text(ax, x + 8, y - 8, ['P' num2str(pointIndex)], ...
                  'Color', [0 0 0], ...
                  'FontWeight', 'bold', ...
                  'FontSize', 9, ...
                  'BackgroundColor', [1 1 1], ...
                  'Margin', 1, ...
                  'HitTest', 'off');
        measureMarks = [measureMarks h1 h2 h3 h4];
    end

    function clearMeasureMarks()
        for i = 1:numel(measureMarks)
            if ishandle(measureMarks(i))
                delete(measureMarks(i));
            end
        end
        measureMarks = [];
    end

    function clearPathPlanTempHandles()
        for k = 1:numel(pathPlanTempHandles)
            if ishandle(pathPlanTempHandles(k))
                delete(pathPlanTempHandles(k));
            end
        end
        pathPlanTempHandles = [];
    end

    function handles = drawPathPointSet(point, labelText, color)
        sourceMarker = plot(ax, point.x, point.y, 'o', ...
                            'MarkerEdgeColor', [0 0 0], ...
                            'MarkerFaceColor', color, ...
                            'MarkerSize', 8, ...
                            'LineWidth', 1.2, ...
                            'HitTest', 'off');
        roadMarker = plot(ax, point.roadX, point.roadY, 's', ...
                          'MarkerEdgeColor', [0 0 0], ...
                          'MarkerFaceColor', [1 1 1], ...
                          'MarkerSize', 7, ...
                          'LineWidth', 1.1, ...
                          'HitTest', 'off');
        connector = line(ax, [point.x point.roadX], [point.y point.roadY], ...
                         'Color', color, ...
                         'LineStyle', '--', ...
                         'LineWidth', 1.2, ...
                         'HitTest', 'off');
        label = text(ax, point.x + 8, point.y - 8, labelText, ...
                     'Color', [0 0 0], ...
                     'FontWeight', 'bold', ...
                     'FontSize', 9, ...
                     'BackgroundColor', [1 1 1], ...
                     'Margin', 1, ...
                     'HitTest', 'off');
        handles = [sourceMarker roadMarker connector label];
    end

    function handles = drawPlannedPath(startPoint, endPoint, pathIds, color)
        if isempty(pathPlanTempHandles)
            startHandles = drawPathPointSet(startPoint, 'S', color);
        else
            startHandles = pathPlanTempHandles;
        end

        pathLine = plot(ax, road.x(pathIds), road.y(pathIds), '-', ...
                        'Color', color, ...
                        'LineWidth', 3.0, ...
                        'HitTest', 'off');
        endHandles = drawPathPointSet(endPoint, 'E', color);
        handles = [startHandles pathLine endHandles];
    end

    function color = plannedPathColor(pathNumber)
        colors = [0.90 0.12 0.12; ...
                  0.10 0.25 0.95; ...
                  0.00 0.55 0.20; ...
                  0.84 0.36 0.00; ...
                  0.48 0.18 0.80; ...
                  0.00 0.55 0.60];
        idx = mod(pathNumber - 1, size(colors, 1)) + 1;
        color = colors(idx, :);
    end

    function setStatus(message)
        set(statusText, 'String', message);
    end
end

function road = buildRoadData(projectDir, mapHeight, mapWidth)
    skeletonPath = chooseSkeletonImage(projectDir);
    skeletonImage = imread(skeletonPath);
    if size(skeletonImage, 1) ~= mapHeight || size(skeletonImage, 2) ~= mapWidth
        error('The map image and road-skeleton image must have the same size.');
    end

    greenMask = extractGreenRoadMask(skeletonImage);
    roadMask = largestConnectedComponent(greenMask);

    [roadRows, roadCols] = find(roadMask);
    if isempty(roadRows)
        error('No road skeleton was extracted from the marked map.');
    end

    idMap = zeros(mapHeight, mapWidth, 'uint32');
    idMap(roadMask) = uint32(1:numel(roadRows));

    road.mask = roadMask;
    road.row = double(roadRows);
    road.col = double(roadCols);
    road.x = double(roadCols);
    road.y = double(roadRows);
    road.idMap = idMap;
    road.count = numel(roadRows);
    road.height = mapHeight;
    road.width = mapWidth;
end

function skeletonPath = chooseSkeletonImage(projectDir)
    candidates = dir(fullfile(projectDir, 'MapForUI-*.jpg'));
    if isempty(candidates)
        candidates = dir(fullfile(projectDir, '*road*.jpg'));
    end
    if isempty(candidates)
        error('The road-skeleton image was not found.');
    end
    skeletonPath = fullfile(projectDir, candidates(1).name);
end

function greenMask = extractGreenRoadMask(skeletonImage)
    red = double(skeletonImage(:, :, 1));
    green = double(skeletonImage(:, :, 2));
    blue = double(skeletonImage(:, :, 3));

    greenMask = green > 180 & red < 120 & blue < 120 & ...
                green - red > 80 & green - blue > 80;

    if nnz(greenMask) < 100
        greenMask = green > 150 & red < 150 & blue < 150 & ...
                    green - red > 50 & green - blue > 50;
    end
end

function largestMask = largestConnectedComponent(mask)
    [height, width] = size(mask);
    visited = false(height, width);
    roadPixels = find(mask);
    totalRoadPixels = numel(roadPixels);
    queueRows = zeros(totalRoadPixels, 1);
    queueCols = zeros(totalRoadPixels, 1);
    componentPixels = zeros(totalRoadPixels, 1);
    largestPixels = [];
    largestCount = 0;

    for k = 1:totalRoadPixels
        startIndex = roadPixels(k);
        if visited(startIndex)
            continue;
        end

        [startRow, startCol] = ind2sub([height width], startIndex);
        head = 1;
        tail = 1;
        componentCount = 0;
        queueRows(1) = startRow;
        queueCols(1) = startCol;
        visited(startRow, startCol) = true;

        while head <= tail
            row = queueRows(head);
            col = queueCols(head);
            head = head + 1;
            componentCount = componentCount + 1;
            componentPixels(componentCount) = sub2ind([height width], row, col);

            for dr = -1:1
                for dc = -1:1
                    if dr == 0 && dc == 0
                        continue;
                    end
                    nr = row + dr;
                    nc = col + dc;
                    if nr >= 1 && nr <= height && nc >= 1 && nc <= width && ...
                       mask(nr, nc) && ~visited(nr, nc)
                        tail = tail + 1;
                        queueRows(tail) = nr;
                        queueCols(tail) = nc;
                        visited(nr, nc) = true;
                    end
                end
            end
        end

        if componentCount > largestCount
            largestCount = componentCount;
            largestPixels = componentPixels(1:componentCount);
        end
    end

    largestMask = false(height, width);
    largestMask(largestPixels) = true;
end

function [roadX, roadY, distancePixels, roadId] = nearestRoadPoint(x, y, road)
    dx = road.x - x;
    dy = road.y - y;
    distanceSquared = dx .* dx + dy .* dy;
    [minDistanceSquared, roadId] = min(distanceSquared);
    distancePixels = sqrt(minDistanceSquared);
    roadX = road.x(roadId);
    roadY = road.y(roadId);
end

function distancePixels = shortestRoadDistancePixels(road, startId, goalId)
    distancePixels = shortestRoadPathPixels(road, startId, goalId);
end

function [distancePixels, pathIds] = shortestRoadPathPixels(road, startId, goalId)
    if startId == goalId
        distancePixels = 0;
        pathIds = startId;
        return;
    end

    nodeCount = road.count;
    dist = inf(nodeCount, 1);
    closed = false(nodeCount, 1);
    previous = zeros(nodeCount, 1, 'uint32');
    dist(startId) = 0;

    heapNode = zeros(max(64, nodeCount), 1, 'uint32');
    heapKey = zeros(max(64, nodeCount), 1);
    heapSize = 0;
    goalX = road.col(goalId);
    goalY = road.row(goalId);
    [heapNode, heapKey, heapSize] = heapPush(heapNode, heapKey, heapSize, ...
                                             uint32(startId), 0);

    neighborRows = [-1 -1 -1 0 0 1 1 1];
    neighborCols = [-1 0 1 -1 1 -1 0 1];
    neighborCost = [sqrt(2) 1 sqrt(2) 1 1 sqrt(2) 1 sqrt(2)];

    while heapSize > 0
        [node, ~, heapNode, heapKey, heapSize] = heapPop(heapNode, heapKey, heapSize);
        node = double(node);
        if closed(node)
            continue;
        end
        if node == goalId
            distancePixels = dist(node);
            pathIds = reconstructRoadPath(previous, startId, goalId, nodeCount);
            return;
        end
        closed(node) = true;

        row = road.row(node);
        col = road.col(node);
        for i = 1:8
            nr = row + neighborRows(i);
            nc = col + neighborCols(i);
            if nr < 1 || nr > road.height || nc < 1 || nc > road.width
                continue;
            end
            neighborId = double(road.idMap(nr, nc));
            if neighborId == 0 || closed(neighborId)
                continue;
            end
            newDistance = dist(node) + neighborCost(i);
            if newDistance < dist(neighborId)
                dist(neighborId) = newDistance;
                previous(neighborId) = uint32(node);
                heuristic = sqrt((road.col(neighborId) - goalX) ^ 2 + ...
                                 (road.row(neighborId) - goalY) ^ 2);
                [heapNode, heapKey, heapSize] = heapPush( ...
                    heapNode, heapKey, heapSize, uint32(neighborId), ...
                    newDistance + heuristic);
            end
        end
    end

    error('The road skeleton is not connected; please re-check the marked road image.');
end

function pathIds = reconstructRoadPath(previous, startId, goalId, nodeCount)
    reversePath = zeros(nodeCount, 1, 'uint32');
    count = 0;
    current = uint32(goalId);
    startId = uint32(startId);

    while true
        count = count + 1;
        reversePath(count) = current;
        if current == startId
            break;
        end

        current = previous(double(current));
        if current == 0
            error('Failed to reconstruct the shortest road path.');
        end
    end

    pathIds = double(reversePath(count:-1:1));
end

function [heapNode, heapKey, heapSize] = heapPush(heapNode, heapKey, heapSize, node, key)
    heapSize = heapSize + 1;
    if heapSize > numel(heapNode)
        heapNode = [heapNode; zeros(numel(heapNode), 1, 'uint32')];
        heapKey = [heapKey; zeros(numel(heapKey), 1)];
    end

    idx = heapSize;
    while idx > 1
        parent = floor(idx / 2);
        if heapKey(parent) <= key
            break;
        end
        heapNode(idx) = heapNode(parent);
        heapKey(idx) = heapKey(parent);
        idx = parent;
    end
    heapNode(idx) = node;
    heapKey(idx) = key;
end

function [node, key, heapNode, heapKey, heapSize] = heapPop(heapNode, heapKey, heapSize)
    node = heapNode(1);
    key = heapKey(1);
    lastNode = heapNode(heapSize);
    lastKey = heapKey(heapSize);
    heapSize = heapSize - 1;

    idx = 1;
    while true
        left = idx * 2;
        right = left + 1;
        if left > heapSize
            break;
        end
        child = left;
        if right <= heapSize && heapKey(right) < heapKey(left)
            child = right;
        end
        if heapKey(child) >= lastKey
            break;
        end
        heapNode(idx) = heapNode(child);
        heapKey(idx) = heapKey(child);
        idx = child;
    end

    if heapSize >= 1
        heapNode(idx) = lastNode;
        heapKey(idx) = lastKey;
    end
end

function [vx, vy] = ivVertices(x, y, angleDegrees, lengthPixels, widthPixels)
    u = [cosd(angleDegrees) sind(angleDegrees)];
    v = [-sind(angleDegrees) cosd(angleDegrees)];
    halfLength = lengthPixels / 2;
    halfWidth = widthPixels / 2;
    p1 = [x y] - halfLength * u - halfWidth * v;
    p2 = [x y] + halfLength * u - halfWidth * v;
    p3 = [x y] + halfLength * u + halfWidth * v;
    p4 = [x y] - halfLength * u + halfWidth * v;
    vx = [p1(1) p2(1) p3(1) p4(1)];
    vy = [p1(2) p2(2) p3(2) p4(2)];
end

function [vx, vy] = ivNoseVertices(x, y, angleDegrees, lengthPixels, widthPixels)
    u = [cosd(angleDegrees) sind(angleDegrees)];
    v = [-sind(angleDegrees) cosd(angleDegrees)];
    halfLength = lengthPixels / 2;
    halfWidth = widthPixels / 2;
    noseLength = max(5, lengthPixels * 0.20);
    tip = [x y] + halfLength * u;
    baseCenter = [x y] + (halfLength - noseLength) * u;
    leftBase = baseCenter + 0.68 * halfWidth * v;
    rightBase = baseCenter - 0.68 * halfWidth * v;
    vx = [tip(1) leftBase(1) rightBase(1)];
    vy = [tip(2) leftBase(2) rightBase(2)];
end

function angleDegrees = estimateRoadHeadingDegrees(road, roadId, searchRadius)
    centerX = road.col(roadId);
    centerY = road.row(roadId);
    dx = road.col - centerX;
    dy = road.row - centerY;
    nearby = dx .* dx + dy .* dy <= searchRadius * searchRadius;

    if nnz(nearby) < 2
        angleDegrees = 0;
        return;
    end

    x = road.col(nearby);
    y = road.row(nearby);
    x = x - mean(x);
    y = y - mean(y);
    sxx = sum(x .* x);
    syy = sum(y .* y);
    sxy = sum(x .* y);

    if sxx + syy == 0
        angleDegrees = 0;
        return;
    end

    angleDegrees = 0.5 * atan2d(2 * sxy, sxx - syy);

    if cosd(angleDegrees) < 0 || ...
       (abs(cosd(angleDegrees)) < 0.001 && sind(angleDegrees) < 0)
        angleDegrees = angleDegrees + 180;
    end
    angleDegrees = mod(angleDegrees, 360);
end

function [worldX, worldY] = imageToWorld(x, y, mapHeight, pixelScale)
    worldX = (x - 1) * pixelScale;
    worldY = (mapHeight - y) * pixelScale;
end

function text = formatMeters(value)
    text = [formatNumber(value) ' m'];
end

function text = formatNumber(value)
    text = sprintf('%.2f', value);
end

function text = joinLines(lines)
    text = lines{1};
    for i = 2:numel(lines)
        text = [text char(10) lines{i}];
    end
end

function [cropImage, cropAlpha] = circularMapCrop(mapImage, centerX, centerY, radius)
    imageHeight = size(mapImage, 1);
    imageWidth = size(mapImage, 2);
    sideLength = 2 * radius + 1;
    centerRow = round(centerY);
    centerCol = round(centerX);

    cropImage = uint8(255 * ones(sideLength, sideLength, 3));
    cropAlpha = zeros(sideLength, sideLength);

    for row = 1:sideLength
        sourceRow = centerRow - radius + row - 1;
        localRow = row - radius - 1;
        for col = 1:sideLength
            sourceCol = centerCol - radius + col - 1;
            localCol = col - radius - 1;
            insideCircle = localRow * localRow + localCol * localCol <= radius * radius;
            insideMap = sourceRow >= 1 && sourceRow <= imageHeight && ...
                        sourceCol >= 1 && sourceCol <= imageWidth;
            if insideCircle && insideMap
                cropImage(row, col, :) = mapImage(sourceRow, sourceCol, :);
                cropAlpha(row, col) = 1;
            end
        end
    end
end

function [viewImage, viewAlpha] = buildHeadingUpViewImage(mapImage, ivs, ...
                                                          selectedIndex, ...
                                                          viewRadius, ...
                                                          lengthPixels, ...
                                                          widthPixels)
    imageHeight = size(mapImage, 1);
    imageWidth = size(mapImage, 2);
    viewSize = 2 * viewRadius + 1;
    viewCenter = viewRadius + 1;
    centerX = ivs(selectedIndex).x;
    centerY = ivs(selectedIndex).y;
    headingAngle = ivs(selectedIndex).angle;

    heading = [cosd(headingAngle) sind(headingAngle)];
    rightDirection = [-sind(headingAngle) cosd(headingAngle)];
    downDirection = -heading;

    viewImage = uint8(255 * ones(viewSize, viewSize, 3));
    viewAlpha = ones(viewSize, viewSize);

    for row = 1:viewSize
        outputY = row - viewCenter;
        for col = 1:viewSize
            outputX = col - viewCenter;
            sourceX = centerX + outputX * rightDirection(1) + ...
                      outputY * downDirection(1);
            sourceY = centerY + outputX * rightDirection(2) + ...
                      outputY * downDirection(2);
            sourceCol = round(sourceX);
            sourceRow = round(sourceY);
            if sourceRow >= 1 && sourceRow <= imageHeight && ...
               sourceCol >= 1 && sourceCol <= imageWidth
                viewImage(row, col, :) = mapImage(sourceRow, sourceCol, :);
            end
        end
    end

    localIvs = struct('id', {}, 'x', {}, 'y', {}, 'angle', {});
    for i = 1:numel(ivs)
        sourceOffset = [ivs(i).x - centerX, ivs(i).y - centerY];
        localIvs(i).id = ivs(i).id;
        localIvs(i).x = viewCenter + sourceOffset(1) * rightDirection(1) + ...
                        sourceOffset(2) * rightDirection(2);
        localIvs(i).y = viewCenter + sourceOffset(1) * downDirection(1) + ...
                        sourceOffset(2) * downDirection(2);
        ivHeading = [cosd(ivs(i).angle), sind(ivs(i).angle)];
        outputHeadingX = ivHeading(1) * rightDirection(1) + ...
                         ivHeading(2) * rightDirection(2);
        outputHeadingY = ivHeading(1) * downDirection(1) + ...
                         ivHeading(2) * downDirection(2);
        localIvs(i).angle = atan2d(outputHeadingY, outputHeadingX);
    end

    viewImage = drawIvsOnLocalImage(viewImage, viewAlpha, localIvs, ...
                                    lengthPixels, widthPixels);
end

function streetViewImage = buildVirtualStreetViewImage(mapImage, mapHeight, ...
                                                       pixelScale, cameraX, ...
                                                       cameraY, headingAngle, ...
                                                       pitchAngle, cameraHeight, ...
                                                       outputWidth, outputHeight, ...
                                                       focalLength)
    mapImageDouble = double(mapImage);
    streetViewImage = zeros(outputHeight, outputWidth, 3, 'uint8');

    skyColor = [183 220 244];
    outsideColor = [235 235 235];
    centerU = (outputWidth + 1) / 2;
    centerV = (outputHeight + 1) / 2;

    forwardGround = [cosd(headingAngle), -sind(headingAngle), 0];
    rightDirection = [forwardGround(2), -forwardGround(1), 0];
    upWorld = [0 0 1];

    forward = cosd(pitchAngle) * forwardGround - sind(pitchAngle) * upWorld;
    cameraUp = sind(pitchAngle) * forwardGround + cosd(pitchAngle) * upWorld;
    cameraCenter = [cameraX, cameraY, cameraHeight];

    for row = 1:outputHeight
        imageY = row - centerV;
        for col = 1:outputWidth
            imageX = col - centerU;
            ray = focalLength * forward + imageX * rightDirection - ...
                  imageY * cameraUp;

            if ray(3) >= -0.000001
                streetViewImage(row, col, :) = uint8(reshape(skyColor, 1, 1, 3));
                continue;
            end

            scale = -cameraCenter(3) / ray(3);
            if scale <= 0
                streetViewImage(row, col, :) = uint8(reshape(skyColor, 1, 1, 3));
                continue;
            end

            worldPoint = cameraCenter + scale * ray;
            mapCol = worldPoint(1) / pixelScale + 1;
            mapRow = mapHeight - worldPoint(2) / pixelScale;

            if mapRow < 1 || mapRow > size(mapImage, 1) || ...
               mapCol < 1 || mapCol > size(mapImage, 2)
                streetViewImage(row, col, :) = uint8(reshape(outsideColor, 1, 1, 3));
            else
                streetViewImage(row, col, :) = uint8(reshape( ...
                    bilinearSampleRgb(mapImageDouble, mapRow, mapCol), ...
                    1, 1, 3));
            end
        end
    end
end

function color = bilinearSampleRgb(imageData, row, col)
    imageHeight = size(imageData, 1);
    imageWidth = size(imageData, 2);

    row = clampValue(row, 1, imageHeight);
    col = clampValue(col, 1, imageWidth);
    row1 = floor(row);
    col1 = floor(col);
    row2 = min(row1 + 1, imageHeight);
    col2 = min(col1 + 1, imageWidth);
    rowWeight = row - row1;
    colWeight = col - col1;

    color = zeros(1, 3);
    for channel = 1:3
        top = (1 - colWeight) * imageData(row1, col1, channel) + ...
              colWeight * imageData(row1, col2, channel);
        bottom = (1 - colWeight) * imageData(row2, col1, channel) + ...
                 colWeight * imageData(row2, col2, channel);
        color(channel) = (1 - rowWeight) * top + rowWeight * bottom;
    end
end

function cropImage = drawIvsOnMagnifierCrop(cropImage, cropAlpha, ivs, ...
                                            centerX, centerY, radius, ...
                                            lengthPixels, widthPixels)
    localIvs = struct('id', {}, 'x', {}, 'y', {}, 'angle', {});
    for i = 1:numel(ivs)
        localIvs(i).id = ivs(i).id;
        localIvs(i).x = ivs(i).x - centerX + radius + 1;
        localIvs(i).y = ivs(i).y - centerY + radius + 1;
        localIvs(i).angle = ivs(i).angle;
    end
    cropImage = drawIvsOnLocalImage(cropImage, cropAlpha, localIvs, ...
                                    lengthPixels, widthPixels);
end

function imageData = drawIvsOnLocalImage(imageData, imageAlpha, localIvs, ...
                                         lengthPixels, widthPixels)
    fillColor = uint8([255 209 51]);
    edgeColor = uint8([12 12 12]);
    noseColor = uint8([20 24 30]);
    textColor = uint8([0 0 0]);
    [imageHeight, imageWidth, ~] = size(imageData);
    visibleMask = imageAlpha > 0;

    for i = 1:numel(localIvs)
        localCenterX = localIvs(i).x;
        localCenterY = localIvs(i).y;
        reach = sqrt((lengthPixels / 2) ^ 2 + (widthPixels / 2) ^ 2);
        if localCenterX < -reach || localCenterX > imageWidth + reach || ...
           localCenterY < -reach || localCenterY > imageHeight + reach
            continue;
        end

        rectMask = false(imageHeight, imageWidth);
        edgeMask = false(imageHeight, imageWidth);
        noseMask = false(imageHeight, imageWidth);
        u = [cosd(localIvs(i).angle) sind(localIvs(i).angle)];
        v = [-sind(localIvs(i).angle) cosd(localIvs(i).angle)];
        halfLength = lengthPixels / 2;
        halfWidth = widthPixels / 2;
        edgeWidth = 1.4;
        noseLength = max(5, lengthPixels * 0.20);

        minCol = max(1, floor(localCenterX - reach - 2));
        maxCol = min(imageWidth, ceil(localCenterX + reach + 2));
        minRow = max(1, floor(localCenterY - reach - 2));
        maxRow = min(imageHeight, ceil(localCenterY + reach + 2));

        for row = minRow:maxRow
            for col = minCol:maxCol
                dx = col - localCenterX;
                dy = row - localCenterY;
                along = dx * u(1) + dy * u(2);
                lateral = dx * v(1) + dy * v(2);
                insideRect = abs(along) <= halfLength && abs(lateral) <= halfWidth;
                if insideRect && visibleMask(row, col)
                    rectMask(row, col) = true;
                    if halfLength - abs(along) <= edgeWidth || ...
                       halfWidth - abs(lateral) <= edgeWidth
                        edgeMask(row, col) = true;
                    end
                    if along >= halfLength - noseLength && ...
                       abs(lateral) <= (halfLength - along) / noseLength * halfWidth
                        noseMask(row, col) = true;
                    end
                end
            end
        end

        imageData = paintMaskColor(imageData, rectMask, fillColor);
        imageData = paintMaskColor(imageData, noseMask, noseColor);
        imageData = paintMaskColor(imageData, edgeMask, edgeColor);
        imageData = drawNumberGlyph(imageData, imageAlpha, localIvs(i).id, ...
                                    localCenterX, localCenterY, textColor);
    end
end

function imageData = paintMaskColor(imageData, mask, color)
    for channel = 1:3
        layer = imageData(:, :, channel);
        layer(mask) = color(channel);
        imageData(:, :, channel) = layer;
    end
end

function imageData = drawNumberGlyph(imageData, cropAlpha, numberValue, centerX, centerY, color)
    digitText = num2str(numberValue);
    digitWidth = 5;
    digitHeight = 9;
    spacing = 2;
    totalWidth = numel(digitText) * digitWidth + ...
                 (numel(digitText) - 1) * spacing;
    startCol = round(centerX - totalWidth / 2);
    startRow = round(centerY - digitHeight / 2);

    for i = 1:numel(digitText)
        digitCol = startCol + (i - 1) * (digitWidth + spacing);
        imageData = drawDigitGlyph(imageData, cropAlpha, digitText(i), ...
                                   digitCol, startRow, color);
    end
end

function imageData = drawDigitGlyph(imageData, cropAlpha, digitCharacter, ...
                                    leftCol, topRow, color)
    segments = digitSegments(digitCharacter);
    if segments(1)
        imageData = drawGlyphLine(imageData, cropAlpha, ...
                                  topRow, leftCol + 1, topRow, leftCol + 3, color);
    end
    if segments(2)
        imageData = drawGlyphLine(imageData, cropAlpha, ...
                                  topRow + 1, leftCol + 4, topRow + 3, leftCol + 4, color);
    end
    if segments(3)
        imageData = drawGlyphLine(imageData, cropAlpha, ...
                                  topRow + 5, leftCol + 4, topRow + 7, leftCol + 4, color);
    end
    if segments(4)
        imageData = drawGlyphLine(imageData, cropAlpha, ...
                                  topRow + 8, leftCol + 1, topRow + 8, leftCol + 3, color);
    end
    if segments(5)
        imageData = drawGlyphLine(imageData, cropAlpha, ...
                                  topRow + 5, leftCol, topRow + 7, leftCol, color);
    end
    if segments(6)
        imageData = drawGlyphLine(imageData, cropAlpha, ...
                                  topRow + 1, leftCol, topRow + 3, leftCol, color);
    end
    if segments(7)
        imageData = drawGlyphLine(imageData, cropAlpha, ...
                                  topRow + 4, leftCol + 1, topRow + 4, leftCol + 3, color);
    end
end

function segments = digitSegments(digitCharacter)
    segments = false(1, 7);
    if digitCharacter == '0'
        segments([1 2 3 4 5 6]) = true;
    elseif digitCharacter == '1'
        segments([2 3]) = true;
    elseif digitCharacter == '2'
        segments([1 2 7 5 4]) = true;
    elseif digitCharacter == '3'
        segments([1 2 7 3 4]) = true;
    elseif digitCharacter == '4'
        segments([6 7 2 3]) = true;
    elseif digitCharacter == '5'
        segments([1 6 7 3 4]) = true;
    elseif digitCharacter == '6'
        segments([1 6 7 5 3 4]) = true;
    elseif digitCharacter == '7'
        segments([1 2 3]) = true;
    elseif digitCharacter == '8'
        segments(:) = true;
    elseif digitCharacter == '9'
        segments([1 2 3 4 6 7]) = true;
    end
end

function imageData = drawGlyphLine(imageData, cropAlpha, row1, col1, row2, col2, color)
    [height, width, ~] = size(imageData);
    rowStart = max(1, min(row1, row2));
    rowEnd = min(height, max(row1, row2));
    colStart = max(1, min(col1, col2));
    colEnd = min(width, max(col1, col2));

    if rowStart > rowEnd || colStart > colEnd
        return;
    end

    mask = false(height, width);
    for row = rowStart:rowEnd
        for col = colStart:colEnd
            if cropAlpha(row, col) > 0
                mask(row, col) = true;
            end
        end
    end
    imageData = paintMaskColor(imageData, mask, color);
end

function resizedImage = resizeImageNearest(sourceImage, scale)
    sourceHeight = size(sourceImage, 1);
    sourceWidth = size(sourceImage, 2);
    targetHeight = max(1, round(sourceHeight * scale));
    targetWidth = max(1, round(sourceWidth * scale));
    resizedImage = zeros(targetHeight, targetWidth, size(sourceImage, 3), ...
                         'like', sourceImage);

    rowIndex = nearestResizeIndex(sourceHeight, targetHeight);
    colIndex = nearestResizeIndex(sourceWidth, targetWidth);
    for channel = 1:size(sourceImage, 3)
        resizedImage(:, :, channel) = sourceImage(rowIndex, colIndex, channel);
    end
end

function resizedMatrix = resizeMatrixNearest(sourceMatrix, scale)
    sourceHeight = size(sourceMatrix, 1);
    sourceWidth = size(sourceMatrix, 2);
    targetHeight = max(1, round(sourceHeight * scale));
    targetWidth = max(1, round(sourceWidth * scale));
    rowIndex = nearestResizeIndex(sourceHeight, targetHeight);
    colIndex = nearestResizeIndex(sourceWidth, targetWidth);
    resizedMatrix = sourceMatrix(rowIndex, colIndex);
end

function index = nearestResizeIndex(sourceLength, targetLength)
    index = zeros(targetLength, 1);
    for i = 1:targetLength
        mapped = (i - 0.5) * sourceLength / targetLength + 0.5;
        index(i) = round(mapped);
        if index(i) < 1
            index(i) = 1;
        end
        if index(i) > sourceLength
            index(i) = sourceLength;
        end
    end
end

function value = clampValue(value, lowValue, highValue)
    if lowValue > highValue
        return;
    end
    if value < lowValue
        value = lowValue;
    end
    if value > highValue
        value = highValue;
    end
end

function runSelfTest()
    projectDir = fileparts(mfilename('fullpath'));
    mapImage = imread(fullfile(projectDir, 'MapForUI.jpg'));
    mapHeight = size(mapImage, 1);
    mapWidth = size(mapImage, 2);
    road = buildRoadData(projectDir, mapHeight, mapWidth);

    if road.count < 1000
        error('Self-test failed: too few road pixels were extracted.');
    end

    [~, ~, distancePixels, firstRoadId] = nearestRoadPoint(mapWidth * 0.25, ...
                                                           mapHeight * 0.50, road);
    if distancePixels > 80
        error('Self-test failed: nearest-road distance is unexpectedly large.');
    end

    roadHeading = estimateRoadHeadingDegrees(road, firstRoadId, 35);
    if ~isfinite(roadHeading) || roadHeading < 0 || roadHeading >= 360
        error('Self-test failed: road heading estimation is invalid.');
    end

    secondRoadId = min(road.count, firstRoadId + 3000);
    roadDistancePixels = shortestRoadDistancePixels(road, firstRoadId, secondRoadId);
    if ~isfinite(roadDistancePixels) || roadDistancePixels < 0
        error('Self-test failed: road distance is invalid.');
    end

    [roadPathDistancePixels, pathIds] = shortestRoadPathPixels(road, ...
                                                               firstRoadId, ...
                                                               secondRoadId);
    if abs(roadPathDistancePixels - roadDistancePixels) > 0.001 || ...
       isempty(pathIds) || pathIds(1) ~= firstRoadId || ...
       pathIds(end) ~= secondRoadId
        error('Self-test failed: road path reconstruction is invalid.');
    end

    testIvs = struct('id', 1, 'x', mapWidth / 2, 'y', mapHeight / 2, ...
                     'angle', 45, 'patch', [], 'nose', [], 'label', []);
    [cropImage, cropAlpha] = circularMapCrop(mapImage, mapWidth / 2, ...
                                             mapHeight / 2, 75);
    cropImage = drawIvsOnMagnifierCrop(cropImage, cropAlpha, testIvs, ...
                                       mapWidth / 2, mapHeight / 2, 75, ...
                                       (8 / 1.7) * 8, (3 / 1.7) * 8);
    magnifiedImage = resizeImageNearest(cropImage, 1.5);
    magnifiedAlpha = resizeMatrixNearest(cropAlpha, 1.5);
    if size(cropImage, 1) ~= 151 || size(cropImage, 2) ~= 151
        error('Self-test failed: magnifier crop size is invalid.');
    end
    if size(magnifiedImage, 1) ~= size(magnifiedAlpha, 1) || ...
       size(magnifiedImage, 2) ~= size(magnifiedAlpha, 2)
        error('Self-test failed: magnifier image and alpha sizes differ.');
    end

    [headingImage, headingAlpha] = buildHeadingUpViewImage( ...
        mapImage, testIvs, 1, 120, (8 / 1.7) * 8, (3 / 1.7) * 8);
    if size(headingImage, 1) ~= 241 || size(headingImage, 2) ~= 241 || ...
       size(headingAlpha, 1) ~= 241 || size(headingAlpha, 2) ~= 241
        error('Self-test failed: heading-up view size is invalid.');
    end

    [testCameraX, testCameraY] = imageToWorld(road.x(firstRoadId), ...
                                              road.y(firstRoadId), ...
                                              mapHeight, 1.7);
    streetViewImage = buildVirtualStreetViewImage(mapImage, mapHeight, 1.7, ...
                                                  testCameraX, testCameraY, ...
                                                  roadHeading, 15, 10, ...
                                                  420, 280, 180);
    if size(streetViewImage, 1) ~= 280 || size(streetViewImage, 2) ~= 420 || ...
       size(streetViewImage, 3) ~= 3
        error('Self-test failed: street-view image size is invalid.');
    end
    if max(streetViewImage(:)) == min(streetViewImage(:))
        error('Self-test failed: street-view image is blank.');
    end

    disp(['Self-test passed. Road pixels: ' num2str(road.count) ...
          ', sample road distance: ' sprintf('%.2f', roadDistancePixels * 1.7) ...
          ' meters.']);
end
