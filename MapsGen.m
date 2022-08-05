function MapsGen(subjectCount, sessionCount, destinationFolder, names)

%Created on 4AUG2022
%marc.geraerts@uhasselt.be

%Example:
% MapsGen(4,3,'G:\My Drive\My Documents\Profs\Koen\data', {'megapress-ref','megapress'})

%subjectCount: nr of subjects, 4 in the above example
%sessionCount: nr of sessions, 3 in the above example
%destinationFolder: Start folder
%names   Cell array eg {'megapress-ref','megapress', '...'}

folderCount = 1;

folders= {};

for subjectIndex = 1:subjectCount
    subjectnr = ['0' num2str(subjectIndex)];
    subjectnr = ['sub-' subjectnr(end-1:end)];
    subjectFolder = [destinationFolder filesep subjectnr ];
    folders{folderCount} = subjectFolder;
    folderCount = folderCount + 1;

    for sessionIndex = 1: sessionCount
        sessionnr = ['0' num2str(sessionIndex)];
        sessionnr = ['ses-' sessionnr(end-1:end)];
        sessionFolder = [subjectFolder filesep sessionnr];
        folders{folderCount} = sessionFolder;
        folderCount = folderCount + 1;

        for typeIndex = 1:2
            if typeIndex == 1
                folderName= ['anat' filesep subjectnr];
            end
            if typeIndex == 2
                folderName= 'mrs';
            end
            typeFolder = [sessionFolder filesep folderName];
            folders{folderCount} = typeFolder;
            folderCount = folderCount + 1;
            if typeIndex == 2
                for namesIndex = 1:length(names)
                    namesFolder = [typeFolder filesep subjectnr '_' sessionnr '_' names{namesIndex}];
                    folders{folderCount} = namesFolder;
                    folderCount = folderCount + 1;
                end
            end
        end
    end
end


for i = 1:numel(folders)
    mkdir(folders{i})

end

end