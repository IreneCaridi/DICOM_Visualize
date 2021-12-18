            path=uigetdir('SEO');
            [V,spatial,~]=dicomreadVolume(fullfile(path));
            V=squeeze(V);
            
            if app.FullbodyButton.Value==true
                figure
                vol1=volshow(V);
                vol1.BackgroundColor='white';
                vol1.ScaleFactors=[spatial.PixelSpacings(1, 1), spatial.PixelSpacings(1, 2)  abs(spatial.PatientPositions(1,3)-spatial.PatientPositions(3,3))];
                vol1.Isovalue=0.13;
                vol1.Renderer='Isosurface';

            elseif app.BonesButton.Value==true
                figure
                vol1=volshow(V);
                vol1.BackgroundColor='white';
                vol1.ScaleFactors=[spatial.PixelSpacings(1, 1), spatial.PixelSpacings(1, 2)  abs(spatial.PatientPositions(1,3)-spatial.PatientPositions(3,3))]; %resize the image
                vol1.Isovalue=0.274;
                vol1.Renderer='Isosurface';

            elseif app.TopBottonButton.Value==true
                figure
                for i=1:246
                    subplot(16,16,i)
                    XY = V(:,:,i);
                    imshow(XY,[],'Border','tight');
                end

                figure
                vol3=sliceViewer(V);

            elseif app.LateralButton.Value==true
                figure
                for ii=1:512
                    subplot(23,23,ii)
                    XZ = squeeze(V(ii,:,:));
                    imshow(XZ,[],'Border','tight');
                end
                
            elseif app.FrontBackButton.Value==true
                figure
                for iii=1:512
                    subplot(23,23,iii)
                    YZ = squeeze(V(:,iii,:));
                    imshow(YZ,[],'Border','tight');
                end
            end